/**
 ************************************************************************************************************************
 * @file       HelloWall.pde
 * @author     
 * @version    V0.1.0
 * @date       4-April-2017
 * @brief      Test example for creating a virtual wall using the hAPI
 ************************************************************************************************************************
 * @attention
 *
 *
 ************************************************************************************************************************
 */

/* library imports *****************************************************************************************************/
import processing.serial.*;
import com.dhchoi.CountdownTimer;
import com.dhchoi.CountdownTimerService;


/* Device block definitions ********************************************************************************************/
Device            haply_2DoF;
byte              deviceID             = 5;
Board             haply_board;
DeviceType        device_type;


/* Animation Speed Parameters *****************************************************************************************/
long              baseFrameRate        = 120; 
long              count                = 0; 


/* Simulation Speed Parameters ****************************************************************************************/
final long        SIMULATION_PERIOD    = 1; //ms
final long        HOUR_IN_MILLIS       = 36000000;
CountdownTimer    haptic_timer;


/* Graphics Simulation parameters *************************************************************************************/
PShape            pantograph, joint1, joint2, handle;
PShape            wall; 

int               pixelsPerMeter       = 4000; 
float             radsPerDegree        = 0.01745; 

float             l                    = .05; // in m: these are length for graphic objects
float             L                    = .07;
float             d                    = .02;
float             r_ee                 = d/3; 

PVector           device_origin        = new PVector (0, 0) ; 


/* Physics Simulation parameters **************************************************************************************/
PVector           f_wall               = new PVector(0, 0); 
float             k_wall               = 400; //N/mm 
PVector           pen_wall             = new PVector(0, 0); 
PVector           pos_wall             = new PVector(d/2, .07);


/* generic data for a 2DOF device */
/* joint space */
PVector           angles               = new PVector(0, 0);
PVector           torques              = new PVector(0, 0);

/* task space */
PVector           pos_ee               = new PVector(0, 0);
PVector           f_ee                 = new PVector(0, 0); 


/**********************************************************************************************************************
 * Main setup function, defines parameters for physics simulation and initialize hardware setup
 **********************************************************************************************************************/
void setup() {

  /* Setup for the graphic display window and drawing objects */
  /* 20 cm x 15 cm */
  size(1057, 594, P2D); //px/m*m_d = px
  background(0);
  frameRate(baseFrameRate);
  
  
  /* Initialization of the Board, Device, and Device Components */
  
  /* BOARD */
  haply_board = new Board(this, Serial.list()[0], 0);

  /* DEVICE */
  haply_2DoF = new Device(device_type.HaplyTwoDOF, deviceID, haply_board);

  
  /* Initialize graphical simulation components */
  
  /* set device in middle of frame on the x-axis and in the fifth on the y-axis */
  device_origin.add((width/2), (height/5) );
  
  /* create pantograph graphics */  
  createpantograph();
  
  /* create wall graphics */
  wall=  createWall(pos_wall.x-.2,pos_wall.y,pos_wall.x+.2,pos_wall.y); 
  wall.setStroke(color(0));
  
  
  /* haptics event timer, create and start a timer that has been configured to trigger onTickEvents */
  /* every TICK (1ms or 1kHz) and run for HOUR_IN_MILLIS (1hr), then resetting */
  haptic_timer = CountdownTimerService.getNewCountdownTimer(this).configure(SIMULATION_PERIOD, HOUR_IN_MILLIS).start();
}


/**********************************************************************************************************************
 * Main draw function, updates simulation animation at prescribed framerate 
 **********************************************************************************************************************/
void draw() { 
  
  update_animation(angles.x*radsPerDegree, angles.y*radsPerDegree, pos_ee.x, pos_ee.y);
}


/**********************************************************************************************************************
 * Haptics simulation event, engages state of physical mechanism, calculates and updates physics simulation conditions
 **********************************************************************************************************************/ 
void onTickEvent(CountdownTimer t, long timeLeftUntilFinish){
  
  /* check if new data is available from physical device */
  if (haply_board.data_available()) {

    /* GET END-EFFECTOR POSITION (TASK SPACE) */
    angles.set(haply_2DoF.get_device_angles()); 
    pos_ee.set( haply_2DoF.get_device_position(angles.array()));
    pos_ee.set(device2graphics(pos_ee));    
    
    /* PHYSICS OF THE SIMULATION */
    f_wall.set(0, 0); 

    pen_wall.set(0, (pos_wall.y - (pos_ee.y+r_ee))); 

    if (pen_wall.y < 0) {
      f_wall = f_wall.add((pen_wall.mult(-k_wall)));
    }

    f_ee = (f_wall.copy()).mult(-1);
    f_ee.set(graphics2device(f_ee));
  }

  /* update device torque in simulation and on physical device */
  haply_2DoF.set_device_torques(f_ee.array());
  torques.set(haply_2DoF.mechanisms.get_torque());
  haply_2DoF.device_write_torques();
  
}


/* Graphical and physics functions ************************************************************************************/

/**
 * Specifies the parameters for a haply_2DoF pantograph animation object
 */
void createpantograph() {

  /* modify pantograph parameters to fit screen */
  float l_ani=pixelsPerMeter*l;
  float L_ani=pixelsPerMeter*L;
  float d_ani=pixelsPerMeter*d; 
  float r_ee_ani = pixelsPerMeter*r_ee; 
  
  /* parameters for create pantograph object */ 
  pantograph = createShape();
  pantograph.beginShape();
  pantograph.fill(255);
  pantograph.stroke(0);
  pantograph.strokeWeight(2);

  pantograph.vertex(device_origin.x, device_origin.y);
  pantograph.vertex(device_origin.x, device_origin.y);
  pantograph.vertex(device_origin.x, device_origin.y);
  pantograph.vertex(device_origin.x-d_ani, device_origin.y);
  pantograph.vertex(device_origin.x-d_ani, device_origin.y);
  pantograph.endShape(CLOSE);
  

  joint1 = createShape(ELLIPSE, device_origin.x, device_origin.y, d_ani/5, d_ani/5);
  joint1.setStroke(color(0));
  
  joint2 = createShape(ELLIPSE, device_origin.x-d_ani, device_origin.y, d_ani/5, d_ani/5);
  joint2.setStroke(color(0));

  handle = createShape(ELLIPSE, device_origin.x, device_origin.y, 2*r_ee_ani, 2*r_ee_ani);
  handle.setStroke(color(0));
  strokeWeight(5);
}


/**
 * Specifies the parameters for static wall animation object
 */
PShape createWall(float x1, float y1, float x2, float y2){
  
  /* modify wall parameters to fit screen */
  x1= pixelsPerMeter*x1; 
  y1= pixelsPerMeter*y1; 
  x2=pixelsPerMeter*x2; 
  y2=pixelsPerMeter*y2; 
  
  return createShape(LINE, device_origin.x+x1, device_origin.y+y1, device_origin.x+x2, device_origin.y+y2);
}


/**
 * update animations of all virtual objects rendered 
 */
void update_animation(float th1, float th2, float x_E, float y_E){
  
  /* To clean up the left-overs of drawings from the previous loop */
  background(255); 
  
  /* modify virtual object parameters to fit screen */
  x_E = pixelsPerMeter*x_E; 
  y_E = pixelsPerMeter*y_E; 
  th1 = 3.14-th1;
  th2 = 3.14-th2;
  float l_ani = pixelsPerMeter*l; 
  float L_ani = pixelsPerMeter*L; 
  float d_ani = pixelsPerMeter*d; 
  
  /* Vertex A with th1 from encoder reading */
  pantograph.setVertex(1,device_origin.x+l_ani*cos(th1), device_origin.y+l_ani*sin(th1)); 
  
  /* Vertex B with th2 from encoder reading */
  pantograph.setVertex(3,device_origin.x-d_ani+l_ani*cos(th2), device_origin.y+l_ani*sin(th2)); 
  
  /* Vertex E from Fwd Kin calculations */
  pantograph.setVertex(2,device_origin.x+x_E, device_origin.y+y_E);   
  
  
  /* Display the virtual objects with new parameters */
  shape(pantograph); 
  shape(joint1);
  shape(joint2); 
  shape(wall);
  
  pushMatrix(); 
  shape(handle,x_E+(d/12*pixelsPerMeter), y_E, 2*r_ee*pixelsPerMeter, 2*r_ee*pixelsPerMeter);
  stroke(0); 
  popMatrix(); 
}


/**
 * translates from device frame of reference to graphics frame of reference
 */
PVector device2graphics(PVector deviceFrame){
   
  return deviceFrame.set(-deviceFrame.x, deviceFrame.y);  
}

 
/**
 * translates from graphics frame of reference to device frame of reference
 */  
PVector graphics2device(PVector graphicsFrame){
  
  return graphicsFrame.set(-graphicsFrame.x, graphicsFrame.y); 
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