Particle [] particulos;

void setup(){
  size(500,500);
  
  particulos = new Particle[200];
  
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
    x = width/2;
    y = height/2;
    velX = random(-1,1);
    velY = random(-5,-1);
  }
  
  void reset(){
    x = width/2;
    y = height/2;
    velX = random(-1,1);
    velY = random(-5,-1);
  }
  
  void update(){
    // aplicar la velocidad
    x += velX;
    y += velY;
    
    velY += .125;
    
    if( y > height ){
      reset();
    }
  }
  
  void display(){
    fill(255, 63, 180);
    ellipse(x, y, 5, 5);
  }
  
  
  
}

