

//Spaceship variables 
float Spaceshipcolor = (0);
float SpaceshipX = 700;
float SpaceshipY = 600;
float CrashSize = 10; 
//Part of collition system that couldn't make. 
//you lost message
float messagePositionX2 = -650;
float messagePositionY2= - 400;
float messagePositionX1 = 650;
float messagePositionY1= - 0;
String message2 = "YOU LOST";
String message1 = "Get Prepared";
//Spaceship body
void drawSpaceship() {
  push();
  stroke(#FCE405);
  fill(#FCE405);
  triangle(SpaceshipX, SpaceshipY  + 10, SpaceshipX + 10, SpaceshipY + 60, SpaceshipX + 30, SpaceshipY + 80);
  triangle(SpaceshipX, SpaceshipY  + 10, SpaceshipX + 10, SpaceshipY + 60, SpaceshipX, SpaceshipY + 100);
  triangle(SpaceshipX, SpaceshipY  + 10, SpaceshipX - 10, SpaceshipY + 60, SpaceshipX -1, SpaceshipY + 100);
  triangle(SpaceshipX, SpaceshipY  + 10, SpaceshipX - 10, SpaceshipY + 60, SpaceshipX - 30, SpaceshipY + 80);
  stroke(0);
  fill(0);
  triangle(SpaceshipX, SpaceshipY  + 10, SpaceshipX + 30, SpaceshipY + 60, SpaceshipX- 30, SpaceshipY + 60);
  stroke(#B91A1A);
  fill (#B91A1A);
  rect( SpaceshipX, SpaceshipY, 40, 70, 20);
  stroke(#E0B824);
  fill(#E0B824);
  triangle(SpaceshipX, SpaceshipY - 60, SpaceshipX + 22, SpaceshipY- 25, SpaceshipX- 22, SpaceshipY-25);
  stroke(#B91A1A);
  fill(#B91A1A);
  ellipse(SpaceshipX, SpaceshipY, CrashSize, CrashSize);
  pop();
} 



// Movement of the Spaceship with keyboard 
void keyPressed() {
  // constrol with keyletters
  if (key == 'd' || key == 'D' ) {
    SpaceshipX += 40;
    MovSound.play(1, 0.3);
  }
  if (key == 'a' || key == 'A') {
    SpaceshipX += -40;
    MovSound.play(1, 0.3);
  }
  if (key == 'w' || key =='W') { 
    SpaceshipY += - 40;
    MovSound.play(1, 0.3);
  }
  if (key == 's' || key  =='S') { 
    SpaceshipY +=  40;
    MovSound.play(1, 0.3);
  }
  // control with key arrows 
  if (keyCode == RIGHT ) {
    SpaceshipX += 40;
    MovSound.play(1, 0.3);
  }
  if (keyCode == LEFT) {
    SpaceshipX += - 40;
    MovSound.play(1, 0.3);
  }
  if (keyCode == UP) { 
    SpaceshipY += - 40;
    MovSound.play(1, 0.3);
  }
  if (keyCode == DOWN) { 
    SpaceshipY += 40;
    MovSound.play(1, 0.3);
  }
}   
// Spacehship rotation

// class of Asteroids 
class AsteroidsConstruction {

  float AsteroidX, AsteroidY, r;

  AsteroidsConstruction(float xpos, float ypos, float radiousA, float radiousB) {
    AsteroidX = xpos;
    AsteroidY = ypos;
    r = radiousA;
    r = radiousB;
  }
  //movemet
  void AsteroidSpeed() {
    AsteroidY = AsteroidY + 20 ;
  }

  // asteroid 
  void drawAsteroid() {
    push();
    stroke(#504040);
    fill(#504040); 
    //Asteroid shape
    ellipse(AsteroidX, AsteroidY, r, r);
    ellipse(AsteroidX + 20, AsteroidY +30, r-40, r-40);
    ellipse(AsteroidX- 40, AsteroidY -25, r-40, r-40);
    ellipse(AsteroidX - 20, AsteroidY +32, r-40, r-40);
    ellipse(AsteroidX + 30, AsteroidY - 35, r-35, r-35);

    //asteroid craters
    stroke(#2E2727);
    fill(#2E2727);
    ellipse(AsteroidX +7, AsteroidY +6, r-85, r-83);
    ellipse(AsteroidX +20, AsteroidY +30, r-75, r-71);
    ellipse(AsteroidX +8, AsteroidY -20, r-70, r-74);
    ellipse(AsteroidX - 30, AsteroidY -18, r-76, r-80);
    ellipse(AsteroidX -20, AsteroidY +25, r-78, r-75);
    ellipse(AsteroidX +40, AsteroidY -30, r-78, r-75);
    pop();
  }


  //Tryed to make a collition system but  couldn't makeit.
  void CollitionDetection() {
    if (dist(SpaceshipX, SpaceshipY, AsteroidX, AsteroidY) < 95) {


      CrashSize += 200; 
      messagePositionX2 += 1300;
      messagePositionY2 += 800;
      CrashSound.play(1, 0.7);

      noLoop();
    }
  }
}
// class of stars 
class StarsConstruction {

  float StarX, StarY;

  StarsConstruction(float Xpos, float Ypos) {

    StarX = Xpos;
    StarY = Ypos;
  }
  //movemet
  void StarSpeed() {
    StarY = StarY + 5 ;
  }
  // stars desing 
  void drawStars() {
    push(); 
    scale(1);
    stroke(#FAFAF7);
    fill(#FAFAF7); 
    //Stars shape
    triangle( StarX, StarY, StarX+3, StarY-10, StarX+6, StarY);  
    triangle(StarX+3, StarY-3, StarX-7, StarY, StarX+3, StarY+3);
    triangle(StarX+3, StarY-3, StarX+12, StarY, StarX+3, StarY+3);
    triangle( StarX, StarY, StarX+3, StarY+10, StarX+6, StarY);  
    pop();
  }
}



//Asteroid Array
AsteroidsConstruction[] AsteroidArray = new AsteroidsConstruction[800];
//Stars Array
StarsConstruction[] StarArray = new StarsConstruction[300];



// for all sound   
import processing.sound.*;
SoundFile mainTheme;
SoundFile CrashSound;
SoundFile MovSound;

//SETUP
void setup() {
  size( 1300, 800 );
  smooth();
  rectMode(CENTER);
  textAlign(CENTER);
  mainTheme = new SoundFile(this, "Main Theme Rocket Game .mp3");
  MovSound = new SoundFile (this, "movement sound rocket game.mp3");
  CrashSound = new SoundFile(this, "crash sound  rocket game.mp3");
  mainTheme.loop(1, 0.5);



  //Asteroid Array
  for (int i=0; i < AsteroidArray.length; i++) {
    AsteroidArray[i] = new AsteroidsConstruction(random(0, 1300), random(-40000, -400 ), 110, 110 );
    if (i >= AsteroidArray.length) {
      i = 0;
    }
  }
  //Asteroid Array
 
  // Stars Array
  for (int a=0; a < StarArray.length; a++) {
    StarArray[a] = new StarsConstruction( random(0, 1300), random(-10000, 800 ));
    if (a >= StarArray.length) {
      a = 0;
    }
  }
}



void draw() { 
  background(#120C55);
  //Stars funtion
  for (int a=0; a < StarArray.length; a++) { 
    StarArray[a].drawStars();
    StarArray[a].StarSpeed();
  }

  //Asteroid funtion
  for (int i=0; i < AsteroidArray.length; i++) { 
    AsteroidArray[i].drawAsteroid();
    AsteroidArray[i].AsteroidSpeed();
    AsteroidArray[i].CollitionDetection();
  }

  //Spaceship funtion

  drawSpaceship();
  //message "You lost"
  fill(0, 0, 0);
  textSize(200);
  text(message2, messagePositionX2, messagePositionY2);
  fill(255, 0, 0);
  textSize(100);
  text(message1,messagePositionX1, messagePositionY1);
  messagePositionY1 += 20;
}
