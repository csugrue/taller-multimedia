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
FFT fft;

int buffer = 256;

float [] xpts = new float[buffer];
float [] ypts = new float[buffer];
float [] radius = new float[buffer];

void setup() {
  size( 800, 800 ); 
  
  minim = new Minim( this );

  // crear audio in
  in = minim.getLineIn(minim.STEREO, buffer);

  fft = new FFT( in.bufferSize(), in.sampleRate() ); 
  
  for ( int i = 0; i < xpts.length; i++) {
    xpts[i] = random(width);
    ypts[i] = random(height);
  }

  smooth();
}

void draw() {
  
  fft.forward( in.mix );

  fill( 0, 8 ); 
  noStroke(); 
  rect( 0, 0, width, height );
   
  noFill();
  stroke(255);

  for ( int i = 0; i < xpts.length; i++) {
    float radius = 20*fft.getBand(i);
    ellipse(xpts[i], ypts[i], radius,radius);
  }
  
}

void stop() {
  in.close();
  minim.stop(); 
  super.stop();
}

