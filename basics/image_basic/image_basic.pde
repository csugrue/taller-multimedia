PImage miGato;

void setup(){
  
  size(500,500);
  
  miGato = loadImage("cat.jpg");
  imageMode(CENTER);
  
}

void draw(){
  
  background(255);
  
  pushMatrix();
    translate(mouseX,mouseY);
    rotate( -radians(millis()*.1) );
    image(miGato,0,0,miGato.width*.5,miGato.height*.5);
  popMatrix();

}

