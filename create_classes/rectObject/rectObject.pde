ColorBox [] boxes;

void setup(){
  size(500,500);
  smooth();
  
  boxes = new ColorBox[100];
  for(int i = 0; i < boxes.length; i++){
    boxes[i] = new ColorBox();
  }
}


void draw(){
  background(0);
  rectMode(CENTER);
  for(int i = 0; i < boxes.length; i++){
    boxes[i].update();
    boxes[i].render();
  }
  
}

class ColorBox{

  float x;
  float y;
  float size;
  color c;
  float spin;
  float angle;
  
  ColorBox(){
    x = random(width);
    y = random(height);
    size = random(30,60);
    spin = random(-.05,.05);
    c = color(random(255),random(255),random(255),random(100,250));
    angle = 0;
  }
  
  void update(){
    angle += spin;
  }
  
  
  void render(){
    fill(c);
    pushMatrix();
      translate(x,y);
      rotate(angle);
      rect(0,0,size,size);
    popMatrix();
  }
  
}


