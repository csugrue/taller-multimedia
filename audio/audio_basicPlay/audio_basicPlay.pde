/*
Taller de Multimedia Spring 2013
 Chris Sugrue
 Cargar y usar un archivo de audio.
 Based on examples from Processing 2 Creative Programming Cookbook.

 */

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

// declarar el objecto de minim
Minim minim;
AudioPlayer player;
AudioPlayer player2;

void setup() {

  size(300, 100);

  minim = new Minim(this);  // crear el objecto

  player = minim.loadFile("groove.mp3"); // crear el player con el archivo de audio
  player.play();
  
}


void draw() {
  background(255);
  
 float x = map(player.position() * .001, 0, player.length()*.001, 0, width);
  
  
  stroke( 0 ); 
  line( x, 0, x, height );
}


void keyPressed() {
  
  if( key == ' ' ){
    
    if( player.isPlaying() ){
      player.pause();
    }else{
      player.play();
    }
    
  }
  
  if( key == 'r'){
    player.rewind();
  }
  
}

void stop()
{
  // always close Minim audio classes when you are done with them
  player.close();
  minim.stop();

  super.stop();
}

