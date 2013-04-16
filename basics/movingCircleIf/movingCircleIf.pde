float x = 0;
float y = 0;

void setup() {
  size(300, 300);
  smooth();
}

void draw() {

  // clear background
  background(200,19,0);
  
  noStroke();
  fill(255);
  ellipse( x, y, 50, 50);
  
  
  x++;
  y++;

  if ( x > (width+25) ) {
    x = -25;
  }

  if ( y > (height+25) ) {
    y = -25;
  }


}

