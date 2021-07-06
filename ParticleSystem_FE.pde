// Original Author:
// Veer Vohra
// Simple Particle System
// Java Ver 1.0
// https://www.openprocessing.org/sketch/794160
//
// Particle key commands built onto pre-built particle system
// Additions by: Faith Evans - Spring 2020 CSC 480 Final
// Key Cmds:
// z = Cycles through the particle images
//
// ] = Makes the particle size larger
// [ = Makes the particle size smaller
// r = Random particle width/height
// R = Resets particle size to 100x100px
//
// m = Increases acceleration rate
// n = Decreases acceleration rate
//
// p = Pauses the sketch
// o = Starts the sketch
//
// 0-9 = Erasure rate 
// c = Clear erasure 
//
// b = Changes the bg (rrr,GGG,BBB) to mouseX & mouseY position
// B = Resets the bg to default blue 
//
// < = Increases the bg color for (RRR,ggg,bbb)
// > = Decreases the bg color for (RRR,ggg,bbb)
//
// warning: flashing
// t = Turns on random tint for the particle
// T = Turns off random tint 


boolean isKeyDown = false ;
boolean bgMouse = false;
boolean tintBoo = false;
PImage sprite;
float imgwidth = 100;
float imgheight = 100;
float acceleratenum = 0.5;
int imgincrease = 0;
int bgErase = 100 ; 
int bgColor = 0;


ArrayList<Particle> particles;

void setup(){
  size(1280, 720, P2D);
  particles = new ArrayList<Particle>();

}

void draw(){
  // bg eraseRate, similar to CSC480SP2020Recur2D.pde
  if (bgErase >= 99) {
    if(bgMouse == true){
      background(bgColor, mouseY, mouseX);
    } else {
      background(148, 255, 234);
    }
  } else if (bgErase > 0) {
    // Use a translucent rectangle size of window for partial erase.
    fill(148,255,234,bgErase);
    noStroke();
    rectMode(CORNER);
    rect(0,0,width, height);
  }
  
  //original author's code 
  particles.add(new Particle());
  
  for (int i = 0; i < particles.size(); i++){
    Particle p = particles.get(i);
    p.move();
    p.display();
    if (p.alpha <= 0){
      particles.remove(p);
    }
  }  
}
