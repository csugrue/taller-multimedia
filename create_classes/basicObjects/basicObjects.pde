// single object
ColorRect happyRect;

// many objects
ColorRect [] superRects = new ColorRect[100];

void setup(){
  
  size(300,300);
  
  // allocate memory for the object and create it
  happyRect = new ColorRect();
  
  // loop through each object in the array and initialize/allocate it
  for( int i = 0; i < superRects.length; i++){
    superRects[i] = new ColorRect();
  }
  
}


void draw(){
  
  happyRect.display();
  
  // loop through array of superRects and call display for each one
  for( int i = 0; i < superRects.length; i++){
     // call display function for object at position i
     superRects[i].display();
  }
  
  
}


// create the class definition
class ColorRect{

    // what variables do we need?
    float x;
    float y;
    float sze;
    color c;
    float speed;
    
    // constructor
    ColorRect(){
      x = random(width);
      y = random(height);
      sze = random(20,50);
      c = color(  random(255), random(255), random(255), random(100,200) );
      speed = random(.5,2);
    }
    
    // create a function to draw me
    void display(){
      fill(c);
      rect(x,y,sze,sze);
      
      x = x+speed;
      
      if( x > width+sze) x = -sze;
    }
    
}

