/**
 *  Anchors and the bridge
 *
 *  Adapted by Colin Gallacher for use with hAPI_Fisica
 *  original code by Richard Marxer 
 *
 *  This example shows the use of anchors and distance joints in order
 *  to create a bridge.
 */


import processing.serial.*;
import com.dhchoi.CountdownTimer;
import com.dhchoi.CountdownTimerService;

/* Device block definitions ********************************************************************************************/
Device            haply_2DoF;
byte              deviceID                   = 5;
Board             haply_board;
DeviceType        degreesOfFreedom;


/* Simulation Speed Parameters ****************************************************************************************/
final long        SIMULATION_PERIOD          = 1; //ms
final long        HOUR_IN_MILLIS             = 36000000;
CountdownTimer    haptic_timer;
float             dt                        = SIMULATION_PERIOD/1000.0;
boolean           rendering_force                 = false;

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
float worldWidth = 10.0; 
float worldHeight = 7.0; 

float edgeTopLeftX = 0.0-2.0; 
float edgeTopLeftY = 0.0-2.0; 
float edgeBottomRightX = 10.0+2.0; 
float edgeBottomRightY = 7.0+2.0; 

/* Initialization of the virtual tool */ 

HVirtualCoupling s; 
PImage haply_avatar; 


/*Bridge Graphic objects*/ 
FBody[] steps = new FBody[20];
float frequency = 100;
float damping = 10;
float boxWidth;



void setup() {
  size(400, 320);
  
  /* BOARD */
  haply_board = new Board(this, Serial.list()[0], 0);

  /* DEVICE */
  haply_2DoF = new Device(degreesOfFreedom.HaplyTwoDOF, deviceID, haply_board);

/*Initialize the world parameters*/ 

  hAPI_Fisica.init(this);
  hAPI_Fisica.setScale(pixelsPerCentimeter); 



/*world Setup*/ 
  world = new FWorld();
  world.setGravity((0.0), (1000.0)); //1000 cm/(s^2)
  world.setEdges((edgeTopLeftX), (edgeTopLeftY), (edgeBottomRightX), (edgeBottomRightY)); 
  world.remove(world.top); 
  world.setEdgesRestitution(.4);
  world.setEdgesFriction(0.5);
  
  /* Haptic Tool Initialization   */

  s= new HVirtualCoupling((0.5)); 
  s.h_avatar.setFill(255,0,0); 
  s.init(world, edgeTopLeftX+worldWidth/2, edgeTopLeftY+2); 
    haply_avatar = loadImage("../img/Haply_avatar.png"); 
  haply_avatar.resize((int)(hAPI_Fisica.worldToScreen(.5)), (int)(hAPI_Fisica.worldToScreen(.5)));
  s.h_avatar.attachImage(haply_avatar); 


  boxWidth =  hAPI_Fisica.screenToWorld(600.0f)/(steps.length) - .2;

  for (int i=0; i<steps.length; i++) {
    steps[i] = new FBox(boxWidth,  hAPI_Fisica.screenToWorld(10));
    steps[i].setPosition(map(i, 0, steps.length-1, boxWidth,  hAPI_Fisica.screenToWorld(width)-boxWidth), worldHeight/3.0f);
    steps[i].setNoStroke();
    steps[i].setFill(120, 200, 190);
    world.add(steps[i]);
  }

  for (int i=1; i<steps.length; i++) {
    FDistanceJoint joint = new FDistanceJoint(steps[i-1], steps[i]);
    joint.setAnchor1(boxWidth/2, 0);
    joint.setAnchor2(-boxWidth/2, 0);
    joint.setFrequency(frequency);
    joint.setDamping(damping);
    joint.setFill(0);
    joint.calculateLength();
    world.add(joint);
  }

  FCircle left = new FCircle( .4);
  left.setStatic(true);
  left.setPosition(0, worldHeight/3.0f);
  left.setDrawable(false);
  world.add(left);

  FCircle right = new FCircle(0.4);
  right.setStatic(true);
  right.setPosition(hAPI_Fisica.screenToWorld(width), worldHeight/3.0f);
  right.setDrawable(false);
  world.add(right);

  FDistanceJoint firstJoint = new FDistanceJoint(steps[0], left);
  firstJoint.setAnchor1(-boxWidth/2, 0);
  firstJoint.setAnchor2(0, 0);
  firstJoint.setFrequency(frequency);
  firstJoint.setDamping(damping);
  firstJoint.calculateLength();
  firstJoint.setFill(0);
  world.add(firstJoint);

  FDistanceJoint finalJoint = new FDistanceJoint(steps[steps.length-1], right);
  finalJoint.setAnchor1(boxWidth/2, 0);
  finalJoint.setAnchor2(0, 0);
  finalJoint.setFrequency(frequency);
  finalJoint.setDamping(damping);
  finalJoint.calculateLength();
  finalJoint.setFill(0);
  world.add(finalJoint);
  
   world.draw();
  
  haptic_timer = CountdownTimerService.getNewCountdownTimer(this).configure(SIMULATION_PERIOD, HOUR_IN_MILLIS).start(); 
  
  frameRate(60); 

}

void draw() {
  background(255);
   
  if(!rendering_force){
    
    //s.drawContactVectors(this); 
    
   }
    world.draw();
    //world.drawDebug();  
}


void mousePressed() {
 
  //float radius = random(10, 40);
  //FCircle bola = new FCircle(radius);
  //bola.setPosition(mouseX, mouseY);
  //bola.setDensity(0.2);
  //bola.setFill(120, 120, 190);
  //bola.setNoStroke();
  //world.add(bola);  
  
FPoly p = new FPoly();
float scale = random(1, 2);
scale = scale/5.0f; 

p.vertex(scale*-3.0, scale*-2.0);
p.vertex( scale*3.0,scale* -2.0);
p.vertex( scale*3.0,scale* 0);
p.vertex(scale* 1.0, 0);
p.vertex(scale* 1.0, scale*4.0);
p.vertex(scale*-1.0, scale*4.0);
p.vertex(scale*-1.0, 0);
p.vertex(scale*-3.0, 0);
  p.setPosition(hAPI_Fisica.screenToWorld(mouseX), hAPI_Fisica.screenToWorld(mouseY));
    p.setDensity(0.2);
  p.setFill(random(0,255), random(0,255) , random(0,255));
  p.setNoStroke();
world.add(p);
}

void keyPressed() {
  try {
    saveFrame("screenshot.png");
  } 
  catch (Exception e) {
  }

}


/**********************************************************************************************************************
 * Haptics simulation event, engages state of physical mechanism, calculates and updates physics simulation conditions
 **********************************************************************************************************************/ 
void onTickEvent(CountdownTimer t, long timeLeftUntilFinish){
   
  rendering_force = true;
   
  if (haply_board.data_available()) {
    /* GET END-EFFECTOR STATE (TASK SPACE) */
        
    angles.set(haply_2DoF.get_device_angles()); 
    pos_ee.set( haply_2DoF.get_device_position(angles.array()));
    pos_ee.set(pos_ee.copy().mult(100)); 
    
  }

  s.setToolPosition(edgeTopLeftX+worldWidth/2-(pos_ee).x+1.0, edgeTopLeftY+(pos_ee).y); 
  s.updateCouplingForce();
 
  f_ee.set(-s.getVCforceX(), s.getVCforceY());
 
  f_ee.div(10000); //
  haply_2DoF.set_device_torques(f_ee.array());
  torques.set(haply_2DoF.mechanisms.get_torque());
  haply_2DoF.device_write_torques();
  
  
  world.step(dt);
  
  rendering_force = false;
  
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