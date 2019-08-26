/**
 **********************************************************************************************************************
 * @file       Hello_Wall.pde
 * @author     Steve Ding, Colin Gallacher
 * @version    V4.0.0
 * @date       20-September-2018
 * @brief      Haply pantograph device basic haptic example
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
/* end device block definition *****************************************************************************************/



/* framerate definition ************************************************************************************************/
long              baseFrameRate                       = 120;
/* end framerate definition ********************************************************************************************/  



/* elements definition *************************************************************************************************/
PShape            pGraph, joint1, joint2, handle;
PShape            wall;

/* Screen and world setup parameter */
int               pixelsPerMeter                      = 4000;
float             radsPerDegree                       = 0.01745;

/* pantograph link parameters in meters */
float             l                                   = 0.05;
float             L                                   = 0.07;
float             d                                   = 0.02;

float             rEE                                 = d/3;
float             kWall                               = 400;

PVector           deviceOrigin                        = new PVector(0, 0);

/* data for wall */
PVector           fWall                               = new PVector(0, 0);
PVector           penWall                             = new PVector(0, 0);
PVector           posWall                             = new PVector(d/2, 0.07);


/* data for a 2DOF device */
/* joint space */
PVector           angles                              = new PVector(0, 0);
PVector           torques                             = new PVector(0, 0);

/* task space */
PVector           posEE                               = new PVector(0, 0);
PVector           fEE                                 = new PVector(0, 0);
/* end elements definition *********************************************************************************************/  



/* setup section *******************************************************************************************************/
void setup(){
  /* put setup code here, run once: */
  
  /* screen size definition */
  size(1057, 594, P2D);
  
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
  pantograph          = new Pantograph();
  widgetOne           = new Device(widgetOneID, haplyBoard);
  
  widgetOne.set_mechanism(pantograph);
  
  widgetOne.add_actuator(1, CW, 1);
  widgetOne.add_actuator(2, CW, 2);
 
  widgetOne.add_encoder(1, CW, 180, 13824, 1);
  widgetOne.add_encoder(2, CW, 0, 13824, 2);
  
  widgetOne.device_set_parameters();
  
  
  /* visual elements setup */
  background(0);
  deviceOrigin.add(width/2, height/5);
  
  create_pantograph();
  wall                = createWall(posWall.x-0.2, posWall.y, posWall.x+0.2, posWall.y);
  wall.setStroke(color(0));
  
  
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
  update_animation(angles.x * radsPerDegree, angles.y * radsPerDegree, posEE.x, posEE.y); 
}
/* end draw section ****************************************************************************************************/



/* simulation section **************************************************************************************************/
class SimulationThread implements Runnable {

  public void run(){
    /* put haptic simulation code here, runs repeatedly at 1kHz as defined in setup */
    
    if(haplyBoard.data_available()){
    
      widgetOne.device_read_data();
        
      angles.set(widgetOne.get_device_angles());
      posEE.set(widgetOne.get_device_position(angles.array()));
      posEE.set(device2grahics(posEE));
        
      fWall.set(0, 0);
    
      penWall.set(0, (posWall.y - (posEE.y + rEE)));
    
      if(penWall.y < 0){
        fWall = fWall.add(penWall.mult(-kWall));
      }
    
      fEE = (fWall.copy()).mult(-1);
      fEE.set(graphics2device(fEE));
    }
  
    torques.set(widgetOne.set_device_torques(fEE.array()));
    widgetOne.device_write_torques(); 
  }
}
/* end simulation section **********************************************************************************************/



/* helper functions section, place helper functions here ***************************************************************/

void create_pantograph(){
  
  float lAni = pixelsPerMeter * l;
  float LAni = pixelsPerMeter * L;
  float dAni = pixelsPerMeter * d;
  float rEEAni = pixelsPerMeter * rEE;
  
  pGraph = createShape();
  pGraph.beginShape();
  pGraph.fill(255);
  pGraph.stroke(0);
  pGraph.strokeWeight(2);
  
  pGraph.vertex(deviceOrigin.x, deviceOrigin.y);
  pGraph.vertex(deviceOrigin.x, deviceOrigin.y);
  pGraph.vertex(deviceOrigin.x, deviceOrigin.y);
  pGraph.vertex(deviceOrigin.x-dAni, deviceOrigin.y);
  pGraph.vertex(deviceOrigin.x-dAni, deviceOrigin.y);
  pGraph.endShape(CLOSE);
  
  joint1 = createShape(ELLIPSE, deviceOrigin.x, deviceOrigin.y, dAni/5, dAni/5);
  joint1.setStroke(color(0));
  
  joint2 = createShape(ELLIPSE, deviceOrigin.x-dAni, deviceOrigin.y, dAni/5, dAni/5);
  joint2.setStroke(color(0));
  
  handle = createShape(ELLIPSE, deviceOrigin.x, deviceOrigin.y, 2*rEEAni, 2*rEEAni);
  handle.setStroke(color(0));
  strokeWeight(5);
}


PShape createWall(float x1, float y1, float x2, float y2){
  
  x1 = pixelsPerMeter * x1;
  y1 = pixelsPerMeter * y1;
  x2 = pixelsPerMeter * x2;
  y2 = pixelsPerMeter * y2;
  
  return createShape(LINE, deviceOrigin.x + x1, deviceOrigin.y + y1, deviceOrigin.x + x2, deviceOrigin.y+y2);
}


void update_animation(float th1, float th2, float xE, float yE){
  background(255);
  
  xE = pixelsPerMeter * xE;
  yE = pixelsPerMeter * yE;
  
  th1 = 3.14 - th1;
  th2 = 3.14 - th2;
  
  float lAni = pixelsPerMeter * l;
  float LAni = pixelsPerMeter * L;
  float dAni = pixelsPerMeter * d;
  
  pGraph.setVertex(1, deviceOrigin.x + lAni*cos(th1), deviceOrigin.y + lAni*sin(th1));
  pGraph.setVertex(3, deviceOrigin.x - dAni + lAni*cos(th2), deviceOrigin.y + lAni * sin(th2));
  pGraph.setVertex(2, deviceOrigin.x + xE, deviceOrigin.y + yE);
  
  shape(pGraph);
  shape(joint1);
  shape(joint2);
  shape(wall);
  
  pushMatrix();
  shape(handle, xE + (d/12*pixelsPerMeter), yE, 2*rEE*pixelsPerMeter, 2*rEE*pixelsPerMeter);
  stroke(0);
  popMatrix();
}


PVector device2grahics(PVector deviceFrame){
  return deviceFrame.set(-deviceFrame.x, deviceFrame.y);
}


PVector graphics2device(PVector graphicsFrame){
  return graphicsFrame.set(-graphicsFrame.x, graphicsFrame.y);
}
/* end helper functions section ****************************************************************************************/