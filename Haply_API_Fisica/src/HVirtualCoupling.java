/*
  Part of the hAPI_Fisica library - http://www.ricardmarxer.com/hAPI_Fisica

  Fisica Copyright (c) 2009 - 2010 Ricard Marxer 
  hAPI_Fisica Copyright (c) 2017 Colin Gallacher

  hAPI_Fisica is free software: you can redistribute it and/or modify
  it under the terms of the GNU Lesser General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.
  
  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU Lesser General Public License for more details.
  
  You should have received a copy of the GNU Lesser General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

//package hAPI_Fisica; 

import org.jbox2d.common.*;
import org.jbox2d.collision.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.dynamics.*;
import java.util.*;
import java.lang.*;

import processing.core.*;

/**
 * Represents a virtual coupling contact rendering scheme that can be added to the virtual world. 
 *The HVirtualCoupling class has a virtual avatar compenent that interacts with objects in the virtual world.
 *The avatar is coupled to a haptic tool object (HTool) using a virtual spring and dashpot (PD controller). 
 *The resultant force is due to the differences in state between the haptic tool, which represents the device end-effector),
 *and the virtual tool avatar. 
 * <pre>
 * {@code
 * HVirtualCoupling myHapticTool = new HVirtualCoupling(0.75);
 * world.add(myHapticTool);
 * }
 * </pre>
 *
 * @usage Bodies
 * @see #FBox
 * @see #FBlob
 * @see #FPoly
 * @see #FLine
 * @see #HTool
 */
public class HVirtualCoupling {
  protected float m_size = 0.5f;
  protected HTool h_tool;
  protected FCircle  h_avatar;

  protected Vec2 vc_force = new Vec2(0.0f, 0.0f); 
  
  protected Vec2 tool_position = new Vec2(0.0f, 0.0f); 
  protected Vec2 tool_velocity = new Vec2(0.0f, 0.0f); 
  
  protected Vec2 avatar_position = new Vec2(0.0f, 0.0f); 
  protected Vec2 avatar_velocity = new Vec2(0.0f, 0.0f); 
  protected ArrayList<FContact> avatarContact;

  protected float vc_stiffness = 250000.0f; ; 
  protected float vc_damping = 700.0f; 
   protected float vc_free_mass = 0.25f;  
  protected float vc_contact_mass = 1.0f;
  
  /**
   * Constructs circular bodies that can be added to a world. The bodies are the haptic tool and the virtual environment tool avatar. 
   *
   * @param size  the size of the circle
   */
  public HVirtualCoupling(float size){
 
    h_tool = new HTool(size); 
    h_avatar = new FCircle(size); 
    h_avatar.setAngularDamping(10);
    h_avatar.setGrabbable(false);
    
    avatarContact = new ArrayList<FContact>(); 
    
  }

  /**
   * Returns the size of the haptic tool and avatar.
   *
   * @usage Bodies
   * @return the size of the circle
   */
  public float getSize(){
    return (m_size);
  }

  /**
   * Sets the size of the circular tool.
   * Under the hood the body is removed and readded to the world.
   *
   * @usage Bodies
   * @param size the size of the circlar tool
   */
  public void setSize(float size){
    m_size = (size);

    h_tool.recreateInWorld();
    h_avatar.recreateInWorld(); 
  }

  /**
   * Sets the position of the virtual tool.
   * Under the hood the body is removed and readded to the world.
   *
   * @usage Bodies
   * @param size the size of the circle
   */
  public void setPosition(float x, float y){
      
       h_avatar.setPosition(x,y); 
      
}

  /**
   * Initializes the haptic tool and virtual avatar in the physics engine.
   *
   * @usage Bodies
   * @param size the size of the circle
   * @param x the x position in the simulated world coordinates of centimeters.
   * @param y the y position in the simulated world coordinates of centimeters. 
   */
  public void init(FWorld world, float x, float y){
      
     setAvatarPosition(x,y); 
     setAvatarVelocity(0.0f, 0.0f); 
       setToolPosition(x,y); 
        world.add(h_avatar); 
       world.add(h_tool);  
           
}


  /**
   * Sets the position of the graphical representation of the haptic tool.
   *
   * @usage setToolVelocity
   * @param x the x position in the simulated world coordinates of centimeters.
   * @param y the y position in the simulated world coordinates of centimeters. 
   */
  public void setToolPosition(float x, float y){
      
       h_tool.setPosition(x,y);
       tool_position = new Vec2(x,y); 
       h_tool.setVelocity(0.0f,0.0f); //We also set the velocity to zero and the force to cancel out gravity since it will still be integrated. Unfortunately in this build of jbox2d there was no gravity scaler for individual objects
      
}

  /**
   * Sets the velocity of the virtual tool graphical representation. Note* the velocity data from the device is noisy so in practice we set the tool velocity to zero and calculate the environmental forces based on the avatar only. 
   *
   * @usage setToolPosition
   * @param x the x velocity in the simulated world coordinates of centimeters.
   * @param y the y velocity in the simulated world coordinates of centimeters. 
   */
  public void setToolVelocity(float x, float y){
      
       tool_velocity = new Vec2(x,y); //We also set the velocity to zero and the force to cancel out gravity since it will still be integrated. Unfortunately in this build of jbox2d there was no gravity scaler for individual objects
       h_tool.setVelocity(0.0f, 0.0f); 
}

  /**
   * Sets the position of the virtual environment avatar representation.
   *
   * @usage setAvatarVelocity
   * @param x the x position in the simulated world coordinates of centimeters.
   * @param y the y position in the simulated world coordinates of centimeters. 
   */
  public void setAvatarPosition(float x, float y){
      
       h_avatar.setPosition(x,y);
       avatar_position = new Vec2(x,y); 
      
}

  /**
   * Sets the velocity of the virtual environement tool avatar. 
   *
   * @usage SetAvatarPosition 
   * @param x the x velocity in the simulated world coordinates of centimeters.
   * @param y the y velocity in the simulated world coordinates of centimeters. 
   */
  public void setAvatarVelocity(float vx, float vy){
      
       avatar_velocity = new Vec2(vx,vy); //We also set the velocity to zero and the force to cancel out gravity since it will still be integrated. Unfortunately in this build of jbox2d there was no gravity scaler for individual objects
        h_avatar.setVelocity(vx,vy); 
}


  /**
   * Returns the x position of the haptic tool in centimeters
   *
   * @usage getToolPositionY
   */
  public float getToolPositionX(){
      
       return h_tool.getX(); //We also set the velocity to zero and the force to cancel out gravity since it will still be integrated. Unfortunately in this build of jbox2d there was no gravity scaler for individual objects
      
}



  /**
   * Returns the y position of the haptic tool in centimeters
   *
   * @usage getToolPositionX
   */
  public float getToolPositionY(){
      
       return h_tool.getY(); //We also set the velocity to zero and the force to cancel out gravity since it will still be integrated. Unfortunately in this build of jbox2d there was no gravity scaler for individual objects
      
}

  /**
   * Returns the x velocity of the haptic tool in centimeters
   *
   * @usage getToolVelocityY
   */
  public float getToolVelocityX(){
      
       return tool_velocity.x; //We also set the velocity to zero and the force to cancel out gravity since it will still be integrated. Unfortunately in this build of jbox2d there was no gravity scaler for individual objects
      
}


  /**
   * Returns the y velocity of the haptic tool in centimeters
   *
   * @usage getToolVelocityX
   */
  public float getToolVelocityY(){
      
       return tool_velocity.y; //We also set the velocity to zero and the force to cancel out gravity since it will still be integrated. Unfortunately in this build of jbox2d there was no gravity scaler for individual objects
      
}

  /**
   * Returns the x position of the virtual environment avatar in centimeters
   *
   * @usage getAvatarPositionY
   */
  public float getAvatarPositionX(){
      
       return h_avatar.getX(); //We also set the velocity to zero and the force to cancel out gravity since it will still be integrated. Unfortunately in this build of jbox2d there was no gravity scaler for individual objects
      
}


  /**
   * Returns the y position of the virtual environment avatar in centimeters
   *
   * @usage getAvatarPositionX
   */
  public float getAvatarPositionY(){
      
       return h_avatar.getY(); //We also set the velocity to zero and the force to cancel out gravity since it will still be integrated. Unfortunately in this build of jbox2d there was no gravity scaler for individual objects
      
}


  /**
   * Returns the x velocity of the virtual environment avatar in centimeters
   *
   * @usage getAvatarVelocityY
   */
  public float getAvatarVelocityX(){
      
     return h_avatar.getVelocityX(); 
       //return h_avatar.getVelocityX(); //We also set the velocity to zero and the force to cancel out gravity since it will still be integrated. Unfortunately in this build of jbox2d there was no gravity scaler for individual objects
      //return 10.0f; 
}



    /**
   * Returns the y velocity of the virtual environment avatar in centimeters
   *
   * @usage getAvatarVelocityX
   */
  public float getAvatarVelocityY(){
      
       return h_avatar.getVelocityY(); //We also set the velocity to zero and the force to cancel out gravity since it will still be integrated. Unfortunately in this build of jbox2d there was no gravity scaler for individual objects
      
}




  /**
   * Sets the Virtual Coupling parameters of the virtual tool to their default values. 
   *
   *@usage updateCouplingForce
   */
  public void updateCouplingForce(){
    
    
     updateCouplingForce(this.vc_free_mass, this.vc_stiffness, this.vc_damping, this.vc_contact_mass);
   } 
    

   /* Sets the Virtual Coupling parameters of the virtual tool.
   * Under the hood the body is removed and readded to the world.
   *
   * @param mass sets the mass of the virtual avatar when in free space
   * @param stiffness sets the virtual coupling spring stiffness when in free space
   * @param damping sets the virtual coupling dashpot damping when in free space
   *
   *@usage updateCouplingForce
   */
  public void updateCouplingForce( float mass, float stiffness, float damping){
    
     updateCouplingForce(mass, stiffness, damping, vc_contact_mass); 
    
}

  /**
   * Sets the Virtual Coupling parameters of the virtual tool.
   * Under the hood the body is removed and readded to the world.
   *
   * @param free_mass sets the mass of the virtual avatar when in free space
   * @param free_stiffness sets the virtual coupling spring stiffness when in free space
   * @param free_damping sets the virtual coupling dashpot damping when in free space
   * @param contact_mass sets the mass of the virtual avatar when in contact with a virtual object
   *
   *@usage updateCouplingForce
   *
   */
  public void updateCouplingForce(float free_mass, float stiffness, float damping, float contact_mass){
    
        avatarContact = this.h_tool.getContacts();
        
        //hAPI_Fisica.parent().println(avatarContact.size());
        damping = damping/20.0f; 
        stiffness = stiffness/20.0f; 
   
    if(((avatarContact.size() == 1) && ((avatarContact.get(0).getBody2() == this.h_avatar) || (avatarContact.get(0).getBody1() == this.h_avatar) )) || avatarContact.size()==0 ){
      float density = free_mass*4.0f/(3.14f*(m_size*m_size));
      //hAPI_Fisica.parent().println(density); 
        //hAPI_Fisica.parent().println("hi"); 
      this.h_avatar.setDensity(density); 
      this.h_tool.setDensity(density); 
    }
    else {
          //hAPI_Fisica.parent().println("low"); 
     float density = contact_mass*4.0f/(3.14f*(m_size*m_size));
     //hAPI_Fisica.parent().println(density);
     this.h_avatar.setDensity(density); 
     this.h_tool.setDensity(.25f); 
    }
  
       this.setToolVelocity(0, 0); 
       vc_force.set(stiffness*(getAvatarPositionX()-getToolPositionX())+damping*(getAvatarVelocityX()-getToolVelocityX()), stiffness*(getAvatarPositionY()-getToolPositionY())+damping*(getAvatarVelocityY()-getToolVelocityY()));
       //vc_force.set(vc_stiffness*(h_avatar.getX()-h_tool.getX())+vc_damping*(h_avatar.getVelocityX()-getToolVelocityX()), vc_stiffness*(h_avatar.getY()-h_tool.getY())+vc_damping*(h_avatar.getVelocityY()-getToolVelocityY()));

       h_avatar.addForce(-vc_force.x, -vc_force.y);
       
      //return vc_force.x;
    
}

  /**
   * Get the x coordinate of the force applied via the virtual coupling between the haptic tool and haptic avatar.
   *
   * @see #getVirtualCouplingForceY()
   *
   * @return the x coordinate of the force
   *
   */
public float getVirtualCouplingForceX(){
  
  return vc_force.x; 
  
}

  /**
   * Get the y coordinate of the force applied via the virtual coupling between the haptic tool and haptic avatar.
   *
   * @see #getVirtualCouplingForceX()
   *
   * @return the y coordinate of the force
   *
   */
public float getVirtualCouplingForceY(){
  
  return vc_force.y; 
  
}
    /**
   * Sets the stiffness of the virtual coupling for the virtual coupled contact rendering technique. 
   *
   *@see #getVirtualCouplingStiffness
   *@see #setVirtualCouplingDamping
   *
   * @param stiffness  The stiffness of the virtual coupling. Resultant forces are proportional to difference in state between the haptic tool and haptic avatar. 
   */
public void setVirtualCouplingStiffness(float stiffness){
  vc_stiffness = stiffness;  
  
}

    /**
   * Sets the damping of the virtual coupling for the virtual coupled contact rendering technique. 
   *
   *@see #setVirtualCouplingStiffness
   *@see #getVirtualCouplingDamping
   *
   * @param damping  The damping of the virtual coupling. Resultant forces are proportional to difference in state between the haptic tool and haptic avatar. 
   */
public void setVirtualCouplingDamping(float damping){
  vc_damping = damping;  
  
}

  /**
   * Returns the virtual coupling stiffness.
   *
   * @return the virtual coupling stiffness coefficient of the body in dyne per meter (CGS units)
   * @see #setVirtualCouplingStiffness(float) 
   * @see #getVirtualCouplingDamping()
   */
public float getVirtualCouplingStiffness(){
  return vc_stiffness;  
  
}


  /**
   * Returns the virtual coupling damping.
   *
   * @return the virtual coupling damping coefficient of the body in dyne seconds per meter (CGS units)
   * @see #setVirtualCouplingDamping(float) 
   * @see #getVirtualCouplingStiffness()
   */
public float getVirtualCouplingDamping(){
  return vc_damping;  
  
}


  /**
   * Draws the normal contact vectors acting on the virtual avatar from colliding with environment objects. 
   *
   *  
   * @param applet The PApplet object in which to draw the images
   * @see #drawDebug()
   * @see #draw()
   */
   
void drawContactVectors(PApplet applet){
     ArrayList<FContact> c_draw =  this.h_avatar.getContacts(); 

    
    for(int i = 0; i<c_draw.size(); i++){

      if((c_draw.get(i).getBody1() != this.h_tool) && (c_draw.get(i).getBody2() != this.h_tool)){

        applet.pushMatrix(); 
         applet.translate(hAPI_Fisica.worldToScreen(c_draw.get(i).getX()),hAPI_Fisica.worldToScreen(c_draw.get(i).getY())); 
        applet.line(0,0, hAPI_Fisica.worldToScreen(c_draw.get(i).getNormalX()),hAPI_Fisica.worldToScreen(c_draw.get(i).getNormalY())); 
        applet.translate( hAPI_Fisica.worldToScreen(c_draw.get(i).getNormalX()),hAPI_Fisica.worldToScreen(c_draw.get(i).getNormalY())); 
        applet.rotate((float)(Math.atan2((c_draw.get(i).getNormalY()), (c_draw.get(i).getNormalX()))));
        applet.pushMatrix(); 
        applet.rotate(.3f); 
        applet.line(0,0,-10,0); 
        applet.popMatrix(); 
        applet.pushMatrix(); 
        applet.rotate(-.3f); 
        applet.line(0,0,-10,0); 
        applet.popMatrix(); 
        applet.popMatrix(); 

       }
     } 
}




}