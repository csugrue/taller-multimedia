/*
 Based on examples from Processing 2 Creative Programming Cookbook.
*/

import ddf.minim.*; 
import ddf.minim.signals.*; 
import ddf.minim.analysis.*; 
import ddf.minim.effects.*;

Minim minim; 
AudioInput in;
FFT fft;

void setup() {
  size( 1024, 480 ); 
  minim = new Minim( this );
  
  in = minim.getLineIn(Minim.STEREO, 512);

  fft = new FFT( in.bufferSize(), in.sampleRate() ); 
  background( 255 );
}

void draw() {
  
  // draw rect in background with alpha to make "fade" effect
  fill( 255, 8 ); 
  noStroke(); 
  rect( 0, 0, width, height );
  
  // update fft
  fft.forward( in.mix );
  
  // draw fft data
  strokeWeight( 4 ); 
  strokeCap( SQUARE ); 
  stroke( 0 );
  
  for ( int i = 0; i < fft.specSize(); i++ ) { 
    line( i*4, height, i*4, height - fft.getBand( i ) * 20 );
  }
  
}

void stop() {
  in.close();
  minim.stop(); 
  super.stop();
}

