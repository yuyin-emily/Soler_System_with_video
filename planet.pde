class planet
{
  float radius,
        distance,
        angle,
        speed;
  PVector v,v2,p;
  PShape globe;
  planet[] childplanet;
        
  planet(float r,float d, float s,PImage texture)
  {
    v=PVector.random3D();
    radius=r;
    distance=d;
    speed=s;
    angle=random(TWO_PI);
    globe=createShape(SPHERE,radius);
    globe.setTexture(texture);
    
    noStroke();
    noFill();
  }
  
  void show()
  {
    pushMatrix();
    v2=new PVector(1,0,1);
    p=v.cross(v2);
    rotate(angle,p.x,p.y,p.z);
    ellipseMode(CENTER);
    rotate(angle);
    translate(distance,0);
    noStroke();
    shape(globe);
    //sphere(radius);
    //ellipse(0,0,radius*2,radius*2);
    if (childplanet != null)
    {
  
      
      for(int i=0;i<childplanet.length;i++)
      {
        /*if(childplanet.length==3)
        {
          fill(#1263FF);
          noStroke();
        }
        else if (childplanet.length==2)
        {
          fill(#FAEF6F);
          noStroke();
        }*/
        childplanet[i].show();
      }
    }
    popMatrix();
    
    angle+=0.01;
    
  }
  
  void addp(int level)
  {
    int total=0;
    int turn[]=new int[7];
    for(int i=0;i<7;i++)
    {
      turn[i]=0;
    }
    if(level<1)
    {
      total=3;
    }
    else if (level<2)
    {
      total=2;
    }
    /*else if (level<3)
    {
      total=1;
    }*/
    childplanet = new planet[total];
    for(int i=0;i<total;i++)
    {
      float r = radius*random(0.3,0.5),
            d = random(200/(level+1),300/(level+1))*(1+(i/total)),
            s = random(-0.05,0.05);
      //int t=int(random(7));
      if(level<1)
      {
        int t=int(random(7));
        while(turn[t]!=0)
        {
          t=int(random(7));
        }
        turn[t]+=1;
        childplanet[i] = new planet(r,d,s,earthtexture[t]);
        childplanet[i].addp(level+1);
      }
      else //if(level<2)
      {
        childplanet[i] = new planet(r,d,s,moontexture);
        //childplanet[i].addp(level+1);
      }
      
      //childplanet[i].show();
    }
  }
  
  void orbit()
  {
    angle+=speed;
    if (childplanet != null)
    {
      for(int i=0;i<childplanet.length;i++)
      {
        childplanet[i].orbit();
      }
    }
  }
}
