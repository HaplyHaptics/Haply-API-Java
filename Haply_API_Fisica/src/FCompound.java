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
import org.jbox2d.util.nonconvex.*;

import processing.core.*;

import java.util.ArrayList;

public class FCompound extends FBody {
  ArrayList m_shapes;
  
  public FCompound(){
    super();
    
    m_shapes = new ArrayList();
  }

  public ArrayList getShapeDefs() {
    ArrayList result = new ArrayList();
    for (int i=0; i<m_shapes.size(); i++) {
      ShapeDef sd = (ShapeDef)(((FBody)m_shapes.get(i)).getTransformedShapeDef());
      sd = ((FBody)m_shapes.get(i)).processShapeDef(sd);
      result.add(sd);
    }
    return result;
  }
  
  public ArrayList getBodies() {
    return m_shapes;
  }

  public void addBody(FBody body) {
    m_shapes.add(body);
  }
    
  public void draw(PGraphics applet) {
    preDraw(applet);

    if (m_image != null ) {
      drawImage(applet);
    } else {
      for(int i = 0; i<m_shapes.size(); i++){
        ((FBody)m_shapes.get(i)).draw(applet);
      }
    }
    
    postDraw(applet);
  }
  
  public void drawDebug(PGraphics applet) {
    preDrawDebug(applet);
    
    for(int i = 0; i<m_shapes.size(); i++){
        ((FBody)m_shapes.get(i)).drawDebug(applet);
    }
      
    postDrawDebug(applet);
  }
  
}