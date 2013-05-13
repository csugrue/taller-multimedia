
void setup() {
  size(320, 240);
  loadPixels();
    
    for(int i = 0; i < 320*240; i++){
      pixels[i] = color(random(255),random(255),random(255) );
    }
    
  updatePixels();

}

void draw() {
   //color c = get(mouseX,mouseY);
   color c = pixels[mouseY*width+mouseX];
   fill(c);
   rect(0,0,30,30);  
}


void keyPressed(){
  
}

