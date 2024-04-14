//111013232

import peasy.*;
planet sun;
PeasyCam cam;
//PImage suntexture,earthtexture,moontexture;
PImage suntexture,moontexture;
PImage[] earthtexture = new PImage[7];

void setup()
{
  size(900,900,P3D);
  surface.setLocation(987,50);
  
  suntexture=loadImage("sunmap.jpg");
  for(int i=1;i<=7;i++)
  {
    earthtexture[i-1]=loadImage(str(i)+".jpg");
  }
  moontexture=loadImage("moonmap.jpg");
  
  cam= new PeasyCam(this,500);
  noStroke();
  sun=new planet(80,0,0,suntexture);
  sun.addp(0);
  
}

void draw()
{
  //translate(width/2,height/2);
  background(0);
  lights();
  
  //fill(#FF9512);
  //stroke(#FF5112);
  //strokeWeight(5);
  noFill();
  noStroke();
  
  sun.show();
  sun.orbit();
  /*
  fill(#1263FF);
  stroke(#0C42AA);
  strokeWeight(el/20);
  rotate(radians(angle));
  ellipse(ed,ed,el,el);
  
  pushMatrix();
  translate(ed,ed);
  fill(#FAEF6F);
  stroke(#F0D85E);
  strokeWeight(ml/20);
  rotate(radians(angle*2));
  ellipse(md,md,ml,ml);
  popMatrix();
  
  angle++;
  */
  
}
