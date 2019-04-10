# hAPI Fisica

The following tutorial was developed by [Ricard Marxer](www.ricardmarxer.com/). It has been adapted by [Colin Gallacher](http://crgallacher.com) to work with the [hAPI fisica mod](www.github.com/haphub/hAPI_Fisica) from the original [fisica](www.ricardmarxer.com/fisica/). 

The hAPI Fisica library is a wrapper to enable haptic functionality in Ricard Marxer's Fisica library for Processing. The hAPI Fisica library wraps the JBox2D physics engine so that it can be easily used within the Processing environment. hAPI hAPI Fisica enables this library to be used with the Haply Development kit and Hapkit. 

The detailed documentation can be found at: https://haplyhaptics.github.io/hAPI_Fisica/

see also: https://haplyhaptics.github.io/hAPI/ for information on how the hAPI interfaces between Processing and the Haply and Hapkit open-sourced haptic devices 

For any questions or concerns please email Colin Gallacher at crgallacher@gmail.com


## hAPI Fisica / JBox2D physics engine



### From Processing


This tutorial is about [fisica](https://web.archive.org/web/20140802193416/http://www.ricardmarxer.com/fisica/ "http://www.ricardmarxer.com/fisica/"), a wrapper around JBox2D physics engine originally devloped by Ricard Marxer to work in Processing. The fisica library has been modified and extended to enable usage with the [Haply Development Kit](http://www.haply.co) and the [Hapkit](http://hapkit.stanford.edu). This library makes it much easier to create physical models by exposing an object oriented API. The tutorial is based on version 12 of fisica for Processing 2.

## Contents

<div id="globalWrapper">

<div id="column-content">

<div id="content"><a name="top" id="top"></a>


<table id="toc" class="toc" summary="Contents">

<tbody>

<tr>

<td>


<span class="toctoggle">[[hide](javascript:toggleToc())]</span></div>

*   [<span class="tocnumber">1</span> <span class="toctext">Physics libraries for Processing</span>]()
*   [<span class="tocnumber">2</span> <span class="toctext">Motivation</span>]()
*   [<span class="tocnumber">3</span> <span class="toctext">Hello World</span>]()
    *   [<span class="tocnumber">3.1</span> <span class="toctext">Initialize</span>]()
    *   [<span class="tocnumber">3.2</span> <span class="toctext">Create the world</span>]()
    *   [<span class="tocnumber">3.3</span> <span class="toctext">Execute and draw the world</span>]()
    *   [<span class="tocnumber">3.4</span> <span class="toctext">The first body</span>]()
    *   [<span class="tocnumber">3.5</span> <span class="toctext">Add borders to the world</span>]()
*   [<span class="tocnumber">4</span> <span class="toctext">The world</span>]()
    *   [<span class="tocnumber">4.1</span> <span class="toctext">Properties and actions</span>]()
*   [<span class="tocnumber">5</span> <span class="toctext">The bodies</span>]()
    *   [<span class="tocnumber">5.1</span> <span class="toctext">FBox</span>]()
    *   [<span class="tocnumber">5.2</span> <span class="toctext">FCircle</span>]()
    *   [<span class="tocnumber">5.3</span> <span class="toctext">FPoly</span>]()
    *   [<span class="tocnumber">5.4</span> <span class="toctext">FLine</span>]()
    *   [<span class="tocnumber">5.5</span> <span class="toctext">FCompound</span>]()
*   [<span class="tocnumber">6</span> <span class="toctext">Common properties of bodies</span>]()
    *   [<span class="tocnumber">6.1</span> <span class="toctext">Dynamic properties</span>]()
    *   [<span class="tocnumber">6.2</span> <span class="toctext">Material properties</span>]()
    *   [<span class="tocnumber">6.3</span> <span class="toctext">Properties of style (drawing)</span>]()
    *   [<span class="tocnumber">6.4</span> <span class="toctext">Other properties - I</span>]()
    *   [<span class="tocnumber">6.5</span> <span class="toctext">Other properties - II</span>]()
    *   [<span class="tocnumber">6.6</span> <span class="toctext">Actions of the body</span>]()
*   [<span class="tocnumber">7</span> <span class="toctext">Joints</span>]()
    *   [<span class="tocnumber">7.1</span> <span class="toctext">FDistanceJoint - The spring</span>]()
        *   [<span class="tocnumber">7.1.1</span> <span class="toctext">Properties</span>]()
    *   [<span class="tocnumber">7.2</span> <span class="toctext">FPrismaticJoint - The rotor</span>]()
        *   [<span class="tocnumber">7.2.1</span> <span class="toctext">Properties</span>]()
    *   [<span class="tocnumber">7.3</span> <span class="toctext">FRevoluteJoint - The axis</span>]()
        *   [<span class="tocnumber">7.3.1</span> <span class="toctext">Properties</span>]()
*   [<span class="tocnumber">8</span> <span class="toctext">Common properties of joints</span>]()
    *   [<span class="tocnumber">8.1</span> <span class="toctext">Dynamic properties</span>]()
*   [<span class="tocnumber">9</span> <span class="toctext">Contacts</span>]()
    *   [<span class="tocnumber">9.1</span> <span class="toctext">Contacts are events</span>]()
    *   [<span class="tocnumber">9.2</span> <span class="toctext">Not everything is valid with contacts</span>]()
    *   [<span class="tocnumber">9.3</span> <span class="toctext">Properties of contacts</span>]()
    *   [<span class="tocnumber">9.4</span> <span class="toctext">A different form of access to contacts</span>]()

</td>

</tr>

</tbody>

</table>


# <span class="mw-headline">Physics libraries for Processing</span>

There are [different physics libraries](https://web.archive.org/web/20140802193416/http://processing.org/reference/libraries/#simulation_math "http://processing.org/reference/libraries/#simulation_math") for Processing:

*   _Traer Physics_: Physics simulator for particles
*   _toxiclibs_: Module vertletphysics is a simple 3D physics simulator
*   _PPhys2D_: Built on Phys2D (alternative to JBox2D not maintained any more)
*   _PBox2D_: Collection of help functions for JBox2D
*   _BoxWrap2d_: Library built on top of JBox2D
*   _fisica_: Object oriented implementation of JBox2D

<a name="Motivation" id="Motivation"></a>

# <span class="mw-headline">Motivation</span>

Make the creation of 2D physics simulations in Processing as easy as possible without hiding any functionality. Main Characteristics:

*   Object orientation
*   Default values
*   Implementation of common user cases
*   Manage styles like Processing
*   Manage events like Processing

Allow advanced use of JBox2D:

*   Access to underlying objects to allow access to full JBox2D

<a name="Hello_World" id="Hello_World"></a>

# <span class="mw-headline">Hello World</span>

<a name="Initialize" id="Initialize"></a>

## <span class="mw-headline">Initialize</span>

*   Call [hAPI_fisica.init()](https://web.archive.org/web/20140802193416/http://ricardmarxer.com/hAPI_fisica/reference/fisica/hAPI_hAPI_Fisica.html#init%28processing.core.PApplet%29 "http://ricardmarxer.com/fisica/reference/fisica/hAPI_hAPI_Fisica.html#init(processing.core.PApplet)") in setup() with the sketch as argument

<div dir="ltr" style="text-align: left;">

<div class="source-processing" style="font-family: monospace;">

<pre>

[<span class="kw1">void</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/void.html) [<span class="kw3">setup</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/setup_.html)<span class="br0">(</span><span class="br0">)</span> <span class="br0">{</span>
  [<span class="kw2">size</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/size_.html)<span class="br0">(</span><span class="nu0">400</span><span class="sy0">,</span> <span class="nu0">400</span><span class="br0">)</span><span class="sy0">;</span>

  hAPI_fisica<span class="sy0">.</span><span class="me1">init</span><span class="br0">(</span>[<span class="kw1">this</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/this.html)<span class="br0">)</span><span class="sy0">;</span>
<span class="br0">}</span></pre>

</div>

</div>

<a name="Create_the_world" id="Create_the_world"></a>

## <span class="mw-headline">Create the world</span>

*   Declare a global variable [FWorld](https://web.archive.org/web/20140802193416/http://ricardmarxer.com/fisica/reference/fisica/FWorld.html#FWorld "http://ricardmarxer.com/fisica/reference/fisica/FWorld.html#FWorld")
*   Define a variable in setup() after initializing fisica
*   By default the world has 3 times the size of the sketch
*   Bodies leaving the world are stopped being simulated

<div dir="ltr" style="text-align: left;">

<div class="source-processing" style="font-family: monospace;">

<pre>

FWorld world<span class="sy0">;</span>

[<span class="kw1">void</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/void.html) [<span class="kw3">setup</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/setup_.html)<span class="br0">(</span><span class="br0">)</span> <span class="br0">{</span>
  [<span class="kw2">size</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/size_.html)<span class="br0">(</span><span class="nu0">400</span><span class="sy0">,</span> <span class="nu0">400</span><span class="br0">)</span><span class="sy0">;</span>

  hAPI_Fisica<span class="sy0">.</span><span class="me1">init</span><span class="br0">(</span>[<span class="kw1">this</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/this.html)<span class="br0">)</span><span class="sy0">;</span>
  world <span class="sy0">=</span> [<span class="kw1">new</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/new.html) FWorld<span class="br0">(</span><span class="br0">)</span><span class="sy0">;</span>
<span class="br0">}</span></pre>

</div>

</div>

<a name="Execute_and_draw_the_world" id="Execute_and_draw_the_world"></a>

## <span class="mw-headline">Execute and draw the world</span>

*   Drawing and simulation are separated in two functions
*   Call FWorld [step()](https://web.archive.org/web/20140802193416/http://ricardmarxer.com/fisica/reference/fisica/FWorld.html#step%28%29 "http://ricardmarxer.com/fisica/reference/fisica/FWorld.html#step()") and [draw()]() functions in draw()
*   By default step() grows 1/60 seconds per step
*   By default draw() draws to your sketch

<div dir="ltr" style="text-align: left;">

<div class="source-processing" style="font-family: monospace;">

<pre>[<span class="kw1">void</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/void.html) [<span class="kw3">draw</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/draw_.html)<span class="br0">(</span><span class="br0">)</span> <span class="br0">{</span>
  world<span class="sy0">.</span><span class="me1">step</span><span class="br0">(</span><span class="br0">)</span><span class="sy0">;</span>
  world<span class="sy0">.</span>[<span class="kw3">draw</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/draw_.html)<span class="br0">(</span><span class="br0">)</span><span class="sy0">;</span>
<span class="br0">}</span></pre>

</div>

</div>

*   FWorld.draw() doesn't delete the background, you have to call background()
*   Also you can make a debug drawing calling [drawDebug()](https://web.archive.org/web/20140802193416/http://ricardmarxer.com/fisica/reference/fisica/FWorld.html#drawDebug%28%29 "http://ricardmarxer.com/fisica/reference/fisica/FWorld.html#drawDebug()")

<a name="The_first_body" id="The_first_body"></a>

## <span class="mw-headline">The first body</span>

*   Declare and construct a variable of type [FBox](https://web.archive.org/web/20140802193416/http://ricardmarxer.com/fisica/reference/fisica/FBox.html "http://ricardmarxer.com/fisica/reference/fisica/FBox.html")
*   Add the body to the world

<div dir="ltr" style="text-align: left;">

<div class="source-processing" style="font-family: monospace;">

<pre>[<span class="kw1">void</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/void.html) [<span class="kw3">setup</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/setup_.html)<span class="br0">(</span><span class="br0">)</span> <span class="br0">{</span>
  <span class="co1">// ...</span>
  FBox b <span class="sy0">=</span> [<span class="kw1">new</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/new.html) FBox<span class="br0">(</span><span class="nu0">30</span><span class="sy0">,</span> <span class="nu0">50</span><span class="br0">)</span><span class="sy0">;</span>
  b<span class="sy0">.</span><span class="me1">setPosition</span><span class="br0">(</span>[<span class="kw5">width</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/width.html)<span class="sy0">/</span><span class="nu0">2</span><span class="sy0">,</span> [<span class="kw5">height</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/height.html)<span class="sy0">/</span><span class="nu0">2</span><span class="br0">)</span><span class="sy0">;</span>
  world<span class="sy0">.</span>[<span class="kw2">add</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/add_.html)<span class="br0">(</span>b<span class="br0">)</span><span class="sy0">;</span>
<span class="br0">}</span></pre>

</div>

</div>

*   By default 20 pixles == 1 meter. To change it call [hAPI_hAPI_Fisica.setScale()](https://web.archive.org/web/20140802193416/http://ricardmarxer.com/fisica/reference/fisica/hAPI_Fisica.html#setScale%28float%29 "http://ricardmarxer.com/fisica/reference/fisica/hAPI_hAPI_Fisica.html#setScale(float)") after hAPI_hAPI_Fisica.init(this).
*   By default the world has gravity. To change it call [world.setGravity()]()
*   The body "falls" from the screen.

<a name="Add_borders_to_the_world" id="Add_borders_to_the_world"></a>

## <span class="mw-headline">Add borders to the world</span>

*   Call [world.setEdges()]() at setup() creates 4 static bodies which limits the world to the borders of the sketch.
*   This bodies are accessible: world.left, world.right, world.bottom, world.top
*   You can delete the ones you don't need.
*   By default this bodies are black.

<div dir="ltr" style="text-align: left;">

<div class="source-processing" style="font-family: monospace;">

<pre>[<span class="kw1">void</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/void.html) [<span class="kw3">setup</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/setup_.html)<span class="br0">(</span><span class="br0">)</span> <span class="br0">{</span>
  <span class="co1">// ...</span>

  world<span class="sy0">.</span><span class="me1">setEdges</span><span class="br0">(</span><span class="br0">)</span><span class="sy0">;</span>
  world<span class="sy0">.</span><span class="me1">remove</span><span class="br0">(</span>world<span class="sy0">.</span><span class="me1">top</span><span class="br0">)</span><span class="sy0">;</span>
<span class="br0">}</span></pre>

</div>

</div>

*   By default the bodies can be dragged with the mouse.

<a name="The_world" id="The_world"></a>

# <span class="mw-headline">The world</span>

<a name="Properties_and_actions" id="Properties_and_actions"></a>

## <span class="mw-headline">Properties and actions</span>


**Borders**: You can change some of the border properties: 

<div dir="ltr" style="text-align: left;">

<div class="source-processing" style="font-family: monospace;">


<pre>   [world.setEdgesFriction(0)](https://web.archive.org/web/20140802193416/http://ricardmarxer.com/fisica/reference/fisica/FWorld.html#setEdgesFriction%28float%29 "http://ricardmarxer.com/fisica/reference/fisica/FWorld.html#setEdgesFriction(float)")
   [world.setEdgesRestitution(1)]()
</pre>

</div>

</div>


**Gravity**: The world has a gravity which affects all mobile bodies. It can be changed:

<div dir="ltr" style="text-align: left;">

<div class="source-processing" style="font-family: monospace;">

<pre>   [world.setGravity(0, -100)]()
</pre>

</div>
</div>

**Draggable**: Bodies of the world can be dragged by mouse. This can be turned off:



<pre>   [world.setGrabbable(false)]()
</pre>



**Body at one position**: You can determine a body (or all bodies) which are at one position of the world:



<pre>   [world.getBody(10.0, 10.0)]()
   [world.getBodies(10.0, 10.0)]()
</pre>



**Clear**: All bodies and connections can be cleared:

<pre>   [world.clear()]()
</pre>


</div>

</div>


<a name="The_bodies" id="The_bodies"></a>

# <span class="mw-headline">The bodies</span>

<a name="FBox" id="FBox"></a>

## <span class="mw-headline">FBox</span>

*   Variables of type [FBox](https://web.archive.org/web/20140802193416/http://ricardmarxer.com/fisica/reference/fisica/FBox.html "http://ricardmarxer.com/fisica/reference/fisica/FBox.html") have shape of a rectangle
*   Constructor has 2 arguments: width, height

<div dir="ltr" style="text-align: left;">

<div class="source-processing" style="font-family: monospace;">

<pre>FBox b <span class="sy0">=</span> [<span class="kw1">new</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/new.html) FBox<span class="br0">(</span><span class="nu0">30</span><span class="sy0">,</span> <span class="nu0">50</span><span class="br0">)</span><span class="sy0">;</span>
b<span class="sy0">.</span><span class="me1">setPosition</span><span class="br0">(</span><span class="nu0">100</span><span class="sy0">,</span> <span class="nu0">100</span><span class="br0">)</span><span class="sy0">;</span>
world<span class="sy0">.</span>[<span class="kw2">add</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/add_.html)<span class="br0">(</span>b<span class="br0">)</span><span class="sy0">;</span></pre>

</div>

</div>

Change the dimensions of the rectangle:

<div dir="ltr" style="text-align: left;">

<div class="source-processing" style="font-family: monospace;">

<pre>b<span class="sy0">.</span><span class="me1">setWidth</span><span class="br0">(</span><span class="nu0">40</span><span class="br0">)</span><span class="sy0">;</span>
b<span class="sy0">.</span><span class="me1">setHeight</span><span class="br0">(</span><span class="nu0">40</span><span class="br0">)</span><span class="sy0">;</span></pre>

</div>

</div>

<a name="FCircle" id="FCircle"></a>

## <span class="mw-headline">FCircle</span>

*   Variables of type [FCircle](https://web.archive.org/web/20140802193416/http://ricardmarxer.com/fisica/reference/fisica/FCircle.html "http://ricardmarxer.com/fisica/reference/fisica/FCircle.html") have shape of a circle
*   Constructor has 1 argument: diameter

<div dir="ltr" style="text-align: left;">

<div class="source-processing" style="font-family: monospace;">

<pre>FCircle c <span class="sy0">=</span> [<span class="kw1">new</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/new.html) FCircle<span class="br0">(</span><span class="nu0">30</span><span class="br0">)</span><span class="sy0">;</span>
c<span class="sy0">.</span><span class="me1">setPosition</span><span class="br0">(</span><span class="nu0">200</span><span class="sy0">,</span> <span class="nu0">100</span><span class="br0">)</span><span class="sy0">;</span>
world<span class="sy0">.</span>[<span class="kw2">add</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/add_.html)<span class="br0">(</span>c<span class="br0">)</span><span class="sy0">;</span></pre>

</div>

</div>

Change the dimensions of the circle:

<div dir="ltr" style="text-align: left;">

<div class="source-processing" style="font-family: monospace;">

<pre>c<span class="sy0">.</span><span class="me1">setSize</span><span class="br0">(</span><span class="nu0">40</span><span class="br0">)</span><span class="sy0">;</span></pre>

</div>

</div>

<a name="FPoly" id="FPoly"></a>

## <span class="mw-headline">FPoly</span>

*   Variables of type [FPoly](https://web.archive.org/web/20140802193416/http://ricardmarxer.com/fisica/reference/fisica/FPoly.html "http://ricardmarxer.com/fisica/reference/fisica/FPoly.html") have shape of a polygon
*   Constructor without arguments

<div dir="ltr" style="text-align: left;">

<div class="source-processing" style="font-family: monospace;">

<pre>FPoly p <span class="sy0">=</span> [<span class="kw1">new</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/new.html) FPoly<span class="br0">(</span><span class="br0">)</span><span class="sy0">;</span>
p<span class="sy0">.</span>[<span class="kw2">vertex</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/vertex_.html)<span class="br0">(</span><span class="nu0">-30</span><span class="sy0">,</span> <span class="nu0">-20</span><span class="br0">)</span><span class="sy0">;</span>
p<span class="sy0">.</span>[<span class="kw2">vertex</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/vertex_.html)<span class="br0">(</span> <span class="nu0">30</span><span class="sy0">,</span> <span class="nu0">-20</span><span class="br0">)</span><span class="sy0">;</span>
p<span class="sy0">.</span>[<span class="kw2">vertex</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/vertex_.html)<span class="br0">(</span> <span class="nu0">30</span><span class="sy0">,</span> <span class="nu0">0</span><span class="br0">)</span><span class="sy0">;</span>
p<span class="sy0">.</span>[<span class="kw2">vertex</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/vertex_.html)<span class="br0">(</span> <span class="nu0">10</span><span class="sy0">,</span> <span class="nu0">0</span><span class="br0">)</span><span class="sy0">;</span>
p<span class="sy0">.</span>[<span class="kw2">vertex</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/vertex_.html)<span class="br0">(</span> <span class="nu0">10</span><span class="sy0">,</span> <span class="nu0">40</span><span class="br0">)</span><span class="sy0">;</span>
p<span class="sy0">.</span>[<span class="kw2">vertex</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/vertex_.html)<span class="br0">(</span><span class="nu0">-10</span><span class="sy0">,</span> <span class="nu0">40</span><span class="br0">)</span><span class="sy0">;</span>
p<span class="sy0">.</span>[<span class="kw2">vertex</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/vertex_.html)<span class="br0">(</span><span class="nu0">-10</span><span class="sy0">,</span> <span class="nu0">0</span><span class="br0">)</span><span class="sy0">;</span>
p<span class="sy0">.</span>[<span class="kw2">vertex</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/vertex_.html)<span class="br0">(</span><span class="nu0">-30</span><span class="sy0">,</span> <span class="nu0">0</span><span class="br0">)</span><span class="sy0">;</span>
p<span class="sy0">.</span><span class="me1">setPosition</span><span class="br0">(</span><span class="nu0">300</span><span class="sy0">,</span> <span class="nu0">100</span><span class="br0">)</span><span class="sy0">;</span>
world<span class="sy0">.</span>[<span class="kw2">add</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/add_.html)<span class="br0">(</span>p<span class="br0">)</span><span class="sy0">;</span></pre>

</div>

</div>

setPosition(x, y) positions the point 0, 0 of the polygon at point x, y of the canvas

<a name="FLine" id="FLine"></a>

## <span class="mw-headline">FLine</span>

*   Variables of type [FLine](https://web.archive.org/web/20140802193416/http://ricardmarxer.com/fisica/reference/fisica/FLine.html "http://ricardmarxer.com/fisica/reference/fisica/FLine.html") have the shape of a line
*   Always are static bodies
*   Constructor has 4 arguments: initX, initY, finalX, finalY

<div dir="ltr" style="text-align: left;">

<div class="source-processing" style="font-family: monospace;">

<pre>FLine l <span class="sy0">=</span> [<span class="kw1">new</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/new.html) FLine<span class="br0">(</span><span class="nu0">-150</span><span class="sy0">,</span> <span class="nu0">0</span><span class="sy0">,</span> <span class="nu0">150</span><span class="sy0">,</span> <span class="nu0">0</span><span class="br0">)</span><span class="sy0">;</span>
l<span class="sy0">.</span><span class="me1">setPosition</span><span class="br0">(</span>[<span class="kw5">width</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/width.html)<span class="sy0">/</span><span class="nu0">2</span><span class="sy0">,</span> <span class="nu0">250</span><span class="br0">)</span><span class="sy0">;</span>
world<span class="sy0">.</span>[<span class="kw2">add</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/add_.html)<span class="br0">(</span>l<span class="br0">)</span><span class="sy0">;</span></pre>

</div>

</div>

*   setPosition(x, y) positions point 0, 0 of the line at point x, y of canvas
*   Bodies collide with lines only in one direction
*   Start and end points can be modified

<div dir="ltr" style="text-align: left;">

<div class="source-processing" style="font-family: monospace;">

<pre>l<span class="sy0">.</span><span class="me1">setStart</span><span class="br0">(</span><span class="nu0">150</span><span class="sy0">,</span> <span class="nu0">0</span><span class="br0">)</span><span class="sy0">;</span>
l<span class="sy0">.</span><span class="me1">setEnd</span><span class="br0">(</span>[<span class="kw5">width</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/width.html)<span class="nu0">-150</span><span class="sy0">,</span> <span class="nu0">0</span><span class="br0">)</span><span class="sy0">;</span></pre>

</div>

</div>

<a name="FCompound" id="FCompound"></a>

## <span class="mw-headline">FCompound</span>

*   Variables of type [FCompound](https://web.archive.org/web/20140802193416/http://ricardmarxer.com/fisica/reference/fisica/FCompund.html "http://ricardmarxer.com/fisica/reference/fisica/FCompund.html") are compounded out of other bodies
*   Constructor has no arguments

<div dir="ltr" style="text-align: left;">

<div class="source-processing" style="font-family: monospace;">

<pre>FBox m1 <span class="sy0">=</span> [<span class="kw1">new</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/new.html) FBox<span class="br0">(</span><span class="nu0">6</span><span class="sy0">,</span> <span class="nu0">60</span><span class="br0">)</span><span class="sy0">;</span>

FCircle m2 <span class="sy0">=</span> [<span class="kw1">new</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/new.html) FCircle<span class="br0">(</span><span class="nu0">20</span><span class="br0">)</span><span class="sy0">;</span>
m2<span class="sy0">.</span><span class="me1">setPosition</span><span class="br0">(</span><span class="nu0">0</span><span class="sy0">,</span> <span class="nu0">-30</span><span class="br0">)</span><span class="sy0">;</span>

FCompound m <span class="sy0">=</span> [<span class="kw1">new</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/new.html) FCompound<span class="br0">(</span><span class="br0">)</span><span class="sy0">;</span>
m<span class="sy0">.</span><span class="me1">addBody</span><span class="br0">(</span>m1<span class="br0">)</span><span class="sy0">;</span>
m<span class="sy0">.</span><span class="me1">addBody</span><span class="br0">(</span>m2<span class="br0">)</span><span class="sy0">;</span>
m<span class="sy0">.</span><span class="me1">setPosition</span><span class="br0">(</span><span class="nu0">200</span><span class="sy0">,</span> <span class="nu0">300</span><span class="br0">)</span><span class="sy0">;</span>
world<span class="sy0">.</span>[<span class="kw2">add</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/add_.html)<span class="br0">(</span>m<span class="br0">)</span><span class="sy0">;</span></pre>


</div>

</div>



<a name="Common_properties_of_bodies" id="Common_properties_of_bodies"></a>


# <span class="mw-headline">Common properties of bodies</span>

<a name="Dynamic_properties" id="Dynamic_properties"></a>

## <span class="mw-headline">Dynamic properties</span>

<div dir="ltr" style="text-align: left;">

<div class="source-processing" style="font-family: monospace;">


**Position**: position in pixels

<pre>   [body.setPosition(100, 200)](https://web.archive.org/web/20140802193416/http://ricardmarxer.com/fisica/reference/fisica/FBody.html#setPosition%28float,%20float%29 "http://ricardmarxer.com/fisica/reference/fisica/FBody.html#setPosition(float,%20float)")
</pre>

**Rotation**: rotation in radians

<pre>   [body.setRotation(PI/4)]()
</pre>

**Velocity**: velocity in pixels per second

<pre>   [body.setVelocity(50, 0)]()
</pre>

**Angular velocity**: rotation velocity in radians per second

<pre>   [body.setAngularVelocity(PI/16)]()
</pre>



</div>

</div>


<a name="Material_properties" id="Material_properties"></a>

## <span class="mw-headline">Material properties</span>



**Density**: mass density of the object in gram per pixel 2


<div dir="ltr" style="text-align: left;">

<div class="source-processing" style="font-family: monospace;">


<pre>   [body.setDensity(0.3)]()
</pre>


**Restitution**: loss of velocity at collision (perpendicular force of a collision) [value from 0 to 1]

<pre>   [body.setRestitution(0.3)]()
</pre>

**Friction**: loss of velocity at friction (tangential force of a collision) [value from 0 to 1]

<pre>   [body.setFriction(0.3)]()
</pre>

**Damping**: loss of velocity at movement [value from 0 to 1]

<pre>   [body.setDamping(0.3)]()
</pre>

**Angular damping**: loss of velocity at rotation [value from 0 to 1]

<pre>   [body.setAngularDamping(0.3)]()
</pre>



</div>

</div>


<a name="Properties_of_style_.28drawing.29" id="Properties_of_style_.28drawing.29"></a>

## <span class="mw-headline">Properties of style (drawing)</span>

<div dir="ltr" style="text-align: left;">

<div class="source-processing" style="font-family: monospace;">


**Fill color**: fill color of bodies, same format then Processing

<pre>   [body.setFill(100, 20, 130)]()
</pre>

**Stroke color**: stroke color of bodies, same format then Processing

<pre>   [body.setStroke(100, 20, 130)]()
</pre>

**Stroke weight**: stroke weight of body, same format then Processing

<pre>   [body.setFriction(0.3)]()
</pre>

**Image**: draw body with a image

<pre>   PImage imagen = loadImage("canica.png");
   [body.attachImage(imagen)]()
</pre>



</div>

</div>

<a name="Other_properties_-_I" id="Other_properties_-_I"></a>

## <span class="mw-headline">Other properties - I</span>

<div dir="ltr" style="text-align: left;">

<div class="source-processing" style="font-family: monospace;">



**Dynamics**: bodies by default are dynamic, they can be set static:

<pre>   [body.setStatic(true)]()
</pre>

**Rotateable**: bodies by default are rotateable, this can be turned off:

<pre>   [body.setRotatable(false)]()
</pre>

**Sleepable**: when bodies don't have contacts during certain time the enter the state sleepable and are stopped being simulated

<pre>   [body.setAllowSleeping(false)]()
</pre>

**Grabbable**: you can grab the body with the mouse

<pre>   [body.setGrabbable(false)]()
</pre>

**Drawable**: by default all bodies of a world are drawn, this can be turned off:

<pre>   [body.setDrawable(false)]()
</pre>



</div>

</div>


<a name="Other_properties_-_II" id="Other_properties_-_II"></a>

## <span class="mw-headline">Other properties - II</span>

<div dir="ltr" style="text-align: left;">

<div class="source-processing" style="font-family: monospace;">



**Sensor**: The body gets in contact and collides with other bodies. Collisions can be turned off while maintaining contact detection to know when a body enters a certain region:

<pre>   [body.setSensor(true)]()
</pre>

**Tags**: giving tags to bodies makes it easier to detect contacts

<pre>   [body.setName("hole")]()
</pre>

**Groups**: by default all bodies contact with all. You can define groups to detect certain contacts. Bodies belonging to a negative group don't contact with bodies of the same group.

<pre>   [body.setGroupIndex(-1)]()
</pre>

**Categories or filters**: You can define categories and groups a body belongs to and which it can contact. But you need knowledge with binary masks:

<pre>   [body.setCategoryBits(0x0002) // 0x0002  == 0000 0000 0000 0010]() 
</pre>

<pre>   [body.setFilterBits(0x0004) // 0x0004  == 0000 0000 0000 0100]()
</pre>


</div>

</div>

<a name="Actions_of_the_body" id="Actions_of_the_body"></a>

## <span class="mw-headline">Actions of the body</span>


<div dir="ltr" style="text-align: left;">

<div class="source-processing" style="font-family: monospace;">



**Impulse**: Apply a impulse (similar to a hit)

<pre>   [body.addImpulse(100, 0)]()
</pre>

<pre>   [body.addImpulse(100, 0, 0, 40)]()
</pre>

**Force**: apply a force (similar to push, usually we apply it during some time)

<pre>   [body.addForce(100, 0)]()
</pre>

<pre>   [body.addForce(100, 0, 0, 40)]()
</pre>

**Angular force**: add a angular force (like torque)

<pre>   [body.addTorque(PI/6)]()
</pre>

**Draw**: draw the body. Specially interesting when a body hasn't been added to the world:

<pre>   [body.draw()]()
</pre>

**Technical draw**: draw the state of the body. Specially interesting during development:

<pre>   [body.drawDebug()]()
</pre>


</div>

</div>

<a name="Joints" id="Joints"></a>

# <span class="mw-headline">Joints</span>

<a name="FDistanceJoint_-_The_spring" id="FDistanceJoint_-_The_spring"></a>

## <span class="mw-headline">FDistanceJoint - The spring</span>

*   Variables of type [FDistanceJoint](https://web.archive.org/web/20140802193416/http://ricardmarxer.com/fisica/reference/fisica/FDistanceJoint.html "http://ricardmarxer.com/fisica/reference/fisica/FDistanceJoint.html") are spring joints
*   Constructor has 2 arguments: body1, body2

<div dir="ltr" style="text-align: left;">

<div class="source-processing" style="font-family: monospace;">

<pre>FBox b1 <span class="sy0">=</span> [<span class="kw1">new</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/new.html) FBox<span class="br0">(</span><span class="nu0">70</span><span class="sy0">,</span> <span class="nu0">20</span><span class="br0">)</span><span class="sy0">;</span>
b1<span class="sy0">.</span><span class="me1">setPosition</span><span class="br0">(</span><span class="nu0">100</span><span class="sy0">,</span> <span class="nu0">100</span><span class="br0">)</span><span class="sy0">;</span>
world<span class="sy0">.</span>[<span class="kw2">add</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/add_.html)<span class="br0">(</span>b1<span class="br0">)</span><span class="sy0">;</span>
FBox b2 <span class="sy0">=</span> [<span class="kw1">new</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/new.html) FBox<span class="br0">(</span><span class="nu0">20</span><span class="sy0">,</span> <span class="nu0">50</span><span class="br0">)</span><span class="sy0">;</span>
b2<span class="sy0">.</span><span class="me1">setPosition</span><span class="br0">(</span><span class="nu0">300</span><span class="sy0">,</span> <span class="nu0">100</span><span class="br0">)</span><span class="sy0">;</span>
world<span class="sy0">.</span>[<span class="kw2">add</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/add_.html)<span class="br0">(</span>b2<span class="br0">)</span><span class="sy0">;</span>
FDistanceJoint spring <span class="sy0">=</span> [<span class="kw1">new</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/new.html) FDistanceJoint<span class="br0">(</span>b1<span class="sy0">,</span> b2<span class="br0">)</span><span class="sy0">;</span>
world<span class="sy0">.</span>[<span class="kw2">add</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/add_.html)<span class="br0">(</span>spring<span class="br0">)</span><span class="sy0">;</span></pre>

</div>

</div>

<a name="Properties" id="Properties"></a>

### <span class="mw-headline">Properties</span>


<div dir="ltr" style="text-align: left;">

<div class="source-processing" style="font-family: monospace;">



*   By default the spring hooks into the center of the bodies. But you can hook it into any position relative to the center:

<pre>   [spring.setAnchor1(30, 0)](https://web.archive.org/web/20140802193416/http://ricardmarxer.com/fisica/reference/fisica/FDistanceJoint.html#setAnchor1%28float,%20float%29 "http://ricardmarxer.com/fisica/reference/fisica/FDistanceJoint.html#setAnchor1(float,%20float)")
   [spring.setAnchor2(0, 40)]()
</pre>

*   By default the spring is rigid. But it can be elastic controlling frequency and amortization:

<pre>   [spring.setFrequency(0.5)]()
   [spring.setDamping(0.1)]()
</pre>

*   By default the balance between bodies is the distance between the bodies. But it can be arbitrary:

<pre>   [spring.setLength(60)]()
</pre>



</div>

</div>

<a name="FPrismaticJoint_-_The_rotor" id="FPrismaticJoint_-_The_rotor"></a>

## <span class="mw-headline">FPrismaticJoint - The rotor</span>

*   Variables of type [FPrismaticJoint](https://web.archive.org/web/20140802193416/http://ricardmarxer.com/fisica/reference/fisica/FPrismaticJoint.html "http://ricardmarxer.com/fisica/reference/fisica/FPrismaticJoint.html") are rotor joints
*   Constructor has 2 arguments: body1, body2
*   Typically you use it with one fixed and another mobile body

<div dir="ltr" style="text-align: left;">

<div class="source-processing" style="font-family: monospace;">

<pre>FBox b2 <span class="sy0">=</span> [<span class="kw1">new</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/new.html) FBox<span class="br0">(</span><span class="nu0">20</span><span class="sy0">,</span> <span class="nu0">50</span><span class="br0">)</span><span class="sy0">;</span>
b2<span class="sy0">.</span><span class="me1">setPosition</span><span class="br0">(</span><span class="nu0">300</span><span class="sy0">,</span> <span class="nu0">100</span><span class="br0">)</span><span class="sy0">;</span>
world<span class="sy0">.</span>[<span class="kw2">add</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/add_.html)<span class="br0">(</span>b2<span class="br0">)</span><span class="sy0">;</span>
FPrismaticJoint rotor <span class="sy0">=</span> [<span class="kw1">new</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/new.html) FPrismaticJoint<span class="br0">(</span>world<span class="sy0">.</span><span class="me1">bottom</span><span class="sy0">,</span> b2<span class="br0">)</span><span class="sy0">;</span>
world<span class="sy0">.</span>[<span class="kw2">add</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/add_.html)<span class="br0">(</span>rotor<span class="br0">)</span><span class="sy0">;</span></pre>

</div>

</div>

<a name="Properties_2" id="Properties_2"></a>

### <span class="mw-headline">Properties</span>

*   By default the rotor has a vertical orientation. But the rotor can be oriented at any direction:


<div dir="ltr" style="text-align: left;">

<div class="source-processing" style="font-family: monospace;">


<pre>   [piston.setAxis(1, 0)](https://web.archive.org/web/20140802193416/http://ricardmarxer.com/fisica/reference/fisica/FPrismaticJoint.html#setAxis%28float,%20float%29 "http://ricardmarxer.com/fisica/reference/fisica/FPrismaticJoint.html#setAxis(float,%20float)")
</pre>

*   By default the movement on the rotor is not limited. But you can limit it:

<pre>   [piston.setEnableLimit(true)]()
   [piston.setLowerTranslation(-50)]()
   [piston.setUpperTranslation(150)]()
</pre>


</div>

</div>

<a name="FRevoluteJoint_-_The_axis" id="FRevoluteJoint_-_The_axis"></a>

## <span class="mw-headline">FRevoluteJoint - The axis</span>

*   Variables of type [FRevoluteJoint](https://web.archive.org/web/20140802193416/http://ricardmarxer.com/fisica/reference/fisica/FRevoluteJoint.html "http://ricardmarxer.com/fisica/reference/fisica/FRevoluteJoint.html") are axis joints
*   Constructor has 2 arguments: body1, body2

<div dir="ltr" style="text-align: left;">

<div class="source-processing" style="font-family: monospace;">

<pre>FBox b1 <span class="sy0">=</span> [<span class="kw1">new</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/new.html) FBox<span class="br0">(</span><span class="nu0">70</span><span class="sy0">,</span> <span class="nu0">20</span><span class="br0">)</span><span class="sy0">;</span>
b1<span class="sy0">.</span><span class="me1">setPosition</span><span class="br0">(</span><span class="nu0">100</span><span class="sy0">,</span> <span class="nu0">100</span><span class="br0">)</span><span class="sy0">;</span>
world<span class="sy0">.</span>[<span class="kw2">add</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/add_.html)<span class="br0">(</span>b1<span class="br0">)</span><span class="sy0">;</span>
FBox b2 <span class="sy0">=</span> [<span class="kw1">new</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/new.html) FBox<span class="br0">(</span><span class="nu0">20</span><span class="sy0">,</span> <span class="nu0">50</span><span class="br0">)</span><span class="sy0">;</span>
b2<span class="sy0">.</span><span class="me1">setPosition</span><span class="br0">(</span><span class="nu0">300</span><span class="sy0">,</span> <span class="nu0">100</span><span class="br0">)</span><span class="sy0">;</span>
world<span class="sy0">.</span>[<span class="kw2">add</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/add_.html)<span class="br0">(</span>b2<span class="br0">)</span><span class="sy0">;</span>
FRevoluteJoint axis <span class="sy0">=</span> [<span class="kw1">new</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/new.html) FRevoluteJoint<span class="br0">(</span>b1<span class="sy0">,</span> b2<span class="br0">)</span><span class="sy0">;</span>
world<span class="sy0">.</span>[<span class="kw2">add</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/add_.html)<span class="br0">(</span>axis<span class="br0">)</span><span class="sy0">;</span></pre>

</div>

</div>

<a name="Properties_3" id="Properties_3"></a>

### <span class="mw-headline">Properties</span>

<div dir="ltr" style="text-align: left;">

<div class="source-processing" style="font-family: monospace;">


*   By default the rotation axis is in the middle between the two bodies. But you can position it on any absolute point of the canvas:

<pre>   [axis.setAnchor(width/2, height/2)](https://web.archive.org/web/20140802193416/http://ricardmarxer.com/fisica/reference/fisica/FRevoluteJoint.html#setAnchor%28float,%20float%29 "http://ricardmarxer.com/fisica/reference/fisica/FRevoluteJoint.html#setAnchor(float,%20float)")
</pre>

*   By default movement around the axis is not limited. But you can limit it:

<pre>   [axis.setEnableLimit(true)]()
   [axis.setLowerAngle(-PI/4)]()
   [axis.setUpperAngle(PI/4)]()
</pre>

</div>
</div> 

<a name="Common_properties_of_joints" id="Common_properties_of_joints"></a>

# <span class="mw-headline">Common properties of joints</span>


<a name="Dynamic_properties_2" id="Dynamic_properties_2"></a>

## <span class="mw-headline">Dynamic properties</span>

**Collision**: Bodies united by joints collide between themselves. You can avoid it by:
<div dir="ltr" style="text-align: left;">

<div class="source-processing" style="font-family: monospace;">


<pre>   [junta.setCollideConnected(false)]()
</pre>

Reaction force**: Reaction force of translation which the joint executes on the second body.**

<pre>   [junta.getReactionForceX()]()
   [junta.getReactionForceY()]()
</pre>

**Angular reaction force**: Angular reaction force (of torque) which executes the joint on the second body.

<pre>   [junta.getReactionTorque()]()
</pre>

</div>
</div>


<a name="Contacts" id="Contacts"></a>

# <span class="mw-headline">Contacts</span>

<a name="Contacts_are_events" id="Contacts_are_events"></a>

## <span class="mw-headline">Contacts are events</span>

*   Works similar to mouse events in Processing
*   Contact methods:

<div dir="ltr" style="text-align: left;">

<div class="source-processing" style="font-family: monospace;">



<pre>   void contactStarted(FContact contact) { // code to execute }
</pre>

<pre>   void contactPersisted(FContact contact) { // code to execute }
</pre>

<pre>   void contactEnded(FContact contact) { // code to execute }
</pre>

<a name="Not_everything_is_valid_with_contacts" id="Not_everything_is_valid_with_contacts"></a>

</div>
</div>

## <span class="mw-headline">Not everything is valid with contacts</span>

A lot of actions are not permitted during contacts in JBox2D (e.g. add/remove bodies from the world). But in fisica we solved it. If you find any action that is not valid, contact us!

<a name="Properties_of_contacts" id="Properties_of_contacts"></a>

## <span class="mw-headline">Properties of contacts</span>

**The bodies**: two bodies of the contact
<div dir="ltr" style="text-align: left;">

<div class="source-processing" style="font-family: monospace;">


<pre>   [contact.getBody1()]()
   [contact.getBody2()]()
   [contact.contains("ball", "hole")  // you can ask for them by tag]()
</pre>

<pre>   [contact.contains(body)  // you can ask by variable]()
</pre>

**Point of contact**: point where the contact starts

<pre>   [contact.getX()]()
   [contact.getY()]()
</pre>

**Direction**: direction of the contact (normal vector of the contact)

<pre>   [contact.getNormalX()]()
   [contact.getNormalY()]()
</pre>

**Velocity**: velocity of the contact (relative velocity between bodies)

<pre>   [contact.getVelocityX()]()
   [contact.getVelocityY()]()
</pre>

**Separation**: the simulation is not perfect, there can always exist a certain separation (o penetration) between bodies

<pre>   [contact.getSeparation()]()
</pre>

<a name="A_different_form_of_access_to_contacts" id="A_different_form_of_access_to_contacts"></a>

</div>
</div> 

## <span class="mw-headline">A different form of access to contacts</span>

*   Contacts can be asked to the body
<div dir="ltr" style="text-align: left;">

<div class="source-processing" style="font-family: monospace;">


<pre>   [body.getContacts()]()
</pre>

*   Also can be asked for if the touch a certain body

<pre>   [body.isTouchingBody(anotherbody)]()
</pre>

*   Or just ask for the bodies which it touches

<pre>   [body.getTouching()](https://web.archive.org/web/20140802193416/http://ricardmarxer.com/fisica/reference/fisica/FBody.html#getTouching%28%29 "http://ricardmarxer.com/fisica/reference/fisica/FBody.html#getTouching()")
</pre>

</div>

</div>

</div>

</div>

<script type="text/javascript">if (window.runOnloadHook) runOnloadHook();</script>
