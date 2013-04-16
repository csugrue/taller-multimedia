/*
Taller de Multimedia Spring 2013
Chris Sugrue
Based on examples from Processing 2 Creative Programming Cookbook.
*/

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

// declarar el objecto de minim
Minim minim;

// declarar objecto para audio en directo
AudioInput in;

void setup() {

  size(600, 600);

  minim = new Minim(this);  // crear el objecto

  in = minim.getLineIn( Minim.STEREO, 512 );
  
  smooth();
  background(0);
  
}

void draw() {
  
  fill( 0, 0,0,16 );
  noStroke(); 
  rect( 0, 0, width, height );
  
  // calcula un valor para el radius del ellipse
  float r = 0; 
  for ( int i = 0; i < in.bufferSize(); i++ ) {
    // minim devuelve valores negativo y positivo - es una onda
    // usamos abs() para convertir a solo positivo
    r += abs( in.mix.get( i ) );
  }
  
  println(r);
  // scale the value because it will be a bit small
  r *= 10;
  
  stroke( 255 ); 
  noFill();
  ellipse( width/2, height/2, r, r );
  
  
}

void stop() {
  in.close(); 
  minim.stop(); 
  super.stop();
}

