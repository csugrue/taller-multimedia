import hypermedia.video.*;

Particle [] particulos;
float bX = 0;
float bY = 0;

OpenCV opencv;
Blob[] blobs;
int threshold = 30;
boolean doCapture = true;

boolean bShowCamera = false;

void setup() {

  size(640, 480);
  opencv = new OpenCV( this );
  opencv.capture(320, 240);
  
  particulos = new Particle[500];
  for(int i = 0; i < particulos.length; i++){
    particulos[i] = new Particle();
  }
  
  smooth();

}

void draw() {
  
  // update open cv  
  opencv.read();
  opencv.flip( OpenCV.FLIP_HORIZONTAL );
  opencv.convert(OpenCV.GRAY);

  if (doCapture) {
    opencv.remember(OpenCV.BUFFER);
    doCapture = false;
  }
  
  if(bShowCamera){
    image( opencv.image(), 160*2, 0, 160,120 );
  }
  
  opencv.absDiff();
  opencv.threshold(threshold);
  
  // draw camera preview
  if(bShowCamera){
    image( opencv.image(), 0, 0, 160,120 );
    image( opencv.image(opencv.MEMORY), 160, 0, 160, 120 );
  }
  
  // find blobs
  blobs = opencv.blobs( 100, 320*240/3, 20, false );

  //------ draw particles
  noStroke();
  fill(0,10);
  rect(0,0,width,height);
  float scaleMe = width/320.0;
  
  if(blobs.length > 0 ){
     bX = blobs[0].centroid.x*scaleMe;
     bY = blobs[0].centroid.y*scaleMe;
  }
  
  for(int i = 0; i < particulos.length; i++){
    particulos[i].update();
    particulos[i].display();
  }
  
  for(int i = 0; i < particulos.length; i++){
    for(int j = 0; j < i; j++){
      float d = dist(particulos[i].x,particulos[i].y,particulos[j].x,particulos[j].y);
      if( d < 10){
        particulos[i].velX += .1*(particulos[i].x-particulos[j].x)/d;
        particulos[i].velY += .1*(particulos[i].y-particulos[j].y)/d;
        particulos[j].velX -= .1*(particulos[i].x-particulos[j].x)/d;
        particulos[j].velY -= .1*(particulos[i].y-particulos[j].y)/d;

      }
    }
  }
}


void keyPressed(){
  if( key == ' ') doCapture = true;
  if( key == '+') threshold++;
  if( key == '-') threshold--;
  if( key == 'c') bShowCamera = !bShowCamera;
}

void stop(){
  opencv.stop();
  super.stop();
}
