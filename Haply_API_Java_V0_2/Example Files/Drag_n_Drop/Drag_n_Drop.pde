import processing.serial.*;
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

/* Sensor data */
float[]           sensorData;

/* generic data for a 2DOF device */
/* joint space */
PVector           angles                    = new PVector(0, 0);
PVector           torques                   = new PVector(0, 0);

/* task space */
PVector           pos_ee                    = new PVector(0, 0);
PVector           f_ee                      = new PVector(0, 0); 

/* Screen and world setup parameters */ 
float pixelsPerCentimeter= 40.0; 

/* World boundaries */ 
FWorld world;
float worldWidth = 25.0; 
float worldHeight = 10.0; 

float edgeTopLeftX = 0.0; 
float edgeTopLeftY = 0.0; 
float edgeBottomRightX = worldWidth; 
float edgeBottomRightY = worldHeight; 

/* list of contacts with avatar */
ArrayList <FContact> touchingAvatar;

/* joints to be created for avatar */
boolean jointCreated = false;
FDistanceJoint d1;

/* Initialization of virtual tool */
HVirtualCoupling s;
FCircle h1; // grab radius

/* define region seperators  */
FBox b1;
FBox b2;
FBox b3;

/* define water trap */
FBox f1;

/* define goalie variables */
FBox g1;
FPrismaticJoint p1;
boolean upOrDown = false;
float gTime;
float gTimeLast;
float gTimeLimit = 1500;

/* define beads */
int beads = 45;
FCircle bead; //This can be in setup too!

/* define linkage state */
boolean canLink = false;


void setup(){
  size(1000, 400);
  
  /* Board and Device setup */
  haplyBoard = new Board(this, Serial.list()[1], 0);
  
  pantograph = new Pantagraph();
  
  widgetOne = new Device(widgetOneID, haplyBoard);
  
  widgetOne.set_mechanism(pantograph);
  
  widgetOne.add_actuator(1, CW, 1);
  widgetOne.add_actuator(2, CCW, 2);
  
  widgetOne.add_encoder(1, CW, 180, 13824, 1);
  widgetOne.add_encoder(2, CCW, 0, 13824, 2);
  
  widgetOne.add_analog_sensor("A0");
  
  widgetOne.device_set_parameters();
  
  
  /* World paramters initialization */
  hAPI_Fisica.init(this);
  hAPI_Fisica.setScale(pixelsPerCentimeter); 
  world = new FWorld();
  
  
  /* Barrier for beads */
  b1 = new FBox(1, 8);
  b1.setPosition(6.5, 10);
  b1.setFill(0, 0, 0);
  b1.setStatic(true);
  world.add(b1);
  
  
  /* Barrier for container */
  b2 = new FBox(1, 8);
  b2.setPosition(18, 10);
  //b2.setDensity(0);
  b2.setFill(0, 0, 0);
  b2.setStatic(true);
  world.add(b2);
  
  /* Barrier for water */
  b3 = new FBox(1,8);
  b3.setPosition(12.25, 10);
  b3.setFill(0, 0, 0);
  b3.setStatic(true);
  world.add(b3);
  
  
  /* Water Bucket */
  f1 = new FBox(4.75, 2);
  f1.setPosition(15.125, 8.25);
  f1.setFill(150, 150, 255, 80);
  f1.setDensity(50);
  f1.setSensor(true);
  f1.setNoStroke();
  f1.setStatic(true);
  f1.setName("Water");
  world.add(f1);
  
  
  /* Goalie definition */
  g1 = new FBox(1, 2);
  g1.setFill(150, 0, 0);
  g1.setPosition(18, 1.5);
  g1.setDensity(40);
  world.add(g1);
  p1 = new FPrismaticJoint(g1, b2);
  p1.setNoStroke();
  world.add(p1);
  
  
  /* create beads pile */
  float size, x, y, r, g, b;
  
  for(int i = 0; i < beads; i++){
    size = random(0.1, 1);
    r = random(0, 256);
    g = random(0, 256);
    b = random(0, 256);
    x = random(1.5, 5);
    y = random(4, 9);
    
    bead = new FCircle(size);
    bead.setPosition(x, y);
    bead.setFill(r, g, b);
    bead.setFriction(20);
    bead.setDensity(40*size);
    bead.setHaptic(true);
    bead.setName("FCircle");
    world.add(bead);
  }
  
  
  /* Haptic Tool Initialization   */
  s= new HVirtualCoupling((0.25)); 
  s.h_avatar.setDensity(7);
  s.h_avatar.setFill(255,0,0); 
  s.init(world, edgeTopLeftX+worldWidth/2, edgeTopLeftY+2);
  
  h1 = new FCircle(0.75);
  h1.setDensity(0);
  h1.setNoStroke();
  h1.setSensor(true);
  h1.setFill(0, 0, 0, 50);
  h1.setPosition(3, 3);
  world.add(h1);
  
  
  /*world Setup*/ 
  world.setGravity((0.0), (300.0)); //1000 cm/(s^2)
  world.setEdges((edgeTopLeftX), (edgeTopLeftY), (edgeBottomRightX), (edgeBottomRightY)); 
  world.setEdgesRestitution(.4);
  world.setEdgesFriction(0.5);
  
  world.draw();
  
  haptic_timer = CountdownTimerService.getNewCountdownTimer(this).configure(SIMULATION_PERIOD, HOUR_IN_MILLIS).start(); 
  
  frameRate(60); 
  
}


void draw(){
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


void onTickEvent(CountdownTimer t, long timeLeftUntilFinish){
  
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
 
  f_ee.div(15000); //
  torques.set(widgetOne.set_device_torques(f_ee.array()));
  widgetOne.device_write_torques();
  
  h1.setPosition(s.h_avatar.getX(), s.h_avatar.getY());
  
  joint_Formation();
  
  world.step(dt);
  
  rendering_force = false;
}


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




/**
 * haptic timer reset
 */
void onFinishEvent(CountdownTimer t){
  println("Resetting timer...");
  haptic_timer.reset();
  haptic_timer = CountdownTimerService.getNewCountdownTimer(this).configure(SIMULATION_PERIOD, HOUR_IN_MILLIS).start();
} 
