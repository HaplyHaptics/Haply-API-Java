/**
 **********************************************************************************************************************
 * @file       Shapes.pde
 * @author     Steve Ding, Colin Gallacher
 * @version    V4.1.0
 * @date       20-September-2018
 * @brief      Shapes haptic example using 2D physics engine 
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

/* generic data for a 2DOF device */
/* joint space */
PVector           angles                              = new PVector(0, 0);
PVector           torques                             = new PVector(0, 0);

/* task space */
PVector           pos_ee                              = new PVector(0, 0);
PVector           f_ee                                = new PVector(0, 0); 

/* World boundaries in centimeters */
FWorld            world;
float             worldWidth                          = 25.0;  
float             worldHeight                         = 10.0; 

float             edgeTopLeftX                        = 0.0; 
float             edgeTopLeftY                        = 0.0; 
float             edgeBottomRightX                    = worldWidth; 
float             edgeBottomRightY                    = worldHeight;


/* Initialization of interative shapes */
FBox              b;
FPoly             t;
FCircle           g;
FCircle           e;
FBlob             f;


/* Initialization of virtual tool */
HVirtualCoupling  s;
PImage            haply_avatar;

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
  
  widgetOne.device_set_parameters();
  
  
  /* 2D physics scaling and world creation */
  hAPI_Fisica.init(this); 
  hAPI_Fisica.setScale(pixelsPerCentimeter); 
  world               = new FWorld();
  
  
  /* creation of square shape */
  b                   = new FBox(3.0, 3.0);
  b.setPosition(edgeTopLeftX+worldWidth/4.0, edgeTopLeftY+worldHeight/2.0);
  b.setDensity(5);
  b.setFill(random(255), random(255), random(255));
  world.add(b);
  
  
  /* creation of T shape */
  t                   = new FPoly(); 
  t.vertex(-1.5, -1.0);
  t.vertex( 1.5, -1.0);
  t.vertex( 3.0/2.0, 0);
  t.vertex( 1.0/2.0, 0);
  t.vertex( 1.0/2.0, 4.0/2.0);
  t.vertex(-1.0/2.0, 4.0/2.0);
  t.vertex(-1.0/2.0, 0);
  t.vertex(-3.0/2.0, 0);
  t.setPosition(edgeTopLeftX+10, edgeTopLeftY+5); 
  t.setDensity(5); 
  t.setFill(random(255),random(255),random(255));
  world.add(t);
  
  
  /* creation of small circle shape */
  g                   = new FCircle(1.0);
  g.setPosition(7, 7);
  g.setFill(random(255),random(255),random(255));
  g.setDensity(2.0);
  world.add(g);
  
  
  /* creation of large circle shape */
  e                   = new FCircle(2.5);
  e.setPosition(3, 3);
  e.setFill(random(255), random(255), random(255));
  e.setDensity(4.0);
  world.add(e);
  
  
  /* creation of blob shape, warning may slow down simulation */
  f                   = new FBlob();
  float sca           = random(4, 5);
  sca = sca/2.0;
  f.setAsCircle(9, 3, sca, 30);
  f.setStroke(0);
  f.setStrokeWeight(2);
  f.setFill(255);
  f.setFriction(0);
  f.setDensity(1.8);
  f.setFill(random(255), random(255), random(255));
  world.add(f);
  
  
  /* Haptic Tool Initialization */
  s                   = new HVirtualCoupling((1)); 
  s.h_avatar.setDensity(2); 
  s.h_avatar.setFill(255,0,0); 
  s.init(world, edgeTopLeftX+worldWidth/2, edgeTopLeftY+2); 
  
  /* If you are developing on a Mac users must update the path below 
   * from "../img/Haply_avatar.png" to "./img/Haply_avatar.png" 
   */
  haply_avatar = loadImage("../img/Haply_avatar.png"); 
  haply_avatar.resize((int)(hAPI_Fisica.worldToScreen(1)), (int)(hAPI_Fisica.worldToScreen(1)));
  s.h_avatar.attachImage(haply_avatar); 


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
  
    world.step(1.0f/1000.0f);
  
    rendering_force = false;
  }
}
/* end simulation section **********************************************************************************************/



/* helper functions section, place helper functions here ***************************************************************/

/* end helper functions section ****************************************************************************************/