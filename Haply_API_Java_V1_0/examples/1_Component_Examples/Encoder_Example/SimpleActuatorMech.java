/**
 **********************************************************************************************************************
 * @file       SimpleMech.java
 * @author     Steve Ding, Colin Gallacher
 * @version    V1.0.0
 * @date       20-September-2017
 * @brief      Mechanism extension simple example
 **********************************************************************************************************************
 * @attention
 *
 *
 **********************************************************************************************************************
 */
 
public class SimpleActuatorMech extends Mechanisms{
 
  float tau;
 
 
  public void forwardKinematics(float[] angles){
  }
   
  public void torqueCalculation(float[] forces){
    tau = forces[0];
  }
   
  public void forceCalculation(){
  }
  
  public void positionControl(){
  }
  
  
  public void inverseKinematics(){
  }
  
  public void set_mechanism_parameters(float[] parameters){
  }
  
  
  public void set_sensor_data(float[] data){
  }
  
  
  public float[] get_coordinate(){
    float temp[] = {0};
    return temp;
  }
  
  
  public float[] get_torque(){
    float temp[] = {tau};
    return temp;
  }
  
  
  public float[] get_angle(){
    float temp[] = {0};
    return temp;
  }
  
}