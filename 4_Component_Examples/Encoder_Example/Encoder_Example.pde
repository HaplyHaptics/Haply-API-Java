/**
 **********************************************************************************************************************
 * @file       Encoder_Example.pde
 * @author     Steve Ding, Colin Gallacher
 * @version    V5.1.0
 * @date       20-September-2018
 * @brief      Haply base simulation template
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
Mechanisms        SimpleActuatorMech;

byte              widgetOneID                         = 5;
int               CW                                  = 0;
int               CCW                                 = 1;
/* end device block definition *****************************************************************************************/ 



/* framerate definition ************************************************************************************************/
long              baseFrameRate                       = 120;
/* end framerate definition ********************************************************************************************/  



/* elements definition *************************************************************************************************/
int               circleX, circleY;
int               circleSize                          = 80;

int               circleLeftX, circleLeftY;
int               circleLeftSize                      = 60;

int               circleRightX, circleRightY;
int               circleRightSize                     = 60;

boolean           circleOver                          = false;
boolean           leftCircleOver                      = false;
boolean           rightCircleOver                     = false;

color             highlight;
PFont             font;

/*motor force and angle position values */
float[]           motorForce                          = new float[1];
float[]           motorAngle                          = new float[1];

/* end elements definition *********************************************************************************************/  



/* setup section *******************************************************************************************************/
void setup(){
  /* put setup code here, run once: */
  
  /* screen size definition */
  size(640, 360);
  
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
  SimpleActuatorMech  = new SimpleActuatorMech(); 
  
  widgetOne.set_mechanism(SimpleActuatorMech);
  widgetOne.add_actuator(1, CW, 1);
  widgetOne.add_encoder(1, CW, 0, 13824, 1);
  widgetOne.device_set_parameters();
  
  /* visual elements setup */
  circleX             = width/2;
  circleY             = height/2;
  
  circleLeftX         = width/2 - 120;
  circleLeftY         = height/2;
  
  circleRightX        = width/2 + 120;
  circleRightY        = height/2;
  
  highlight           = color(204);
  
  font                = createFont("Arial", 16, true);
  
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
  update(mouseX, mouseY);
  background(255);
  textFont(font, 22);
  
  
  if(circleOver){
    fill(highlight);
  }else{
    fill(255);
  }
  stroke(0);
  ellipse(circleX, circleY, circleSize, circleSize);
  fill(0, 0, 0);
  textAlign(CENTER);
  text("Stop", circleX, circleY+5);
  
  
  if(leftCircleOver){
    fill(highlight);
  }else{
    fill(255);
  }
  stroke(0);
  ellipse(circleLeftX, circleLeftY, circleLeftSize, circleLeftSize);
  fill(0, 0, 0);
  textAlign(CENTER);
  text("CCW", circleLeftX, circleLeftY+5);
  
  
  if(rightCircleOver){
    fill(highlight);
  }else{
    fill(255);
  }
  stroke(0);
  ellipse(circleRightX, circleRightY, circleRightSize, circleRightSize);
  fill(0, 0, 0);
  textAlign(CENTER);
  text("CW", circleRightX, circleRightY+5);
  
  
  fill(0, 0, 0);
  textAlign(CENTER);
  text("number of turns from start: ", width/2, height/4);
  
  fill(0, 0, 0);
  textAlign(CENTER);
  text(motorAngle[0]/360, width/2, 1*height/3);
  
  
  fill(0, 0, 0);
  textAlign(CENTER);
  text("rotation from start in degrees: ", width/2, 3*height/4);
  
  fill(0, 0, 0);
  textAlign(CENTER);
  text(motorAngle[0], width/2, 5*height/6);
  
  
  fill(255);
}
/* end draw section ****************************************************************************************************/



/* simulation section **************************************************************************************************/
class SimulationThread implements Runnable { 
  public void run(){
    /* put haptic simulation code here, runs repeatedly at 1kHz as defined in setup */
    if(haplyBoard.data_available()){
      widgetOne.device_read_data();
      motorAngle = widgetOne.get_device_angles();
    }
    
    widgetOne.device_write_torques();
  }
}
/* end simulation section **********************************************************************************************/



/* helper functions section, place helper functions here ***************************************************************/

void update(int x, int y){
  if(overCircle(circleX, circleY, circleSize)){
    circleOver = true;
    leftCircleOver = rightCircleOver = false;
  }
  else if(overCircle(circleLeftX, circleLeftY, circleLeftSize)){
    leftCircleOver = true;
    circleOver = rightCircleOver = false;
  }
  else if(overCircle(circleRightX, circleRightY, circleRightSize)){
    rightCircleOver = true;
    circleOver = leftCircleOver = false;
  }
  else{
    circleOver = leftCircleOver = rightCircleOver = false;
  }
}


void mousePressed(){
  float[] force;
  
  if(circleOver){
    motorForce[0] = 0;
    force = widgetOne.set_device_torques(motorForce);
  }
  if(leftCircleOver){
    motorForce[0] = -1;
    force = widgetOne.set_device_torques(motorForce);
  }
  if(rightCircleOver){
    motorForce[0] = 1;
    force = widgetOne.set_device_torques(motorForce);
  }
}


boolean overCircle(int x, int y, int diameter){
  
  float disX = x - mouseX;
  float disY = y - mouseY;
  
  if(sqrt(sq(disX) + sq(disY)) < diameter/2){
    return true;
  }else{
    return false;
  }
}
/* end helper functions section ****************************************************************************************/