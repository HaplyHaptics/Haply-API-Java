 /* library imports *****************************************************************************************************/ 
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

/* generic data for a 2DOF device */
/* joint space */
PVector           angles                    = new PVector(0, 0);
PVector           torques                   = new PVector(0, 0);

/* task space */
PVector           pos_ee                    = new PVector(0, 0);
PVector           f_ee                      = new PVector(0, 0); 

/* Flicker timer */
float             timer_last                = 0.0;
boolean           barriers_up               = true;

/* Screen and world setup parameters */
float pixelsPerCentimeter = 40.0;

/* World boundaries */
FWorld world;
float worldWidth = 25.0;  
float worldHeight = 10.0; 

float edgeTopLeftX = 0.0; 
float edgeTopLeftY = 0.0; 
float edgeBottomRightX = worldWidth; 
float edgeBottomRightY = worldHeight;

/* Initialization of virtual tool */
HVirtualCoupling s;

/* define maze blocks */
FBox b1;
FBox b2;
FBox b3;
FBox b4;
FBox b5;
FBox l1;

/* define start and stop button */
FCircle c1;
FCircle c2;

/* define game ball */
FCircle g2;
FBox    g1;

/* define game start */
boolean gameStart = false;

PFont f;

void setup(){
  size(1000, 400);
  
   // Board and Device
  haplyBoard = new Board(this, Serial.list()[1], 0);
  
  pantograph = new Pantagraph();
  
  widgetOne = new Device(widgetOneID, haplyBoard);
  
  widgetOne.set_mechanism(pantograph);
  
  widgetOne.add_actuator(1, CW, 1);
  widgetOne.add_actuator(2, CCW, 2);
  
  widgetOne.add_encoder(1, CW, 180, 13824, 1);
  widgetOne.add_encoder(2, CCW, 0, 13824, 2);
  
  widgetOne.device_set_parameters();
  
  hAPI_Fisica.init(this); 
  hAPI_Fisica.setScale(pixelsPerCentimeter); 
  world = new FWorld();
  
   // Set Barriers
  b1 = new FBox(1.0, 5.0);
  b1.setPosition(edgeTopLeftX+worldWidth/4.0-2, edgeTopLeftY+worldHeight/2+1.5); 
  b1.setFill(0);
  b1.setNoStroke();
  b1.setStaticBody(true);
  world.add(b1);
  
  b2 = new FBox(1.0, 5.0);
  b2.setPosition(edgeTopLeftX+worldWidth/4.0, edgeTopLeftY+worldHeight/2-1.5); 
  b2.setFill(0);
  b2.setNoStroke();
  b2.setStaticBody(true);
  world.add(b2);
   
  b3 = new FBox(1.0, 3.0);
  b3.setPosition(edgeTopLeftX+worldWidth/4.0+8, edgeTopLeftY+worldHeight/2+1.5); 
  b3.setFill(0);
  b3.setNoStroke();
  b3.setStaticBody(true);
  world.add(b3);
  
  b4 = new FBox(1.0, 5.0);
  b4.setPosition(edgeTopLeftX+worldWidth/4.0+12, edgeTopLeftY+worldHeight/2-1.5); 
  b4.setFill(0);
  b4.setNoStroke();
  b4.setStaticBody(true);
  world.add(b4);
   
  b5 = new FBox(3.0, 2.0);
  b5.setPosition(edgeTopLeftX+worldWidth/2.0, edgeTopLeftY+worldHeight/2.0+2);
  b5.setFill(0);
  b5.setNoStroke();
  b5.setStaticBody(true);
  world.add(b5);
   
  // Set Viscous Layer
  l1 = new FBox(27,4);
  l1.setPosition(24.5/2,8.5);
  l1.setFill(150,150,255,80);
  l1.setDensity(17);
  l1.setSensor(true);
  l1.setNoStroke();
  l1.setStatic(true);
  l1.setName("Water");
  world.add(l1);
  
  // Start Button
  c1 = new FCircle(2.0); // diameter is 2
  c1.setPosition(edgeTopLeftX+2.5, edgeTopLeftY+worldHeight/2.0-3);
  c1.setFill(0, 255, 0);
  c1.setSensor(true);
  c1.setStaticBody(true);
  world.add(c1);
  
  // Finish Button
  c2 = new FCircle(2.0);
  c2.setPosition(worldWidth-2.5, edgeTopLeftY+worldHeight/2.0);
  c2.setFill(200,0,0);
  c2.setStaticBody(true);
  c2.setSensor(true);
  world.add(c2);
  
  // Game Ball
  g1 = new FBox(1, 1);
  g1.setPosition(2, 4);
  g1.setDensity(12);
  g1.setFill(random(255),random(255),random(255));
  g1.setName("Widget");
  world.add(g1);
  
  g2 = new FCircle(1);
  g2.setPosition(3, 4);
  g2.setDensity(12);
  g2.setFill(random(255),random(255),random(255));
  g2.setName("Widget");
  world.add(g2);
  
  // Setup the Virtual Coupling Contact Rendering Technique
  s = new HVirtualCoupling((0.75)); 
  s.h_avatar.setDensity(7); 
  s.h_avatar.setFill(255,0,0); 
  s.h_avatar.setSensor(true);
  s.init(world, edgeTopLeftX+worldWidth/2, edgeTopLeftY+2); 
  
  // World Setup
  world.setGravity((0.0), (300.0)); //1000 cm/(s^2)
  world.setEdges((edgeTopLeftX), (edgeTopLeftY), (edgeBottomRightX), (edgeBottomRightY)); 
  world.setEdgesRestitution(.4);
  world.setEdgesFriction(0.5);
  
  world.draw();
  
  haptic_timer = CountdownTimerService.getNewCountdownTimer(this).configure(SIMULATION_PERIOD, HOUR_IN_MILLIS).start();
  
  frameRate(60); 
  f = createFont("Arial", 16, true);
}


void draw(){
  background(255);
  textFont(f, 22);
  //fill(0, 102, 153);
  
  if(gameStart){
    fill(0, 0, 0);
    textAlign(CENTER);
    text("Push the ball or square to the red circle", width/2, 60);
    textAlign(CENTER);
    text("Touch the green circle to reset", width/2, 90);
    
    b1.setFill(0, 0, 0);
    b2.setFill(0, 0, 0);
    b3.setFill(0, 0, 0);
    b4.setFill(0, 0, 0);
    b5.setFill(0, 0, 0);
    
  }
  else{
    fill(128, 128, 128);
    textAlign(CENTER);
    text("Touch the green circle to start the maze", width/2, 60);
    
    b1.setFill(255, 255, 255);
    b2.setFill(255, 255, 255);
    b3.setFill(255, 255, 255);
    b4.setFill(255, 255, 255);
    b5.setFill(255, 255, 255);
  }
  
  world.draw();
}


void onTickEvent(CountdownTimer t, long timeLeftUntilFinish){
  
  rendering_force = true;
  if (haplyBoard.data_available()){
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
  
  
  if (s.h_avatar.isTouchingBody(c1)){
    gameStart = true;
    g1.setPosition(2,8);
    g2.setPosition(3,8);
    s.h_avatar.setSensor(false);
  }
  
  if(g1.isTouchingBody(c2) || g2.isTouchingBody(c2)){
    gameStart = false;
    s.h_avatar.setSensor(true);
  }
  
  // Viscous layer codes
  if (s.h_avatar.isTouchingBody(l1)){
    s.h_avatar.setDamping(150);
  }
  else{
    s.h_avatar.setDamping(40); 
  }
  
  if(gameStart && g1.isTouchingBody(l1)){
    g1.setDamping(20);
  }
  
  if(gameStart && g2.isTouchingBody(l1)){
    g2.setDamping(20);
  }
  
    // Bouyancy of fluid on avatar and gameball
  if (g1.isTouchingBody(l1)){
    float b_s;
    float bm_d = g1.getY()-l1.getY()+l1.getHeight()/2; // vertical distance between middle of ball and top of water
    
    if (bm_d + g1.getWidth()/2 >= g1.getWidth()) { //if whole ball or more is submerged
      b_s = g1.getWidth(); // amount of ball submerged is ball size
    }
    else { //if ball is partially submerged
      b_s = bm_d + g1.getWidth()/2; // amount of ball submerged is vertical distance between middle of ball and top of water + half of ball size
    }
  
    g1.addForce(0,l1.getDensity()*sq(b_s)*300*-1); // 300 is gravity force
   
  }
  
  
  if (g2.isTouchingBody(l1)){
    float b_s;
    float bm_d = g2.getY()-l1.getY()+l1.getHeight()/2; // vertical distance between middle of ball and top of water
    
    if (bm_d + g2.getSize()/2 >= g2.getSize()) { //if whole ball or more is submerged
      b_s = g2.getSize(); // amount of ball submerged is ball size
    }
    else { //if ball is partially submerged
      b_s = bm_d + g2.getSize()/2; // amount of ball submerged is vertical distance between middle of ball and top of water + half of ball size
    }
  
    g2.addForce(0,l1.getDensity()*sq(b_s)*300*-1); // 300 is gravity force
   
  }
  
  
  
  
  world.step(1.0f/1000.0f);
  
  rendering_force = false;

}

/*
//Uncomment this section to see an alternate way to apply forces in the environment!
void contactPersisted(FContact contact){
  float size;
  float b_s;
  float bm_d;
  
  if(contact.contains("Water", "Widget")){
    size = 2*sqrt(contact.getBody2().getMass()/contact.getBody2().getDensity()/3.1415);
    
    if(bm_d + size/2 >= size){
      b_s = size;
    }
    else{
      b_s = bm_d + size/2;
    }
    
    contact.getBody2().addForce(0, contact.getBody1().getDensity()*sq(b_s)*300*-1);
    contact.getBody2().setDamping(20);
  }
  
}


void contactEnded(FContact contact){
  if(contact.contains("Water", "Widget")){
    contact.getBody2().setDamping(0);
  }
}
*/

/* Timer control event functions **************************************************************************************/

/**
 * haptic timer reset
 */
void onFinishEvent(CountdownTimer t)
{
  println("Resetting timer...");
  haptic_timer.reset();
  haptic_timer = CountdownTimerService.getNewCountdownTimer(this).configure(SIMULATION_PERIOD, HOUR_IN_MILLIS).start();
}
