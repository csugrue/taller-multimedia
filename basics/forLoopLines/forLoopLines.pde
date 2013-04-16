void setup(){
  size(300,300);
}


void draw(){
  
  background(0);
  
  stroke(255);
  strokeWeight( map(mouseX,0,width,0,20) );
  
  for(int i = 0; i < width+20; i+= 20){
    line(i,0,i,height);
  }
  
}

