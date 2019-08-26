/**
 **********************************************************************************************************************
 * @file       Drag_n_Drop.pde
 * @author     Elie Hymowitz, Steve Ding, Colin Gallacher
 * @version    V3.0.0
 * @date       21-September-2018
 * @brief      Drag and Drop haptic example using 2D physics engine 
 **********************************************************************************************************************
 * @attention
 *
 *
 **********************************************************************************************************************
 */



/* library imports *****************************************************************************************************/ 
import processing.serial.*;
import static java.util.concurrent.TimeUnit.*;
import java.util.concurrent.*;
/* end library imports *************************************************************************************************/  



/* scheduler definition ************************************************************************************************/ 
private final ScheduledExecutorService scheduler      = Executors.newScheduledThreadPool(1);
/* end scheduler definition ********************************************************************************************/  



/* device block definitions ********************************************************************************************/
Board             haplyBoard;
Device            widgetOne;
Mechanisms        pantograph;

byte              widgetOneID                         = 5;
int               CW                                  = 0;
int               CCW                                 = 1;
boolean           rendering_force                     = false;
/* end device block definition *****************************************************************************************/



/* framerate definition ************************************************************************************************/
long              baseFrameRate                       = 120;
/* end framerate definition ********************************************************************************************/ 



/* elements definition *************************************************************************************************/

/* Screen and world setup parameters */
float             pixelsPerCentimeter                 = 40.0;

/* data for a 2DOF device */
/* joint space */
PVector           angles                              = new PVector(0, 0);
PVector           torques                             = new PVector(0, 0);

/* task space */
PVector           pos_ee                              = new PVector(0, 0);
PVector           f_ee                                = new PVector(0, 0); 

/* World boundaries in centimeters*/
FWorld            world;
float             worldWidth                          = 25.0;  
float             worldHeight                         = 10.0;

float             edgeTopLeftX                        = 0.0; 
float             edgeTopLeftY                        = 0.0; 
float             edgeBottomRightX                    = worldWidth; 
float             edgeBottomRightY                    = worldHeight;

/* list of contacts with avatar */
ArrayList         <FContact> touchingAvatar;

/* joints to be created for avatar */
boolean           jointCreated                        = false;
FDistanceJoint    d1;

/* Initialization of virtual tool */
HVirtualCoupling  s;
FCircle           h1; // grab radius

/* define region seperator boxes */
FBox              b1;
FBox              b2;
FBox              b3;

/* define water trap */
FBox              f1;

/* define goalie variables */
FBox              g1;
FPrismaticJoint   p1;
boolean           upOrDown                            = false;
float             gTime;
float             gTimeLast;
float             gTimeLimit                          = 1500;

/* define beads total */
int               beads                               = 45;

/* define linkage state */
boolean           canLink                             = false;

/* Sensor data */
float[]           sensorData;

/* end elements definition *********************************************************************************************/  



/* setup section *******************************************************************************************************/
void setup(){
  /* put setup code here, run once: */
  
  /* screen size definition */
  size(1000, 400);
  
  /* device setup */
  
  /**  
   * The board declaration needs to be changed depending on which USB serial port the Haply board is connected.
   * In the base example, a connection is setup to the first detected serial device, this parameter can be changed
   * to explicitly state the serial port will look like the following for different OS:
   *
   *      windows:      haplyBoard = new Board(this, "COM10", 0);
   *      linux:        haplyBoard = new Board(this, "/dev/ttyUSB0", 0);
   *      mac:          haplyBoard = new Board(this, "/dev/cu.usbmodem1411", 0);
   */
  haplyBoard          = new Board(this, Serial.list()[0], 0);
  widgetOne           = new Device(widgetOneID, haplyBoard);
  pantograph          = new Pantograph();
  
  widgetOne.set_mechanism(pantograph);
  
  widgetOne.add_actuator(1, CW, 1);
  widgetOne.add_actuator(2, CW, 2);
 
  widgetOne.add_encoder(1, CW, 180, 13824, 1);
  widgetOne.add_encoder(2, CW, 0, 13824, 2);
  
  widgetOne.add_analog_sensor("A1");
  
  widgetOne.device_set_parameters();
  
  
  /* 2D physics scaling and world creation */
  hAPI_Fisica.init(this); 
  hAPI_Fisica.setScale(pixelsPerCentimeter); 
  world               = new FWorld();
  
  
  /* Barrier box for beads */
  b1                  = new FBox(1, 8);
  b1.setPosition(6.5, 10);
  b1.setFill(0, 0, 0);
  b1.setStatic(true);
  world.add(b1);
  
  
  /* Barrier box for container */
  b2                  = new FBox(1, 8);
  b2.setPosition(18, 10);
  b2.setFill(0, 0, 0);
  b2.setStatic(true);
  world.add(b2);
  
  
  /* Barrier box for water */
  b3                  = new FBox(1,8);
  b3.setPosition(12.25, 10);
  b3.setFill(0, 0, 0);
  b3.setStatic(true);
  world.add(b3);
  
  
  /* Water Bucket */
  f1                  = new FBox(4.75, 2);
  f1.setPosition(15.125, 8.25);
  f1.setFill(150, 150, 255, 80);
  f1.setDensity(50);
  f1.setSensor(true);
  f1.setNoStroke();
  f1.setStatic(true);
  f1.setName("Water");
  world.add(f1);
  
  
  /* Goalie box definition */
  g1                  = new FBox(1, 2);
  g1.setFill(150, 0, 0);
  g1.setPosition(18, 1.5);
  g1.setDensity(40);
  world.add(g1);
  p1 = new FPrismaticJoint(g1, b2);
  p1.setNoStroke();
  world.add(p1);
  
  
  /* create beads pile */
  float size, x, y, r, g, b;
  
  FCircle bead;
  
  for(int i = 0; i < beads; i++){
    size              = random(0.1, 1);
    r                 = random(0, 256);
    g                 = random(0, 256);
    b                 = random(0, 256);
    x                 = random(1.5, 5);
    y                 = random(4, 9);
    
    bead              = new FCircle(size);
    bead.setPosition(x, y);
    bead.setFill(r, g, b);
    bead.setFriction(20);
    bead.setDensity(40*size);
    bead.setHaptic(true);
    bead.setName("FCircle");
    world.add(bead);
  }
  
  
  /* Haptic Tool Initialization */
  s                   = new HVirtualCoupling((0.25)); 
  s.h_avatar.setDensity(7);
  s.h_avatar.setFill(255,0,0); 
  s.init(world, edgeTopLeftX+worldWidth/2, edgeTopLeftY+2);
  
  h1                  = new FCircle(0.75);
  h1.setDensity(0);
  h1.setNoStroke();
  h1.setSensor(true);
  h1.setFill(0, 0, 0, 50);
  h1.setPosition(3, 3);
  world.add(h1);
  
  
  /* world conditions setup */ 
  world.setGravity((0.0), (300.0)); //1000 cm/(s^2)
  world.setEdges((edgeTopLeftX), (edgeTopLeftY), (edgeBottomRightX), (edgeBottomRightY)); 
  world.setEdgesRestitution(.4);
  world.setEdgesFriction(0.5);
  
  world.draw();
  
  
  /* setup framerate speed */
  frameRate(baseFrameRate);
  
  
  /* setup simulation thread to run at 1kHz */ 
  SimulationThread st = new SimulationThread();
  scheduler.scheduleAtFixedRate(st, 1, 1, MILLISECONDS);
}
/* end setup section ***************************************************************************************************/



/* draw section ********************************************************************************************************/
void draw(){
  /* put graphical code here, runs repeatedly at defined framerate in setup, else default at 60fps: */
  background(255);
  
  gTime = millis();
  if (gTime - gTimeLast > gTimeLimit){
    if (abs(g1.getVelocityY())      <5){
      upOrDown =! upOrDown;
      gTimeLast = gTime;
    }
  }
  if(upOrDown == false){
    g1.setVelocity(0,5);
  }
  else{
    g1.setVelocity(0,-5);
  }
  
  world.draw();  
}
/* end draw section ****************************************************************************************************/



/* simulation section **************************************************************************************************/
class SimulationThread implements Runnable{
  
  public void run(){
    /* put haptic simulation code here, runs repeatedly at 1kHz as defined in setup */
    
    rendering_force = true;
    
    if(haplyBoard.data_available()){
      
      /* GET END-EFFECTOR STATE (TASK SPACE) */
      widgetOne.device_read_data();
    
      angles.set(widgetOne.get_device_angles()); 
      pos_ee.set(widgetOne.get_device_position(angles.array()));
      pos_ee.set(pos_ee.copy().mult(200));  
    }
    
    s.setToolPosition(edgeTopLeftX+worldWidth/2-(pos_ee).x+2, edgeTopLeftY+(pos_ee).y-7); 
    s.updateCouplingForce();
    f_ee.set(-s.getVCforceX(), s.getVCforceY());
 
    f_ee.div(20000); //
    torques.set(widgetOne.set_device_torques(f_ee.array()));
    widgetOne.device_write_torques();
  
    h1.setPosition(s.h_avatar.getX(), s.h_avatar.getY());
  
    joint_Formation();
  
    world.step(1.0f/1000.0f);
  
    rendering_force = false;
  }
}
/* end simulation section **********************************************************************************************/



/* helper functions section, place helper functions here ***************************************************************/
void joint_Formation(){
  
  boolean touchingCircle = false;
  boolean buttonPressed = false;
  
  touchingAvatar = h1.getContacts();
  for(int i = 0; i < touchingAvatar.size(); i++){
    if((touchingAvatar.get(i).getBody1() != s.h_tool) && (touchingAvatar.get(i).getBody1().getName() == "FCircle")){
      touchingCircle = true;
    }
  }
  
  sensorData = widgetOne.get_sensor_data();
  if(sensorData[0] > 800){
    buttonPressed = true;
  }
  
  
  if(canLink && buttonPressed && touchingCircle){
    canLink = false;
    for(int i = 0; i < touchingAvatar.size(); i++){
      if((touchingAvatar.get(i).getBody1() != s.h_tool) && (touchingAvatar.get(i).getBody1().getName() == "FCircle")){
        if(!jointCreated){
          d1 = new FDistanceJoint(s.h_avatar, touchingAvatar.get(i).getBody1());
          d1.setDamping(10);
          d1.setFrequency(80);
          d1.setLength(3);
          world.add(d1);
          jointCreated = true;
        }
      }
    }
  }
  else if(buttonPressed && !touchingCircle){
    canLink = false;
  }
  else if(!buttonPressed && touchingCircle){
    canLink = true;
    if(jointCreated){
      world.remove(d1);
      jointCreated = false;
    }
  }
  else if(!buttonPressed && !touchingCircle){
    canLink = true;
    if(jointCreated){
      world.remove(d1);
      jointCreated = false;
    }
  }
}


void contactPersisted(FContact contact) {
  float size;
  float b_s;
  float bm_d;
  
  if(contact.contains("Water","FCircle")){
    size = 2*sqrt(contact.getBody2().getMass()/contact.getBody2().getDensity()/3.1415);    
    bm_d = contact.getBody2().getY()-contact.getBody1().getY()+f1.getHeight()/2; // vertical distance between middle of ball and top of water
    
    if (bm_d + size/2 >= size){ //if whole ball or more is submerged
      b_s = size; // amount of ball submerged is ball size
    }
    else { //if ball is partially submerged
      b_s = bm_d + size/2; // amount of ball submerged is vertical distance between middle of ball and top of water + half of ball size
    } 
    contact.getBody2().addForce(0,contact.getBody1().getDensity()*sq(b_s)*300*-1); // 300 is gravity force
    contact.getBody2().setDamping(10);
  }
}


void contactEnded(FContact contact) {
  if(contact.contains("Water", "FCircle")){
    contact.getBody2().setDamping(0);
  }
}
/* end helper functions section ****************************************************************************************/