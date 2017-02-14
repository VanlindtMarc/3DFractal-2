PImage Univers; 
PShape Spherique;

float     diametre                = 100;  // Diamètre de ma sphère d'origine

int       IterationMax            = 7;
int       IterationAff            = 2;

float     Redim                   = 0.5;//sqrt(0.5);

float     Angle                   = 0.1;

float     degre                   = 2*3.141592654/360;
float     evolution               =-1;

String    DossierCaptures         = "G:\\fractalvideo8";
String    NomCaptures             = "Fractale";
int       NombreDeCaptures        = 7200;
int       EnregistrementCaptures  = 0;

int       compteur                = 0;

int ModifTailleSphere        =1;


void setup()
{
  size(1920,1080, P3D);
  Univers = loadImage("115.jpg");
  noStroke();
  Spherique = createShape(SPHERE, 10000); 
  Spherique.setTexture(Univers);
  Spherique.setStrokeWeight(0);
    sphereDetail(8);
    frameRate(24);
  
  smooth(8);
}

void draw()
{
  background(0);                
  
  pointLight(192, 32, 32, sin(evolution/8)*diametre*2.7, cos(evolution/8)*diametre*3, -sin(evolution/8)*diametre*3.2);
  
  fill(192, 32, 32);
  emissive(192,0,0);
  translate(sin(evolution/8)*diametre*2.7, cos(evolution/8)*diametre*3, -sin(evolution/8)*diametre*3.2);
  sphere(5);

  pointLight(32, 32, 192, -sin(evolution/9)*diametre*3.1, -cos(evolution/9)*diametre*2.9, sin(evolution/9)*diametre*2.8);

  fill(32, 32, 192);
  emissive(0,0,192);
  translate(-sin(evolution/9)*diametre*3.1, -cos(evolution/9)*diametre*2.9, sin(evolution/9)*diametre*2.8);

  sphere(5);

  pointLight(32, 192, 32, cos(evolution/10)*diametre*2.6, cos(evolution/10)*diametre*3.05, cos(evolution/10)*diametre*3.15);
  
  fill(32, 192, 32);
  emissive(0,192,0);
  translate(cos(evolution/10)*diametre*2.6, cos(evolution/10)*diametre*3.05, cos(evolution/10)*diametre*3.15);
  sphere(5);
  lightSpecular(128,128,128);

  ambientLight(0,0,0);

  camera(sin((evolution/16))*500, cos((evolution/16))*500, 900+sin((evolution/16))*sin((evolution/32))*500, 16/9*sin((evolution)/16)*diametre, cos((evolution)/16)*diametre, 0.0, 0.0, 1.0, 0.0);
  emissive(0,0,0);
  fill(255,255,255);
  scale(1.5);
  maFractale(1, IterationMax);
  
  scale(0.2);
  strokeWeight(0);
  shape(Spherique);

  if(compteur<=NombreDeCaptures && EnregistrementCaptures==1)
  { 
    saveFrame(""+DossierCaptures+"/"+NomCaptures+"######.png");
  }

  evolution+=Angle;
  
  compteur+=1;
  
  println(evolution);
  
  
}

void maFractale(int it, int IterationMax)
{
  if(it>=IterationAff)
  {
 sphere(diametre*ModifTailleSphere);
  }
 if(it<IterationMax)
 {
   pushMatrix();  
      translate(diametre*(Redim*2+1),0,0);
      scale(Redim,Redim,Redim);
      if(evolution<=7200 && evolution >=0)
      {
        rotateX(sin(it*evolution/60)*evolution%360*degre);
        rotateY(sin(it*evolution/60)*evolution%360*degre);
      }
      maFractale(it+1,IterationMax);
  popMatrix();

  pushMatrix();  
      translate(-diametre*(Redim*2+1),0,0);
      scale(Redim,Redim,Redim);
      if(evolution<=7200 && evolution >=0)
      {
        rotateY(sin(it*evolution/60)*evolution%360*degre);
        rotateZ(-sin(it*evolution/60)*evolution%360*degre);
      }




      maFractale(it+1,IterationMax);
    popMatrix(); 
   pushMatrix();  
      translate(0,diametre*(Redim*2+1),0);
      scale(Redim,Redim,Redim);
      if(evolution<=7200 && evolution >=0)
      {
        rotateX(sin(it*evolution/60)*evolution%360*degre);
        rotateZ(sin(it*evolution/60)*evolution%360*degre);
      }
      maFractale(it+1,IterationMax);
  popMatrix();

  pushMatrix();  
      translate(0,-diametre*(Redim*2+1),0);
      scale(Redim,Redim,Redim);
      if(evolution<=7200 && evolution >=0)
      {
        rotateZ(sin(it*evolution/60)*evolution%360*degre);
        rotateY(-sin(it*evolution/60)*evolution%360*degre);
      }
      maFractale(it+1,IterationMax);
    popMatrix(); 

 }
}




