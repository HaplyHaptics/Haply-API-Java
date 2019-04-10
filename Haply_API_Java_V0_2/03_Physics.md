# Let's Get Physical, Physical
Please note, this demo is still in development and will likely be split into three separate demos to be made more easy to learn from. Stay tuned!

## To be Covered
1. 2D Object arrays
2. Joints Continued
3. Expanded Button Useage
4. Constructing Transverse Waves

## Setup

Our setup here is identical to the previous demo, we'll be using a button as well as the Haplet. See image below for details.

<img src="Images/IMG_3514.JPG" width ="400px">

In case it isn't clear, the power is linked from the 3.3V pin on the Haply board to the upper half of the button on the breadboard. On the lower half the output splits, first to the AD0 pin while the other side goes through a resistor followed by the GND pin. See the following link for more details - https://www.arduino.cc/en/Tutorial/Button

## Code

The inspiration for this demo was my physics class in high school, I remembered learning about waves and wanted to expand on how that could be taught in a haptic environment. There are three sections, separated by walls which can be moved through when the button is pressed.

The first section is similar to the Drag n Drop demo, except gravity is taken out and random velocities are set to the balls upon initialization. This is meant to replicate an ideal gas, or at least give an idea of how one works on the atomic scale.

The second section is meant to show the behavior of fixed and free ended transverse waves; more info on that can be found here: http://www.physicsclassroom.com/class/waves/Lesson-3/Boundary-Behavior

The third and final section was an attempt to to replicate the behavior of longitudinal waves. An explanation into the difference between longitudinal and transverse waves can be found here - http://hyperphysics.phy-astr.gsu.edu/hbase/Sound/tralon.html

Longitudinal and transverse waves both occur in nature, having a way to interact with them in a haptic environment would have certainly made for an interesting physics class!

See the code which runs this demo below, followed by a gif of the demo in action.

```javascript
import processing.serial.*;
import java.util.Random;
import com.dhchoi.CountdownTimer;
import com.dhchoi.CountdownTimerService;

/* Device block definitions ********************************************************************************************/
Device            widgetOne;
byte              widgetOneID                     = 5;
Board             haplyBoard;
Mechanisms        pantograph;
boolean           rendering_force                 = false;
int               CW = 1;
int               CCW = 0;

/* Simulation Speed Parameters ****************************************************************************************/
final long        SIMULATION_PERIOD          = 1; //ms
final long        HOUR_IN_MILLIS             = 36000000;
CountdownTimer    haptic_timer;
float             dt                        = SIMULATION_PERIOD/1000.0;

// data from Arduino
float[] sensorData; 

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
float worldWidth = 25.0; 
float worldHeight = 20.0; 

float edgeTopLeftX = 0.0; 
float edgeTopLeftY = 0.0; 
float edgeBottomRightX = worldWidth; 
float edgeBottomRightY = worldHeight; 

// Array list of things touching avatar

ArrayList <FContact> touching_avatar;
ArrayList <FContact> touching_avatar_draw;

// joints to be created

FDistanceJoint d1;
boolean joint_created = false;

/* Initialization of the virtual tool */ 

HVirtualCoupling s;  

// Section Borders

FBox b1;
FBox b2;

// Beads Graphic objects array
FCircle[] beads = new FCircle[7];
int[] rands = new int[6];

// Transverse Wave Medium
FCircle[] t1 = new FCircle[100];
FDistanceJoint j1;

// Longitudinal Wave Medium
int cols = 20; //circles in a column
int rows = 20; //circles in a row
FCircle[][] t2 = new FCircle[cols][rows];
FBox h1;
FBox h2;
FBox h3;
FBox h4;
FDistanceJoint j2;
FPrismaticJoint j3;

// Free/ Fixed end button
FCircle r1;
FBox h5;
FPrismaticJoint j4;
FBox h6;
boolean fixed_end = false;

void setup() {
  size(1000, 800);
  
 // Board and Device
  haplyBoard = new Board(this, Serial.list()[1], 0);
  
  pantograph = new Pantagraph();
  
  widgetOne = new Device(widgetOneID, haplyBoard);
  
  widgetOne.set_mechanism(pantograph);
  
  widgetOne.add_actuator(1, CW, 1);
  widgetOne.add_actuator(2, CCW, 2);
  
  widgetOne.add_encoder(1, CW, 180, 13824, 1);
  widgetOne.add_encoder(2, CCW, 0, 13824, 2);
  
  widgetOne.add_analog_sensor("A0");
  
  widgetOne.device_set_parameters();

/*Initialize the world parameters*/ 

  hAPI_Fisica.init(this);
  hAPI_Fisica.setScale(pixelsPerCentimeter); 
  world = new FWorld();
  
  // Borders
  
  FBox b1 = new FBox(25, 0.5);
  b1.setPosition(12, 6.6);
  b1.setStatic(true);
  b1.setFill(0, 0, 0);
  world.add(b1);
   
  FBox b2 = new FBox(25, 0.5);
  b2.setPosition(worldWidth/2, 13.2);
  b2.setStatic(true);
  b2.setFill(0, 0, 0);
  world.add(b2);
  
// create pile of beads

  for (int i=beads.length; i > 0; i--) 
  {
    for (int j=i-1; j > 0; j--)
    {
    Random rand = new Random();
    for (int k=0; k<rands.length; k++)
    {
      int n = rand.nextInt(100);
      rands[k] = n;
    }
    beads[j] = new FCircle(map(rands[0],0,99,0.5,1.5));
    beads[j].setPosition(map(j,0,beads.length, 1, 25), map(i, 0, beads.length, 1, 5));
    beads[j].setFill(map(rands[1],0,99,0,255), map(rands[2],0,99,0,255), map(rands[3],0,99,0,255));
    beads[j].setVelocity(map(rands[4],0,99,-30, 30), map(rands[5], 0, 99, -30, 30));
    beads[j].setFriction(0);
    beads[j].setDensity(50);
    beads[j].setRestitution(1.02);
    beads[j].setHaptic(true, 0, 0);
    beads[j].setName("FCircle");
    world.add(beads[j]);
    }
  }
  
// create Transverse Wave Generator
  for (int i=t1.length-1; i > 0; i--) 
  {
    t1[i] = new FCircle(0.2);
    t1[i].setPosition(map(i, t1.length-1, 1, 1, 24), 11);
    t1[i].setFill(255,200,230);
    t1[i].setNoStroke();
    t1[i].setFriction(0.1);
    t1[i].setDensity(100);
    t1[i].setName("TWave");
    if (i == t1.length-1)
    {
      t1[i].setStatic(true);
    }
    world.add(t1[i]);
  } 
  
  for (int i = t1.length-1; i > 1; i--)
  {
    j1 = new FDistanceJoint(t1[i], t1[i-1]);
    j1.setDamping(0.7);
    j1.setFrequency(25);
    world.add(j1); 
  }
  
// create Longitudinal Waves Generator
 
  for (int i=0; i<cols; i++) 
  { // y axis
    for (int j=0; j < rows; j++)
    { // x axis
      t2[i][j] = new FCircle(0.12);
      t2[i][j].setPosition(map(j, 0, rows-1, worldWidth/2-11, worldWidth/2+11), map(i, 0, cols-1, 13.5, 18.8));
      t2[i][j].setFill(0, 0, 0);
      t2[i][j].setRestitution(1.02);
      t2[i][j].setFriction(0);
      t2[i][j].setName("LWave"); 
      world.add(t2[i][j]);
      if(i == cols-1 || i == 0 || i ==1)
      {
        t2[i][j].setStatic(true);
      }
    }
  }
    
  for (int k = cols-1 ; k > 0 ; k--)
  {
    for (int l=0; l <rows; l++)
    { // x axis
      j2 = new FDistanceJoint(t2[k][l],t2[k-1][l]);
      j2.setLength(10);
      j2.setDamping(1);
      j2.setNoStroke();
      world.add(j2);
    }
  }
 
 FBox h1 = new FBox(23, 0.2);
 h1.setPosition(worldWidth/2, 14);
 h1.setFill(0,0,0);
 h1.setRestitution(1);
 h1.setFriction(50);
 h1.setRotatable(false);
 h1.setDensity(100);
 world.add(h1);
 
 FPrismaticJoint j3 = new FPrismaticJoint(h1, b2);
 world.add(j3);
 
 FBox h2 = new FBox(1, 5);
 h2.setPosition(0.7, 18.7);
 h2.setStatic(true);
 h2.setFill(0,0,0);
 world.add(h2);
 
 FBox h3 = new FBox(1, 5);
 h3.setPosition(24.3, 18.7);
 h3.setStatic(true);
 h3.setFill(0,0,0);
 world.add(h3);
 
 FBox h4 = new FBox(1,0.5);
 h4.setPosition(worldWidth/2,13.5);
 h4.setStatic(true);
 h4.setFill(0,0,0);
 world.add(h4);
 
 FBox h5 = new FBox(0.5, 0.5);
 h5.setPosition(24, 11);
 h5.setSensor(true);
 h5.setStatic(true);
 h5.setRotatable(false);
 world.add(h5);
 
 FPrismaticJoint j4 = new FPrismaticJoint(h5,t1[1]);
 j4.setEnableLimit(fixed_end);
 j4.setLowerTranslation(0);
 j4.setUpperTranslation(0);
 world.add(j4);
 
 FBox h6 = new FBox(0.5, 0.5);
 h6.setPosition(1, 11);
 h6.setSensor(true);
 h6.setStatic(true);
 h6.setRotatable(false);
 world.add(h6);
   
    /* Haptic Tool Initialization   */

  s= new HVirtualCoupling((0.3)); 
  s.h_avatar.setDensity(7);
  s.h_avatar.setFill(255,0,0); 
  s.h_avatar.setSensor(false);
  s.init(world, edgeTopLeftX+worldWidth/2, edgeTopLeftY+2);
  
   /*world Setup*/ 
  world.setGravity(0,0);
  world.setEdges((edgeTopLeftX), (edgeTopLeftY), (edgeBottomRightX), (edgeBottomRightY)); 
  world.setEdgesRestitution(.4);
  world.setEdgesFriction(0.5);
  
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

/**********************************************************************************************************************
 * Haptics simulation event, engages state of physical mechanism, calculates and updates physics simulation conditions
 **********************************************************************************************************************/ 
void onTickEvent(CountdownTimer t, long timeLeftUntilFinish)
{
  sensorData = widgetOne.get_sensor_data();
   
  rendering_force = true;
   
  if (haplyBoard.data_available()) 
  {
    /* GET END-EFFECTOR STATE (TASK SPACE) */
        
      widgetOne.device_read_data();
        
    angles.set(widgetOne.get_device_angles()); 
    pos_ee.set(widgetOne.get_device_position(angles.array()));
    pos_ee.set(pos_ee.copy().mult(275)); 
    
  }

  s.setToolPosition(edgeTopLeftX+worldWidth/2-(pos_ee).x+2, edgeTopLeftY+(pos_ee).y-9.5); 
  s.updateCouplingForce();
  f_ee.set(-s.getVCforceX(), s.getVCforceY());
 
  f_ee.div(15000); //
  torques.set(widgetOne.set_device_torques(f_ee.array()));
  widgetOne.device_write_torques();
 
  
   //Grabbing/ Releasing and changing areas

  touching_avatar =  s.h_avatar.getContacts();  // create array of contacts from avatar
  for(int i = 0; i < touching_avatar.size(); i++)
    { // interates through array of contacts
    if((touching_avatar.get(i).getBody1() != s.h_tool))
      { // make sure tool isnt on list of contacts
      if(touching_avatar.get(i).getBody1().getName() == "FCircle")
        {
        if (joint_created == false)
          {
          if (sensorData[0] < 500)
            {
            d1 = new FDistanceJoint(s.h_avatar, touching_avatar.get(i).getBody1());
            d1.setDamping(100);
            d1.setFrequency(500);
            d1.setLength(5);
            touching_avatar.get(i).getBody1().setStatic(false);
            s.h_avatar.setSensor(false);
            world.add(d1);
            joint_created = true;
            }
          }
         else if (sensorData[0] > 600) 
           {
           world.remove(d1);
           s.h_avatar.setSensor(true);
           joint_created = false;
           }
        }
     }
   }
  
  //println(sensorData[0]);
if (sensorData[0] > 500)
    {
    s.h_avatar.setSensor(true);
    }
else
    {
    s.h_avatar.setSensor(false);
    }
    
  world.step(dt);
  
  rendering_force = false;
         //avatar position for debugging
  //println("X, Y");
  //print(s.h_avatar.getX());
  //print(" ");
  //println(s.h_avatar.getY());

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
```

<img src="Images/Physics.gif" width ="400px">

## 2D Object Arrays

In the first part of the demo we'll be focusing on is the third section, wherein we make a 2D object array of the components of the longitudinal wave. This is done similarly to the object arrays from previous demos; we'll have to initialize the array in memory outside of any loops before creating the objects in the __setup()__ loop. This is done as follows -

```javascript
// Longitudinal Wave Medium
int cols = 20; //circles in a column
int rows = 20; //circles in a row
FCircle[][] t2 = new FCircle[cols][rows];
```
The above technique is a great way to initialize a 2D object array, by changing either the __cols__ or __rows__ variables we can control the entirety of how many objects will be created.

Next we'll iterate through our 2D object array to create the objects. This is similar to the methodology used to create the objects in Drag n Drop, but a little bit different. The advantage here, compared to the previous methodology, is that each object we're creating will have a unique position in the array that we can call. This allows us to quickly select a specific object if we want to manipulate it's properties. In Drag n Drop this wasn't necessary, but you'll see in the code below and in later sections it comes in handy for this demo -
```javascript
// create Longitudinal Waves Generator

for (int i=0; i<cols; i++)
{ // y axis
    for (int j=0; j < rows; j++)
    { // x axis
        t2[i][j] = new FCircle(0.12);
        t2[i][j].setPosition(map(j, 0, rows-1, worldWidth/2-11, worldWidth/2+11), map(i, 0, cols-1, 13.5, 18.8));
        t2[i][j].setFill(0, 0, 0);
        t2[i][j].setRestitution(1.02);
        t2[i][j].setFriction(0);
        t2[i][j].setName("LWave");
        world.add(t2[i][j]);
        if(i == cols-1 || i == 0 || i ==1)
        {
            t2[i][j].setStatic(true);
        }
    }
}
```
Notice how we iterate through the __for__ loops, the syntax is similar to the previous demos but here we are defining our second __j__ variable independantly with regards to the __i__ variable. This will give us a square of objects, rather than a triangle.

The final __if__ statement serves to keep our wave medium in check. The bottom-most and top two rows are kept static, this will keep the columns from deviating too much from their equilibrium position. It can be seen that the top two rows are selected because of where they are in relation to the object which we move to create the longitudinal waves.

As a note, a great trick to find the best location to place objects is to track the avatar as it moves through the scene. The code for this is as follows, it never hurts to include it in your code as you can easily comment it out! Generally this code is put into the __onTickEvent__ loop-

```javascript
//avatar position for debugging
println("X, Y");
print(s.h_avatar.getX());
print(" ");
println(s.h_avatar.getY());
```

## Joints Continued
Keeping with the third section of our demo, we still need to set up our joints to create the wave medium. This is where having an object array really comes in handy, as we'll need to create joints going up each column between our circles. The code to do so is as follows, note how having the object array really becomes useful here. In what other applications can you use this methodology?

```javascript
for (int k = cols-1 ; k > 0 ; k--)
{
    for (int l=0; l <rows; l++)
    { // x axis
        j2 = new FDistanceJoint(t2[k][l],t2[k-1][l]);
        j2.setLength(10);
        j2.setDamping(1);
        j2.setNoStroke();
        world.add(j2);
    }
}
```
Because the object array we created in the last section still exists, we can easily reiterate through the array to generate our joints. This allows us to precisely control the nature and positions of the joints we'd like to include in our scene.

## Expanded Button Usage
It is worth mentioning how the button can take on different utilities at a time. As mentioned before we use it to move through the scene's sections, but at the same time we still need to use it to control the deletion of joints in the first section of our scene. Implimenting this isn't so hard to do, but it is worth it to go over the ability to branch a single input to have multiple results. To see the basic setup and usage of a button, check out the previous lesson in Drag n Drop.

We'll use code similar to before, albeit with a few changes. The idea here is to have a single loop control both grabbing and releasing the ball, and we'll use a second loop to control making our avatar a sensor to allow it to pass from section to section. Because this methodology has a basis in our avatar, it is best to include it in our __onTickEvent__ loop. See below for the grab and release code -

```javascript
//Grabbing/ Releasing and changing areas

touching_avatar =  s.h_avatar.getContacts();  // create array of contacts from avatar
for(int i = 0; i < touching_avatar.size(); i++)
{ // interates through array of contacts
    if((touching_avatar.get(i).getBody1() != s.h_tool))
    { // make sure tool isnt on list of contacts
        if(touching_avatar.get(i).getBody1().getName() == "FCircle")
        {
            if (joint_created == false)
            {
                if (sensorData[0] < 500)
                {
                    d1 = new FDistanceJoint(s.h_avatar, touching_avatar.get(i).getBody1());
                    d1.setDamping(100);
                    d1.setFrequency(500);
                    d1.setLength(5);
                    touching_avatar.get(i).getBody1().setStatic(false);
                    s.h_avatar.setSensor(false);
                    world.add(d1);
                    joint_created = true;
                }
            }
            else if (sensorData[0] > 600)
            {
                world.remove(d1);
                s.h_avatar.setSensor(true);
                joint_created = false;
            }
        }
    }
}
```
 The second loop of code can come right after. Since now we just need the avatar to become a sensor if the button is pressed, there is only one __if__ statement to include -
 
 ```javascript
//println(sensorData[0]);
if (sensorData[0] > 500)
    {
    s.h_avatar.setSensor(true);
    }
else
    {
    s.h_avatar.setSensor(false);
    }
```
And now we have double functionality from our button! This ability can expand far beyond what was shown here, and is not limited to just two functions! There are a variety of usages for a button, all dependant on what you can think of in the context of your haptic envrionment.

## Constructing Transverse Waves
The final part of this demo worth mentioning is the second section; the transverse wave with a free and fixed end. The code used to create this is very similar to that of the longitudinal waves; we'll be creating a 1D object array, and iterating through it to create our balls. Then we'll reiterate through it to create the joints. The important part here is that one end will be unfixed but only allowed to go up and down. We'll accomplish this with a prismatic joint. You'll note that in the creation code there is an option to set the boolean __fixed_joint__ to true, restricting the upward and downward movement of the prismatic joint. This will change the wave to behave like a fixed joint on both sides. The code to create this wave medium is as follows. First, to allocate the memory for the components outside of any setup loops-
```javascript
// Transverse Wave Medium
FCircle[] t1 = new FCircle[100];
FDistanceJoint j1;
```
Also to allocate memory for the free and fixed ends -

```javascript
// Free/ Fixed end button
FCircle r1;
FBox h5;
FPrismaticJoint j4;
FBox h6;
boolean fixed_end = false;
```

In the __setup()__, general object creation is straightforward. We'll just show how to run the loop to create the joints and balls.

```javascript
// create Transverse Wave Generator
for (int i=t1.length-1; i > 0; i--)
{
    t1[i] = new FCircle(0.2);
    t1[i].setPosition(map(i, t1.length-1, 1, 1, 24), 11);
    t1[i].setFill(255,200,230);
    t1[i].setNoStroke();
    t1[i].setFriction(0.01);
    t1[i].setRestitution(1);
    t1[i].setDensity(100);
    t1[i].setName("TWave");
    if (i == t1.length-1)
    {
        t1[i].setStatic(true);
    }
    world.add(t1[i]);
}

for (int i = t1.length-1; i > 1; i--)
{
    j1 = new FDistanceJoint(t1[i], t1[i-1]);
    j1.setDamping(0.1);
    j1.setFrequency(25);
    world.add(j1);
}
```
The creation of the prismatic joint is as follows -
```javascript
FPrismaticJoint j4 = new FPrismaticJoint(h5,t1[1]);
j4.setEnableLimit(fixed_end);
j4.setLowerTranslation(0);
j4.setUpperTranslation(0);
world.add(j4);
```
Something to make note of is the __setDensity()__, __setFriction()__, and __setRestitution()__, methods in our object creation. The goal of these functions is to add a haptic feel to when the avatar moves through the wave medium and creates a pulse. As the inspiration for this demo was to rethink how I was taught about waves it highschool, it is important to emphasize the haptics of this demo where possible. A great takeaway here is just that; how haptics can effect the classroom environment. There are so many opportunities for this, use these tools to make your own.
