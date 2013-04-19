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

int totalPts = 256;

float [] xpts = new float[totalPts];
float [] ypts = new float[totalPts];
float [] radius = new float[totalPts];

void setup() {
  size( 800, 800 ); 

  minim = new Minim( this );
  in = minim.getLineIn(Minim.STEREO, 256);
  fft = new FFT( in.bufferSize(), in.sampleRate() ); 

  for ( int i = 0; i < xpts.length; i++) {
    xpts[i] = random(width);
    ypts[i] = random(height);
    radius[i] = 20;
  }

  background( 255 );
  smooth();
}

void draw() {

  fill( 0, 8 ); 
  noStroke(); 
  rect( 0, 0, width, height );
  fft.forward( in.mix );
   

  noFill();
  stroke(255);

  for ( int i = 0; i < radius.length; i++) {

    radius[i] = 20*fft.getBand(i);

    ellipse(xpts[i], ypts[i], radius[i],radius[i]);
  }
}

void stop() {
  in.close();
  minim.stop(); 
  super.stop();
}

