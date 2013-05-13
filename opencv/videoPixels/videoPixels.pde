import processing.video.*;


Capture video;
int threshold = 100;

void setup() {
  size(320, 240);
  video = new Capture(this, width, height);
  video.start();
  
}

void draw() {
  
  loadPixels();
  
  if ( video.available() ) {
    
    video.read();
    video.loadPixels();
    
    //image(video,0,0);
    
    for (int i = 0; i < 320*240; i++) {
      
      color currColor = video.pixels[i];
      float bright = brightness(currColor);
      
      if ( bright > threshold ) {
        pixels[i] = color(255);
      } 
      else{
        pixels[i] = color(0);
      }
    }
    
    updatePixels();
    
  }
}


void keyPressed(){
  if(key == '+') threshold++;
  if(key == '-') threshold--;
}

