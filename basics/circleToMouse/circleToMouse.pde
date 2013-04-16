float x = 0;
float y = 0;

void setup(){
  size(300,300);
  smooth();
}

void draw(){
  
  background(0);
  
  x = .99*x + .01*mouseX;
  y = .99*y + .01*mouseY;
  
  ellipse(x,y,20,20);
  
}


