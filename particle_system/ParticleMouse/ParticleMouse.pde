Particle [] particulos;

void setup(){
  size(500,500);
  
  particulos = new Particle[1000];
  
  for(int i = 0; i < particulos.length; i++){
    particulos[i] = new Particle();
  }
}

void draw(){
  background(255);
  for(int i = 0; i < particulos.length; i++){
    particulos[i].update();
    particulos[i].display();
  }
}

class Particle{
  
  float x,y,velX,velY;
  
  Particle(){
    reset();
  }
  
  void reset(){
    x = random(width);///2;
    y = random(height);///2;
    velX = 0;//random(-1,1);
    velY = 0;//random(-5,-1);
  }
  
  void update(){
    // aplicar la velocidad
    x += velX;
    y += velY;
    
    float d = dist(mouseX,mouseY,x,y);
    
    if( d < 100 ){
      // reaction to mouse
      velX = .9*(mouseX - x)/d;
      velY = .9*(mouseY - y)/d;
    
    }
    
    velX *= .99;
    velY *= .99;
    
    //velY += .125;
    
    if( y > height ){
      reset();
    }
  }
  
  void display(){
    fill(255, 63, 180);
    ellipse(x, y, 5, 5);
  }
  
  
  
}

