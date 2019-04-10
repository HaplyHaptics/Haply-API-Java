/**
 **********************************************************************************************************************
 * @file       Analog_Input_Example.pde
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

byte              widgetOneID                         = 5;
/* end device block definition *****************************************************************************************/



/* framerate definition ************************************************************************************************/
long              baseFrameRate                       = 120;
/* end framerate definition ********************************************************************************************/  



/* elements definition *************************************************************************************************/
int               circleX, circleY;
int               circleSize                          = 10;
color             circleColor;

/* sensor input data */
float[] sensorData;

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
  
  widgetOne.add_analog_sensor("A1");
  widgetOne.device_set_parameters();
  
  /* visual elements setup */
  circleX = width/2;
  circleY = height/2;
  
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
  
  sensorData = widgetOne.get_sensor_data();
  
  println(sensorData[0]);
  
  circleSize = (int)sensorData[0]/2;
  
  stroke(0);
  ellipse(circleX, circleY, circleSize, circleSize);
  
  fill(255);
}
/* end draw section ****************************************************************************************************/



/* simulation section **************************************************************************************************/
class SimulationThread implements Runnable { 
  public void run(){
    /* put haptic simulation code here, runs repeatedly at 1kHz as defined in setup */
    if(haplyBoard.data_available()){
      widgetOne.device_read_data();
    }
    
    widgetOne.device_write_torques();
  }
}
/* end simulation section **********************************************************************************************/



/* helper functions section, place helper functions here ***************************************************************/

/* end helper functions section ****************************************************************************************/