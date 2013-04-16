int total = 200;
int [] xpos = new int[total];
int [] ypos = new int[total];

void setup(){  
  
  size(300,300);
  
  for( int i = 0; i < xpos.length; i++){
    xpos[i] = int( random(0,width) );
    ypos[i] = int( random(0,height) );
  }
  
}

void draw(){
  
  background(255);
  
  for( int i = 0; i < xpos.length; i++){
    ellipse( xpos[i], ypos[i], 10,10);
  }

}

