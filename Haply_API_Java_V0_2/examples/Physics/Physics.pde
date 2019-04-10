import processing.serial.*;
import java.util.Random;
import com.dhchoi.CountdownTimer;
import com.dhchoi.CountdownTimerService;

/* Device block definitions ********************************************************************************************/
Device            widgetOne;
byte              widgetOneID                     = 5;
Board             haplyBoard;
Mechanisms        pantograph;
boolean           rendering_force                 = false;
int               CW = 1;
int               CCW = 0;

/* Simulation Speed Parameters ****************************************************************************************/
final long        SIMULATION_PERIOD          = 1; //ms
final long        HOUR_IN_MILLIS             = 36000000;
CountdownTimer    haptic_timer;
float             dt                        = SIMULATION_PERIOD/1000.0;

// data from Arduino
float[] sensorData; 

/* generic data for a 2DOF device */
/* joint space */
PVector           angles                    = new PVector(0, 0);
PVector           torques                   = new PVector(0, 0);

/* task space */
PVector           pos_ee                    = new PVector(0, 0);
PVector           f_ee                      = new PVector(0, 0); 

/*Screen and world setup parameters*/ 
float pixelsPerCentimeter= 40.0; 

/* World boundaries */ 
FWorld world;
float worldWidth = 25.0; 
float worldHeight = 20.0; 

float edgeTopLeftX = 0.0; 
float edgeTopLeftY = 0.0; 
float edgeBottomRightX = worldWidth; 
float edgeBottomRightY = worldHeight; 

// Array list of things touching avatar

ArrayList <FContact> touching_avatar;
ArrayList <FContact> touching_avatar_draw;

// joints to be created

FDistanceJoint d1;
boolean joint_created = false;

/* Initialization of the virtual tool */ 

HVirtualCoupling s;  

// Section Borders

FBox b1;
FBox b2;

// Beads Graphic objects array
FCircle[] beads = new FCircle[3];

// Transverse Wave Medium
FCircle[] t1 = new FCircle[96];
FDistanceJoint j1;

// Longitudinal Wave Medium
int cols = 20; //circles in a column
int rows = 20; //circles in a row
FCircle[][] t2 = new FCircle[cols][rows];
FBox h1;
FBox h2;
FBox h3;
FBox h4;
FDistanceJoint j2;
FPrismaticJoint j3;

// Free/ Fixed end button
FBox h5;
FPrismaticJoint j4;
FBox h6;
boolean fixed_end = false;

// State of size
int state = 1;
int stateOld = 1;

// data average
int[] sensorData_array = new int[10];
int sensor_data;

void setup() {
  size(1000, 800);
  
 // Board and Device
  haplyBoard = new Board(this, Serial.list()[1], 0);
  
  pantograph = new Pantagraph();
  
  widgetOne = new Device(widgetOneID, haplyBoard);
  
  widgetOne.set_mechanism(pantograph);
  
  widgetOne.add_actuator(1, CW, 1);
  widgetOne.add_actuator(2, CCW, 2);
  
  widgetOne.add_encoder(1, CW, 180, 13824, 1);
  widgetOne.add_encoder(2, CCW, 0, 13824, 2);
  
  widgetOne.add_analog_sensor("A1");
  
  widgetOne.device_set_parameters();

/*Initialize the world parameters*/ 

  hAPI_Fisica.init(this);
  hAPI_Fisica.setScale(pixelsPerCentimeter); 
  world = new FWorld();
  
  // Borders
  
  FBox b1 = new FBox(24, 0.5);
  b1.setPosition(11.85, 6.6);
  b1.setStatic(true);
  b1.setFill(0, 0, 0);
  world.add(b1);
   
  FBox b2 = new FBox(24, 0.5);
  b2.setPosition(11.85, 13.2);
  b2.setStatic(true);
  b2.setFill(0, 0, 0);
  world.add(b2);
  
// create pile of beads

  for (int i=beads.length; i > 0; i--) 
  {
    beads[i-1] = new FCircle(map(i,0,3,0.3,1.5));
    beads[i-1].setPosition(10, map(i, 0, beads.length, 0.5, 5));
    beads[i-1].setFill(50,50,50);
    beads[i-1].setFriction(0);
    beads[i-1].setDensity(50);
    beads[i-1].setRestitution(1.02);
    beads[i-1].setHaptic(true, 0, 0);
    beads[i-1].setVelocity(5,0);
    beads[i-1].setName("FCircle");
    world.add(beads[i-1]);
  }
  
// create Transverse Wave Generator
  for (int i=t1.length-1; i > 0; i--) 
  {
    t1[i] = new FCircle(0.2);
    t1[i].setPosition(map(i, t1.length-1, 1, 1, 23), 11);
    t1[i].setFill(255,200,230);
    t1[i].setNoStroke();
    t1[i].setFriction(0.01);
    t1[i].setRestitution(1);
    t1[i].setDensity(100);
    t1[i].setName("TWave");
    if (i == t1.length-1)
    {
      t1[i].setStatic(true);
    }
    world.add(t1[i]);
  } 
  
  for (int i = t1.length-1; i > 1; i--)
  {
    j1 = new FDistanceJoint(t1[i], t1[i-1]);
    j1.setDamping(0.1);
    j1.setFrequency(25);
    world.add(j1); 
  }
  
// create Longitudinal Waves Generator
 
  for (int i=0; i<cols; i++) 
  { // y axis
    for (int j=0; j < rows; j++)
    { // x axis
      t2[i][j] = new FCircle(0.12);
      t2[i][j].setPosition(map(j, 0, rows-1, worldWidth/2-11, worldWidth/2+11), map(i, 0, cols-1, 13.5, 18.8));
      t2[i][j].setFill(0, 0, 0);
      t2[i][j].setRestitution(1.02);
      t2[i][j].setFriction(0);
      t2[i][j].setName("LWave"); 
      world.add(t2[i][j]);
      if(i == cols-1 || i == 0 || i ==1)
      {
        t2[i][j].setStatic(true);
      }
    }
  }
    
  for (int k = cols-1 ; k > 0 ; k--)
  {
    for (int l=0; l <rows; l++)
    { // x axis
      j2 = new FDistanceJoint(t2[k][l],t2[k-1][l]);
      j2.setLength(10);
      j2.setDamping(1);
      j2.setNoStroke();
      world.add(j2);
    }
  }
 
   FBox h1 = new FBox(22.75, 0.2);
   h1.setPosition(worldWidth/2, 14);
   h1.setFill(0,0,0);
   h1.setRestitution(1);
   h1.setFriction(50);
   h1.setRotatable(false);
   h1.setDensity(100);
   world.add(h1);
   
   FBox h2 = new FBox(1, 5);
   h2.setPosition(0.7, 18.7);
   h2.setStatic(true);
   h2.setFill(0,0,0);
   world.add(h2);
  
   FBox h3 = new FBox(1, 5);
   h3.setPosition(24.3, 18.7);
   h3.setStatic(true);
   h3.setFill(0,0,0);
   world.add(h3);
   
   FBox h4 = new FBox(1,0.5);
   h4.setPosition(worldWidth/2,13.5);
   h4.setStatic(true);
   h4.setFill(0,0,0);
   world.add(h4);
    
  FBox h5 = new FBox(0.5, 0.5);
  h5.setPosition(23, 11);
  h5.setSensor(true);
  h5.setStatic(true);
  h5.setRotatable(false);
  world.add(h5);
  
  FPrismaticJoint j4 = new FPrismaticJoint(h5,t1[1]);
  j4.setEnableLimit(fixed_end);
  j4.setLowerTranslation(0);
  j4.setUpperTranslation(0);
  world.add(j4);
  
  FBox h6 = new FBox(0.5, 0.5);
  h6.setPosition(1, 11);
  h6.setSensor(true);
  h6.setStatic(true);
  h6.setRotatable(false);
  world.add(h6);
  
  FPrismaticJoint j3 = new FPrismaticJoint(h1, h4);
  world.add(j3);
   
    /* Haptic Tool Initialization   */

  s= new HVirtualCoupling((0.3)); 
  s.h_avatar.setDensity(8);
  s.h_avatar.setDamping(50);
  s.h_avatar.setFill(255,0,0); 
  s.init(world, edgeTopLeftX+worldWidth/2, edgeTopLeftY+2);
  
   /*world Setup*/ 
  world.setGravity(0,0);
  world.setEdges((edgeTopLeftX), (edgeTopLeftY), (edgeBottomRightX), (edgeBottomRightY)); 
  world.setEdgesRestitution(.4);
  world.setEdgesFriction(0.5);
  
   world.draw(); 
  
  haptic_timer = CountdownTimerService.getNewCountdownTimer(this).configure(SIMULATION_PERIOD, HOUR_IN_MILLIS).start(); 
  
  frameRate(60); 

}

void draw() {
  background(255);
   
  if(!rendering_force){
    
    //s.drawContactVectors(this); 
    
   }
     sensor_avg(int(sensorData[0]));
  avatarSizeState(sensor_data);
   
    world.draw();
    //world.drawDebug(); 
  
}

/**********************************************************************************************************************
 * Haptics simulation event, engages state of physical mechanism, calculates and updates physics simulation conditions
 **********************************************************************************************************************/ 
void onTickEvent(CountdownTimer t, long timeLeftUntilFinish)
{
  sensorData = widgetOne.get_sensor_data();
   
  rendering_force = true;
   
  if (haplyBoard.data_available()) 
  {
    /* GET END-EFFECTOR STATE (TASK SPACE) */
        
      widgetOne.device_read_data();
        
    angles.set(widgetOne.get_device_angles()); 
    pos_ee.set(widgetOne.get_device_position(angles.array()));
    pos_ee.set(pos_ee.copy().mult(275)); 
    
  }
  
  //Changing Avatar in upper section
  if (state != stateOld)
  {
    switch(state)
    {
      case 1: 
      
        s.h_avatar.setSize(0.3);  
        stateOld = state;
        break;
      case 2: 
        s.h_avatar.setSize(0.7);
        stateOld = state;
        break;
      case 3:
        s.h_avatar.setSize(1.0); 
        stateOld = state;
        break;
      case 4:
        s.h_avatar.setSize(1.3); 
        stateOld = state;
        break;
      case 5:
        s.h_avatar.setSize(1.5); 
        stateOld = state;
        break;
      default:
        stateOld = state;
        break;
    }
  }
      
  s.setToolPosition(edgeTopLeftX+worldWidth/2-(pos_ee).x+2, edgeTopLeftY+(pos_ee).y-9.5); 
  s.updateCouplingForce();
  f_ee.set(-s.getVCforceX(), s.getVCforceY());
 
  f_ee.div(15000); //
  torques.set(widgetOne.set_device_torques(f_ee.array()));
  widgetOne.device_write_torques();
    
  world.step(dt);
  
  rendering_force = false;
  //avatar position for debugging
  //println("X, Y");
  //print(s.h_avatar.getX());
  //print(" ");
  //println(s.h_avatar.getY());
  
    //quitting with q
  if (keyPressed)
  {
    if (key == 'q' || key == 'Q')
    {
      f_ee.set(0, 0);
      torques.set(widgetOne.set_device_torques(f_ee.array()));
      widgetOne.device_write_torques();
      exit();
    }
  }

}

/* Timer control event functions **************************************************************************************/

/**
 * haptic timer reset
 */
void onFinishEvent(CountdownTimer t){
  println("Resetting timer...");
  haptic_timer.reset();
  haptic_timer = CountdownTimerService.getNewCountdownTimer(this).configure(SIMULATION_PERIOD, HOUR_IN_MILLIS).start();

}


void avatarSizeState(int a)
{
  // change state of avatar
  if (a<575 && a>400 && s.h_avatar.getY() < 6.6)
  {
    state = 1;
  }
  if (s.h_avatar.getY() > 6.6)
  {
    state = 1;
  }
  if (a<700 && a>575 && s.h_avatar.getY() < 5.6 && s.h_avatar.getY() > 1.5 && s.h_avatar.getX() > 1.5 && s.h_avatar.getX() < worldWidth - 1.5)
  {
    state = 2;
  }
  if (a<800 && a>700 && s.h_avatar.getY() < 5.6 && s.h_avatar.getY() > 1.5 && s.h_avatar.getX() > 1.5 && s.h_avatar.getX() < worldWidth - 1.5)
  {
    state = 3;
  }
  if (a<900 && a>800 && s.h_avatar.getY() < 5.6 && s.h_avatar.getY() > 1.5 && s.h_avatar.getX() > 1.5 && s.h_avatar.getX() < worldWidth - 1.5)
  {
    state = 4;
  }
  if (a<1100 && a>900 && s.h_avatar.getY() < 5.6 && s.h_avatar.getY() > 1.5 && s.h_avatar.getX() > 1.5 && s.h_avatar.getX() < worldWidth - 1.5)
  {
    state = 5;
  }
}

void sensor_avg(int data){   
    for (int i = sensorData_array.length-2; i >= 0; i--)
    {
      sensorData_array[i+1] = sensorData_array[i];
    }
    sensorData_array[0] = data;
    
    int sum = 0;
    for (int j = 0; j < sensorData_array.length; j++)
    {
      sum = sum + sensorData_array[j];
    }
    sensor_data = sum/sensorData_array.length;
    //println(sensor_data);
}
  
