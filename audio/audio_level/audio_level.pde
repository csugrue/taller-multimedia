/*
Audio reactive example.
Taller de Multimedia. Chris Sugrue 
 */

import ddf.minim.*; 
import ddf.minim.signals.*; 
import ddf.minim.analysis.*; 
import ddf.minim.effects.*;

Minim minim; 
AudioInput in;


void setup() {
  
  size( 300, 300 ); 

  minim = new Minim( this );
  in = minim.getLineIn(Minim.STEREO, 256);
 
  background( 255 );
  smooth();
}

void draw() {

  fill( 0, 8 ); 
  noStroke(); 
  rect( 0, 0, width, height );   

  noFill();
  stroke(255);

  float radius = in.mix.level()*2000;
  ellipse(150,150,radius,radius);
  
}

void stop() {
  in.close();
  minim.stop(); 
  super.stop();
}

