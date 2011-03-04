/* 
 * OSCdroid multitouch example 
 * Victor Diaz 
 * 
 */ 

import oscP5.*; 
import netP5.*; 

OscP5 oscP5; 

//accelerometer values 
float x = 0; 
float y = 0; 
float z = 0; 

//circle position 
float cX = 0; 
float cY = 0; 
float cZ = 0; 

int port = 12002; 

void setup() {
  size(500,500); 
  frameRate(25); 
  smooth(); 
  
  x = width / 2; 
  y = height / 2; 
  
  //start osc sever 
  oscP5 = new OscP5(this, port); 
  
}

void draw() {
  background(0); 
  
  cX = cX + x; 
  cY = cY + y; 
  cZ = 25 * Math.abs(z); 
  
  fill(255); 
  ellipse(cX, cY, cZ, cZ); 
  
  
} 


void oscEvent(OscMessage theOscMessage) { 

  if(theOscMessage.checkAddrPattern("/oscdroid/accelerometer") == true) { 

      x = theOscMessage.get(0).floatValue(); 
      y = theOscMessage.get(1).floatValue(); 
      z = theOscMessage.get(2).floatValue(); 
      
      println(" values: " + x + ", " + y + ", " + z); 
  } 
}
