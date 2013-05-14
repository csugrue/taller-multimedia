class Particle{
  
  float x,y,velX,velY;
  float radius;
  
  Particle(){
    reset();
  }
  
  void reset(){
    x = random(width);
    y = random(height);
    velX = 0;
    velY = 0;
    radius = random(3,5);
  }
  
  void update(){
    // aplicar la velocidad
    x += velX;
    y += velY;
    
    float d = dist(bX,bY,x,y);
    
    if( d < 100 ){
      // reaction to mouse
      velX = 2*(bX - x)/d;
      velY = 2*(bY - y)/d;
    
    }
    
    velX *= .99;
    velY *= .99;
        
    if( y > height || y < 0 || x > width || x < 0){
      reset();
    }
  }
  
  void display(){
    fill(255, 63, 180);
    ellipse(x, y, radius, radius);
  }
  
  
  
}

