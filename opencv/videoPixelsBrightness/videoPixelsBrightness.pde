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
    float brightest = 0;
    int xpos = 0;
    int ypos = 0;
    
    for (int x = 0; x < 320; x++) {
      for (int y = 0; y < 240; y++) {
        int i = y * 320 + x;
        color currColor = video.pixels[i];
        float bright = brightness(currColor);

        if ( bright > threshold ) {
          pixels[i] = color(255);
        } 
        else {
          pixels[i] = color(0);
        }
        
        if(brightest < bright){
          brightest = bright;
          xpos = x;
          ypos = y;
        }
        
      }
    }
    
    updatePixels();
    fill(255,0,0);
    ellipse(xpos,ypos,10,10);
  }



}


void keyPressed() {
  if (key == '+') threshold++;
  if (key == '-') threshold--;
}

