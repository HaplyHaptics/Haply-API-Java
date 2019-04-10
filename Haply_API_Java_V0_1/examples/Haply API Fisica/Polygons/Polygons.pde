/**
 *  Polygons
 *
 *  by Ricard Marxer
 *
 *  This example shows how to create polygon bodies.
 */

//import hAPI_Fisica.*;
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
float worldWidth = 10.0; 
float worldHeight = 7.0; 

/* World boundaries */ 
FWorld world;
float edgeTopLeftX = 0.0-2.0; 
float edgeTopLeftY = 0.0-2.0; 
float edgeBottomRightX = 10.0+2.0; 
float edgeBottomRightY = 7.0+2.0; 

/* Initialization of the virtual tool */ 

HVirtualCoupling s; 
PImage haply_avatar; 


FPoly poly;


void setup() {
  size(400, 320);


  /* BOARD */
  haply_board = new Board(this, "COM6", 0);

  /* DEVICE */
  haply_2DoF = new Device(degreesOfFreedom.HaplyTwoDOF, deviceID, haply_board);

  hAPI_Fisica.init(this);
  hAPI_Fisica.setScale(pixelsPerCentimeter); 


  world = new FWorld();
  world.setGravity(0, 500.0);
  world.setEdges();
  world.remove(world.left);
  world.remove(world.right);
  world.remove(world.top);
  
  
    /* Haptic Tool Initialization   */

  s= new HVirtualCoupling((.5));  
  //s.setVirtualCouplingStiffness(20000.0); 
  //s.setVirtualCouplingDamping(100); 
  s.h_avatar.setFill(255,0,0); 
  s.init(world, edgeTopLeftX+worldWidth/2, edgeTopLeftY+2); 
  
  world.setEdgesRestitution(0.5);
  
  
  world.draw(); 
    
  haptic_timer = CountdownTimerService.getNewCountdownTimer(this).configure(SIMULATION_PERIOD, HOUR_IN_MILLIS).start();


  
  frameRate(100); 
}

void draw() {


  if(!rendering_force){
      background(255);
    //s.drawContactVectors(this); 
       world.draw();
   }
   
    //world.drawDebug();  
  // Draw the polygon while
  // while it is being created
  // and hasn't been added to the
  // world yet
  if (poly != null) {
    poly.draw(this);
  }
  

  
}


void mousePressed() {
  if (world.getBody(hAPI_Fisica.screenToWorld(mouseX), hAPI_Fisica.screenToWorld(mouseY)) != null) {
    return;
  }

  poly = new FPoly();
  poly.setStrokeWeight(3);
  poly.setFill(120, 30, 90);
  poly.setDensity(5);
  poly.setRestitution(0.5);
  poly.vertex(hAPI_Fisica.screenToWorld(mouseX), hAPI_Fisica.screenToWorld(mouseY));
}

void mouseDragged() {
  if (poly!=null) {
    poly.vertex(hAPI_Fisica.screenToWorld(mouseX), hAPI_Fisica.screenToWorld(mouseY));
  }
}

void mouseReleased() {
  if (poly!=null) {
    world.add(poly);
    poly = null;
  }
}

void keyPressed() {
  if (key == BACKSPACE) {
    FBody hovered = world.getBody(hAPI_Fisica.screenToWorld(mouseX), hAPI_Fisica.screenToWorld(mouseY));
    if ( hovered != null &&
         hovered.isStatic() == false ) {
      world.remove(hovered);
    }
  } 
  else {
    try {
      saveFrame("screenshot.png");
    } 
    catch (Exception e) {
    }
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
  s.updateCouplingForce(.25, 400000, 700, 1);
  f_ee.set(-s.getVCforceX(), s.getVCforceY());
 
  f_ee.div(1000); //
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