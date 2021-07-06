void keyPressed() {
    isKeyDown = true ;   
    //changes particle image
    if (key == 'z'){  
      if(imgincrease < 3){
        imgincrease++;
      } else if (imgincrease == 3){
        imgincrease = 0;
      }
    }    
    //increases image size
    if (key == ']'){    
      imgwidth += 20;
      imgheight += 20;
    }
    //decreases image size
    if (key == '['){    
      imgwidth -= 20;
      imgheight -= 20;
    }
     //random width & height of particle 
    if(key == 'r'){
      imgwidth = random(10,400);
      imgheight = random(10,400);
    } 
    //reset particle size
    if (key == 'R'){
      imgwidth = 100;
      imgheight = 100;
    }
    //increases particle acceleration
    if (key == 'm'){
      acceleratenum += 0.1;    
      print(" acceleratenum: " + acceleratenum);
    }
    //decreases particle acceleration
    if (key == 'n'){
      acceleratenum -= 0.1;   
      print(" acceleratenum: " + acceleratenum);
    }
    //pause
    if (key == 'p'){
        noLoop();
    }
    //restart
    if (key == 'o'){
      loop();
    }
    // bg eraseRate, similar to CSC480SP2020Recur2D.pde
    if (key >= '0' && key <= '9') {
      bgErase = key - '0' ;
      println(" eraseRate " + bgErase);
    } else if (key == 'c') {
      bgErase = 100 ;
      println(" eraseRate " + bgErase);
    }    
    //changes the bg to mouseX & mouseY position
    if (key == 'b'){
      bgMouse = true;
    } else if (key == 'B'){
      bgMouse = false;
    }   
    // changes the bg color for (RRR,ggg(mouseX),bbb(mouseY))
    if(key == '<'){
      bgColor += 10;
      print(" bgColor: " + bgColor);
    } else if (key == '>'){
      if(bgColor > 9){
        bgColor -= 10;
        print(" bgColor: " + bgColor);
      }
    }
    //turn on/off particle tint
    if(key == 't'){
      tintBoo = true;
    } else if(key == 'T'){
      tintBoo = false;
    }
}

class Particle{
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  int alpha = 101;
  
  Particle(){
    location = new PVector(mouseX-50, mouseY-50);
    //location = new PVector(width/2, height-50);
    velocity = new PVector(random(-5,5), random(-5,-2));
    acceleration = new PVector(0, acceleratenum);
    sprite = loadImage("sprite"+imgincrease+".png");
  }
  
  void move(){
    location.add(velocity);
    velocity.add(acceleration);
  }
  
  void display(){
    if (tintBoo == true){
      float [] randomTint = new float[3];
        for(int i=0; i < 3; i++){
          randomTint[i] = random(0,255);
          tint(randomTint[0], randomTint[1], randomTint[2]);
        }
      image(sprite,location.x, location.y, imgwidth, imgheight);
    }else if (tintBoo == false){
      noTint();
      image(sprite,location.x, location.y, imgwidth, imgheight);
    }
  }
  
}
