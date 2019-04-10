/**
 ************************************************************************************************************************
 * @file       HelloBall.pde
 * @author     
 * @version    V0.1.0
 * @date       4-April-2017
 * @brief      Test example for creating a virtual dynamic ball using the hAPI
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
Device              haply_2DoF;
byte                deviceID                 = 5;
Board               haply_board;
DeviceType          degreesOfFreedom;


/* Animation Speed Parameters *****************************************************************************************/
int                 baseFrameRate            = 120;
long                count                    = 0; 


/* Simulation Speed Parameters ****************************************************************************************/
final long          SIMULATION_PERIOD        = 1; //ms
final long          HOUR_IN_MILLIS           = 36000000;
CountdownTimer      haptic_timer;


/* Graphics Simulation parameters *************************************************************************************/
PShape              pantograph, joint1, joint2, handle;
PShape              ball, left_wall, bottom_wall, right_wall; 

int                 pixelsPerMeter           = 4000;
float               radsPerDegree            = 0.01745;


float               l                        = .05;
float               L                        = .07;
float               d                        = .02;
float               r_ee                     = d/3; 
float               r_ee_contact             = d/3; 
float               r_ball                   = d/2; 

PVector             device_origin            = new PVector (0, 0) ; 


/* Physics Simulation parameters **************************************************************************************/

/* dynamics of ball */
float               m_ball                   = 0.2; //kg
float               k_ball                   = 3000;//N/m
float               b_ball                   = 2; 
float               pen_ball                 = 0.0; // m
float               b_air                    = 0.0; // kg/s
PVector             f_gravity                = new PVector(0,-10*m_ball ); // m/s^2
float               dt                       = SIMULATION_PERIOD/1000.0; 

/* Initial Conditions for ball */
PVector             pos_ball                 = new PVector(0,0.1);  // mm
PVector             vel_ball                 = new PVector(0,0); // mm/s

PVector             f_ball                   = new PVector(0,0); // uN
PVector             f_contact                = new PVector(0,0);
PVector             f_damping                = new PVector(0,0); 

PVector             pos_ee2ball;
float               pos_ee2ball_magnitude;

PVector             vel_ee2ball;
float               vel_ee2ball_magnitude;

/* wall static-contacts */
PVector             f_wall                   = new PVector(0,0); 
float               k_wall                   = 800; //N/m 
float               b_wall                   = 1;  //kg/s 
PVector             pen_wall                 = new PVector(0,0); 
PVector             pos_wall_left            = new PVector(-0.07, .03); 
PVector             pos_wall_bottom          = new PVector(d/2, .03); 
PVector             pos_wall_right           = new PVector(0.07+d, .03); 


/* generic data for a 2DOF device */
/* joint space */
PVector             angles                   = new PVector(0,0);
PVector             torques                  = new PVector(0,0);

/* task space */
PVector             pos_ee                   = new PVector(0,0);
PVector             pos_ee_last              = new PVector(0,0); 
PVector             vel_ee                   = new PVector(0,0); 
PVector             f_ee                     = new PVector(0,0); 


/**********************************************************************************************************************
 * Main setup function, defines parameters for physics simulation and initialize hardware setup
 **********************************************************************************************************************/
void setup(){
  
  /* Setup for the graphic display window and drawing objects */
  /* 20 cm x 15 cm */
  size(1057, 594, P2D); //px/m*m_d = px
  background(0);
  frameRate(baseFrameRate);

  
  /* Initialization of the Board, Device, and Device Components */ 
  
  /* BOARD */
  haply_board = new Board(this, Serial.list()[0], 0);
  
  /* DEVICE */
  haply_2DoF = new Device(degreesOfFreedom.HaplyTwoDOF, deviceID, haply_board);
  

  /* GRAPHICS INITIALIZATION */
  /* set device in middle of frame on the x-axis and in lower fifth on the y-axis */
  device_origin.add((width/2), (height/5) );
  
  /* create pantograph graphics */  
  createpantograph();
  
  /* create ball graphics */
  ball = createBall(r_ball); 
  ball.setStroke(color(0));
  
  /* create left-side wall */
  left_wall= createWall(pos_wall_left.x,pos_wall_left.y,pos_wall_left.x,pos_wall_left.y+.07); 
  left_wall.setStroke(color(0));
  
  /* create right-side wall */
  right_wall= createWall(pos_wall_right.x,pos_wall_right.y,pos_wall_right.x,pos_wall_right.y+.07); 
  right_wall.setStroke(color(0));
  
  /* create bottom-side wall */
  bottom_wall= createWall(pos_wall_bottom.x-.07-d/2,pos_wall_bottom.y,pos_wall_bottom.x+.07+d/2,pos_wall_bottom.y); 
  bottom_wall.setStroke(color(0));
    
    
  /* haptics event timer, create and start a timer that has been configured to trigger onTickEvents */
  /* every TICK (1ms or 1kHz) and run for HOUR_IN_MILLIS (1hr), then resetting */
  haptic_timer = CountdownTimerService.getNewCountdownTimer(this).configure(SIMULATION_PERIOD, HOUR_IN_MILLIS).start();
}

       
/**********************************************************************************************************************
 * Main draw function, updates simulation animation at prescribed framerate 
 **********************************************************************************************************************/
void draw(){
  scale(1,-1); 
  translate(0,-height); 
 
  update_animation(angles.x*radsPerDegree, angles.y*radsPerDegree, pos_ee.x, pos_ee.y);
}


/**********************************************************************************************************************
 * Haptics simulation event, engages state of physical mechanism, calculates and updates physics simulation conditions
 **********************************************************************************************************************/ 
void onTickEvent(CountdownTimer t, long timeLeftUntilFinish){

  /* check if new data is available from physical device */
  if(haply_board.data_available()){

    /* GET END-EFFECTOR STATE (TASK SPACE) */         
    angles.set(haply_2DoF.get_device_angles()); 
    pos_ee.set( haply_2DoF.get_device_position(angles.array()));
    vel_ee.set((pos_ee.copy().sub(pos_ee_last)).div(dt)); 
    pos_ee_last= pos_ee; 

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
      f_contact= f_contact.mult(-k_ball*pen_ball-b_ball*vel_ee2ball_magnitude);   
    }
    else{
      r_ee_contact = r_ee; 
      f_contact.set(0,0); 
    }
  
  
    /* forces due to damping */
    f_damping = (vel_ball.copy()).mult(-b_air); 
    
    
    /* forces due to wall */
    f_wall.set(0,0); 
  
    pen_wall.set((pos_ball.x-r_ball) - pos_wall_left.x, 0); 

    if(pen_wall.x < 0 ){
      f_wall = f_wall.add((pen_wall.mult(-k_wall))).add((vel_ball.copy()).mult(-b_wall));
    }
    pen_wall.set(0, (pos_ball.y-r_ball) - pos_wall_bottom.y); 
    
    
    if(pen_wall.y < 0){
      f_wall = f_wall.add((pen_wall.mult(-k_wall))).add((vel_ball.copy()).mult(-b_wall));
    }
    pen_wall.set((pos_ball.x+r_ball) - pos_wall_right.x, 0); 


    if(pen_wall.x > 0 ){
      f_wall = f_wall.add((pen_wall.mult(-k_wall))).add((vel_ball.copy()).mult(-b_wall));
    }
    
    
    /* sum of forces */ 

    f_ball = (f_contact.copy()).add(f_gravity).add(f_damping).add(f_wall); 
    f_ee = (f_contact.copy()).mult(-1); 
    
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
 * Specifies the parameters for a haply_2DoF pantograph animation object
 */
void createpantograph(){
  
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
	pantograph.vertex(device_origin.x+d_ani, device_origin.y);
	pantograph.vertex(device_origin.x+d_ani, device_origin.y);
	pantograph.endShape(CLOSE);
  
	joint1 = createShape(ELLIPSE, device_origin.x, device_origin.y, d_ani/5, d_ani/5);
	joint1.setStroke(color(0));
  
	joint2 = createShape(ELLIPSE, device_origin.x+d_ani, device_origin.y, d_ani/5, d_ani/5);
	joint2.setStroke(color(0));

	handle = createShape(ELLIPSE, device_origin.x, device_origin.y, 2*r_ee_ani, 2*r_ee_ani);
	handle.setStroke(color(0));
  strokeWeight(5);
}


/**
 * Specifies the parameters for static wall animation object
 */
PShape createWall(float x1, float y1, float x2, float y2){
  
  /* modify pantograph parameters to fit screen */
  x1= pixelsPerMeter*x1; 
  y1= pixelsPerMeter*y1; 
  x2=pixelsPerMeter*x2; 
  y2=pixelsPerMeter*y2; 
  
  return createShape(LINE, device_origin.x+x1, device_origin.y+y1, device_origin.x+x2, device_origin.y+y2);
}


/**
 * Specifies the parameters for dynamic ball object
 */
PShape createBall(float r_ball){
  
  /* modify pantograph parameters to fit screen */
  r_ball = pixelsPerMeter*r_ball; 
  
  return createShape(ELLIPSE, device_origin.x, device_origin.y, 2*r_ball, 2*r_ball);
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
  float l_ani = pixelsPerMeter*l; 
  float L_ani = pixelsPerMeter*L; 
  float d_ani = pixelsPerMeter*d; 
  
  /* Vertex A with th1 from encoder reading */
	pantograph.setVertex(1,device_origin.x+l_ani*cos(th1), device_origin.y+l_ani*sin(th1)); 

  /* Vertex B with th2 from encoder reading */
	pantograph.setVertex(3,device_origin.x+d_ani+l_ani*cos(th2), device_origin.y+l_ani*sin(th2)); 

  /* Vertex E from Fwd Kin calculations */ 
	pantograph.setVertex(2,device_origin.x+x_E, device_origin.y+y_E);  
  
  /* Display the virtual objects with new parameters */
	shape(pantograph); 
	shape(joint1);
	shape(joint2); 

	shape(left_wall );
	shape(right_wall);
	shape(bottom_wall);

  shape(ball, pos_ball.x*pixelsPerMeter , pos_ball.y*pixelsPerMeter); 
  stroke(0);
  
  pushMatrix();  
  shape(handle,x_E+d_ani/6+r_ee, y_E, 2*r_ee*pixelsPerMeter, 2*r_ee*pixelsPerMeter); 
	stroke(0); 
  popMatrix(); 
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


  