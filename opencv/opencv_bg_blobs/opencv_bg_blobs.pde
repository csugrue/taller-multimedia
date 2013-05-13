import hypermedia.video.*;

OpenCV opencv;
Blob[] blobs;
int threshold = 100;
boolean doCapture = false;

void setup() {

  size(320, 240);
  opencv = new OpenCV( this );
  opencv.capture(320, 240);
}

void draw() {

  opencv.read();
  opencv.flip( OpenCV.FLIP_HORIZONTAL );
  opencv.convert(OpenCV.GRAY);


  if (doCapture) {
    opencv.remember(OpenCV.BUFFER);
    doCapture = false;
  }

  opencv.absDiff();
  opencv.threshold(threshold);

  image( opencv.image(), 0, 0 );

  blobs = opencv.blobs( 100, 320*240/3, 20, false );

  for ( int i=0; i<blobs.length; i++ ) {
    fill(255, 0, 0);
    ellipse(blobs[i].centroid.x, blobs[i].centroid.y, 4, 4);

    noFill();
    stroke(255, 0, 0);
    rect( blobs[i].rectangle.x, 
    blobs[i].rectangle.y, 
    blobs[i].rectangle.width, 
    blobs[i].rectangle.height );
  }
}


void keyPressed(){
  if( key == ' ') doCapture = true;
  if( key == '+') threshold++;
  if( key == '-') threshold--;
}

void stop(){
  opencv.stop();
  super.stop();
}
