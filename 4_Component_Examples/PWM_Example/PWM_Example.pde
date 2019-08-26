/**
 **********************************************************************************************************************
 * @file       PWM_Example.pde
 * @author     Steve Ding, Colin Gallacher
 * @version    V5.1.0
 * @date       19-September-2018
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
HScrollbar        bar;
float             barPosition;
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
  
  widgetOne.add_pwm_pin(13);
  widgetOne.device_set_parameters();
  
  /* visual elements setup */
  bar                 = new HScrollbar(0, height/2, width, 16, 16);
  
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
  fill(255);
  
  bar.update();
  bar.display();
  
  barPosition = bar.getPos()/6.4;
  widgetOne.set_pwm_pulse(13, barPosition);
  println("LED brightness is at: " + barPosition + " %");
}
/* end draw section ****************************************************************************************************/



/* simulation section **************************************************************************************************/
class SimulationThread implements Runnable { 
  public void run(){
    /* put haptic simulation code here, runs repeatedly at 1kHz as defined in setup */
    widgetOne.device_write_torques();
  }
}
/* end simulation section **********************************************************************************************/




/* helper functions section, place helper functions here ***************************************************************/

class HScrollbar {
  
  int swidth, sheight;    // width and height of bar
  float xpos, ypos;       // x and y position of bar
  float spos, newspos;    // x position of slider
  float sposMin, sposMax; // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;

  HScrollbar (float xp, float yp, int sw, int sh, int l) {
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos + swidth/2 - sheight/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
  }

  void update() {
    if (overEvent()) {
      over = true;
    } else {
      over = false;
    }
    if (mousePressed && over) {
      locked = true;
    }
    if (!mousePressed) {
      locked = false;
    }
    if (locked) {
      newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
    }
    if (abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
  }

  float constrain(float val, float minv, float maxv) {
    return min(max(val, minv), maxv);
  }

  boolean overEvent() {
    if (mouseX > xpos && mouseX < xpos+swidth &&
       mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    noStroke();
    fill(204);
    rect(xpos, ypos, swidth, sheight);
    if (over || locked) {
      fill(0, 0, 0);
    } else {
      fill(102, 102, 102);
    }
    rect(spos, ypos, sheight, sheight);
  }

  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    return spos * ratio;
  }  
}
/* end helper functions section ****************************************************************************************/