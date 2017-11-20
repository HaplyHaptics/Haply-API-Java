/**
 ************************************************************************************************************************
 * @file       HelloWall.pde
 * @author     
 * @version    V0.1.0
 * @date       4-April-2017
 * @brief      Test example for creating gravity interaction between two dynamic objects
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
byte              deviceID                   = 5;
Board             haply_board;
DeviceType        degreesOfFreedom;


/* Animation Speed Parameters *****************************************************************************************/
int               baseFrameRate              = 120;
long              count                      = 0; 


/* Simulation Speed Parameters ****************************************************************************************/
final long        SIMULATION_PERIOD          = 1; //ms
final long        HOUR_IN_MILLIS             = 36000000;
CountdownTimer    haptic_timer;


/* Graphics Simulation parameters *************************************************************************************/
PShape            avatar;
PShape            ball;
PShape            pow; 

int               pixelsPerMeter             = 4000;
float             radsPerDegree              = 0.01745;

float             l                          = .05;
float             L                          = .07;
float             d                          = .02;
float             r_ee                       = d/3; 
float             r_ee_contact               = d/3; 
float             r_ball                     = d/2; 

PVector           device_origin              = new PVector (0, 0) ; 


/* Physics Simulation parameters **************************************************************************************/

/* dynamics of ball, astroid */
float             m_ball                    = 0.03; //kg
float             k_ball                    = 500; //N/m
float             b_ball                    = 0.05; 
float             pen_ball                  = 0.0; //m
float             b_air                     = 0.0; //kg/s
PVector           f_gravity                 = new PVector(0,0 ); //m/s^2
float             dt                        = SIMULATION_PERIOD/1000.0; 

/* Initial Conditions */
PVector           pos_ball                  = new PVector(0,0.03);  //mm
PVector           vel_ball                  = new PVector(0,0); //mm/s

PVector           f_ball                    = new PVector(0,0); //uN
PVector           f_contact                 = new PVector(0,0);
PVector           f_damping                 = new PVector(0,0); 


PVector           pos_ee2ball;
float             pos_ee2ball_magnitude;

PVector           vel_ee2ball;
float             vel_ee2ball_magnitude;




/* generic data for a 2DOF device */
/* joint space */
PVector           angles                    = new PVector(0,0);
PVector           torques                   = new PVector(0,0);

/* task space */
PVector           pos_ee                    = new PVector(0,0);
PVector           pos_ee_last               = new PVector(0,0); 
PVector           vel_ee                    = new PVector(0,0); 
PVector           f_ee                      = new PVector(0,0); 


PImage            space; 
boolean           contact                   = true; 
int               counter                   = 0;  
 
 
/**********************************************************************************************************************
 * Main setup function, defines parameters for physics simulation and initialize hardware setup
 **********************************************************************************************************************/
void setup(){
  
  /* Setup for the graphic display window and drawing objects */
  /* 20 cm x 15 cm */
  size(1057, 594, P2D);
  background(0);
  frameRate(baseFrameRate);
  
  /* initialize space background */
  space = loadImage("space.png"); 
  
  
  /* Initialization of the Board, Device, and Device Components */ 
  
  /* BOARD */
  haply_board = new Board(this, Serial.list()[0], 0);
  
  /* DEVICE */
  haply_2DoF = new Device(degreesOfFreedom.HaplyTwoDOF, deviceID, haply_board);
  

  /* GRAPHICS INITIALIZATION */
  
  /* set device in middle of frame on the x-axis and in the lower fifth on the y-axis */
  device_origin.add((width/2), (height/4) );
  
  /* create avatar graphics */
  avatar = createAvatar();
  
  /* crate ball, astroid graphics */
  ball = createBall(r_ball); 
  pow = loadShape("pow.svg");
  
  
  /* haptics event timer, create and start a timer that has been configured to trigger onTickEvents */
  /* every TICK (1ms or 1kHz) and run for HOUR_IN_MILLIS (1hr), then resetting */
  haptic_timer = CountdownTimerService.getNewCountdownTimer(this).configure(SIMULATION_PERIOD, HOUR_IN_MILLIS).start();
}

        
/**********************************************************************************************************************
 * Main draw function, updates simulation animation at prescribed framerate 
 **********************************************************************************************************************/
void draw(){
 image(space, 0, 0); 
 
  if (contact && counter <20){
   counter++; 
  }
  else{
    counter = 0; 
    contact = false; 
  }
  
  update_animation(angles.x*radsPerDegree, angles.y*radsPerDegree, pos_ee.x, pos_ee.y, contact);
}


/**********************************************************************************************************************
 * Haptics simulation event, engages state of physical mechanism, calculates and updates physics simulation conditions
 **********************************************************************************************************************/ 
void onTickEvent(CountdownTimer t, long timeLeftUntilFinish){

  if(haply_board.data_available()){

    /* GET END-EFFECTOR STATE (TASK SPACE) */ 
    angles.set(haply_2DoF.get_device_angles()); 
    pos_ee.set( haply_2DoF.get_device_position(angles.array()));
    pos_ee.set(device2graphics(pos_ee)); 
    vel_ee.set((pos_ee.copy().sub(pos_ee_last)).div(dt)); 
    pos_ee_last = pos_ee; 

      
    /* PHYSICS OF THE SIMULATION */ 

    /* Contact Forces */
    pos_ee2ball = (pos_ball.copy()).sub(pos_ee);
    pos_ee2ball_magnitude = pos_ee2ball.mag(); 
    pen_ball = pos_ee2ball_magnitude - (r_ball+r_ee);
    
  
    /* ball forces */
    if(pen_ball<0){
      r_ee_contact = r_ee + pen_ball; 
      f_contact= pos_ee2ball.normalize();
      vel_ee2ball = ((vel_ball.copy()).sub(vel_ee)); 
      vel_ee2ball = f_contact.copy().mult(vel_ee2ball.dot(f_contact)); 
      vel_ee2ball_magnitude = vel_ee2ball.mag(); 
      
      /* since pen_ball is negative k_ball must be negative to ensure the force acts along the end-effector to the ball */
      f_contact = f_contact.mult(-k_ball*pen_ball-b_ball*vel_ee2ball_magnitude);  

      if(vel_ee2ball.mag()>.2)
          contact = true;   
    }
    else{
      r_ee_contact = r_ee; 
      f_contact.set(0,0);  
    }
  
  
    /* forces due to damping */
    f_damping = (vel_ball.copy()).mult(-b_air); 
    f_gravity = (pos_ball.copy().sub(d/2, .03)).normalize().mult(-.05); 


    /* sum of forces */ 
    f_ball = (f_contact.copy()).add(f_gravity).add(f_damping); 
    f_ee = (f_contact.copy()).mult(-1); 
    f_ee.set(graphics2device(f_ee)); 
    
    haply_2DoF.set_device_torques(f_ee.array());
    torques.set(haply_2DoF.mechanisms.get_torque());
    

    /* INTEGRATE THE ACCELERATION TO GET THE STATES OF THE BALL */
    pos_ball = (((f_ball.copy()).div(2*m_ball)).mult(dt*dt)).add(((vel_ball.copy()).mult(dt))).add(pos_ball);
    vel_ball = (((f_ball.copy()).div(m_ball)).mult(dt)).add(vel_ball); 
  }

  haply_2DoF.device_write_torques();
}



/* Graphical and physics functions ************************************************************************************/

/**
 * Specifies the parameters for user avatar animation (UFO)
 */
PShape createAvatar(){
     
  return   avatar = loadShape("ufo2.svg");
}


/**
 * Specifies the parameters for ball/astroid animation
 */
PShape createBall(float r_ball){
  
  r_ball = pixelsPerMeter*r_ball; 
  
  return ball = loadShape("element3.svg"); 
}


/**
 * update animations of all virtual objects rendered 
 */
void update_animation(float th1, float th2, float x_E, float y_E, boolean contact){
  
  /* modify virtual object parameters to fit screen */
  x_E = pixelsPerMeter*x_E; 
  y_E = pixelsPerMeter*y_E; 
  th1= 3.14-th1; 
  th2 = 3.14- th2; 
  float l_ani = pixelsPerMeter*l; 
  float L_ani = pixelsPerMeter*L; 
  float d_ani = pixelsPerMeter*d; 
  
  
  pushMatrix(); 
  translate(device_origin.x,  device_origin.y); 
  shapeMode(CENTER); 
  shape(ball, pos_ball.x*pixelsPerMeter , pos_ball.y*pixelsPerMeter, 2.5*r_ball*pixelsPerMeter, 2.5*r_ball*pixelsPerMeter); 
  shapeMode(CORNER); 
  popMatrix(); 
  
  
  pushMatrix(); 
  translate(device_origin.x,  device_origin.y);
  shapeMode(CENTER); 
  shape(avatar,x_E+(d/12*pixelsPerMeter), y_E, 3*r_ee*pixelsPerMeter, 3*r_ee*pixelsPerMeter); 
  
  if(contact) 
    shape(pow,x_E+(d/12*pixelsPerMeter), y_E, 4*r_ee*pixelsPerMeter, 4*r_ee*pixelsPerMeter);
  
  shapeMode(CORNER);  
  popMatrix(); 
}


/**
 * translates device frame of reference to graphics frame of reference
 */
PVector device2graphics(PVector deviceFrame){
   
  return deviceFrame.set(-deviceFrame.x, deviceFrame.y);    
}


/**
 * translates graphics frame of reference to device frame of reference 
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


  