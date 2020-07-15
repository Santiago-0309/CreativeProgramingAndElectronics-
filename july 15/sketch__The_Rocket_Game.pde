//Spaceship variables 
float Spaceshipcolor = (0);
float SpaceshipX = 360;
float SpaceshipY = 350;
float CrashSize = 10; 
//Asteroid variables
float r = 110;
float t = 110;
 //you lost message
 //Part of collition system that couldn't make. 
float messagePosition = -350;
String message2 = "YOU LOST";

//Spaceship body
void drawSpaceship(){
  stroke(#FCE405);
  fill(#FCE405);
  triangle(SpaceshipX, SpaceshipY  + 10, SpaceshipX + 10, SpaceshipY + 60, SpaceshipX + 30,SpaceshipY + 80);
  triangle(SpaceshipX, SpaceshipY  + 10, SpaceshipX + 10, SpaceshipY + 60, SpaceshipX ,SpaceshipY + 100);
triangle(SpaceshipX, SpaceshipY  + 10, SpaceshipX - 10, SpaceshipY + 60, SpaceshipX -1,SpaceshipY + 100);
triangle(SpaceshipX, SpaceshipY  + 10, SpaceshipX - 10, SpaceshipY + 60, SpaceshipX - 30,SpaceshipY + 80);
 stroke(0);
 fill(0);
 triangle(SpaceshipX, SpaceshipY  + 10, SpaceshipX + 30, SpaceshipY + 60, SpaceshipX- 30,SpaceshipY + 60);
stroke(#B91A1A);
 fill (#B91A1A);
 rect( SpaceshipX,SpaceshipY, 40, 70, 20);
  stroke(#E0B824);
  fill(#E0B824);
  triangle(SpaceshipX, SpaceshipY - 60, SpaceshipX + 22, SpaceshipY- 25, SpaceshipX- 22,SpaceshipY-25);
   stroke(#B91A1A);
  fill(#B91A1A);
  ellipse(SpaceshipX,SpaceshipY,CrashSize,CrashSize);
} 




// Movement of the Spaceship with keyboard 
void keyPressed(){
  frameRate( 300);
  // constrol with keyletters
 if (key == 'd' || key == 'D' ){
   SpaceshipX += 30;
 }
  if (key == 'a' || key == 'A'){
    SpaceshipX += -30;
  }
  if (key == 'w' || key =='W'){ 
    SpaceshipY += - 30;
  }
  if (key == 's' || key  =='S'){ 
    SpaceshipY +=  30;
  }
  // control with key arrows 
  if (keyCode == RIGHT ){
   SpaceshipX += 30;
 }
  if (keyCode == LEFT){
    SpaceshipX += - 30;
  }
  if (keyCode == UP){ 
    SpaceshipY += - 30;
  }
  if (keyCode == DOWN){ 
    SpaceshipY += 30;
  }
}   
// class of Asteroids 
class AsteroidsConstruction{
  
  float AsteroidX,AsteroidY,r,t;
  
  AsteroidsConstruction(float xpos, float ypos, float radiousA, float radiousB){
    AsteroidX = xpos;
    AsteroidY = ypos;
    r = radiousA;
    t = radiousB;
  }
 //movemet
void AsteroidSpeed(){
  AsteroidY = AsteroidY + 10 ;
  }
       
// asteroid 
void drawAsteroid(){
  push();
  scale(1);
  stroke(#504040);
  fill(#504040); 
  //Asteroid shape
  ellipse(AsteroidX,AsteroidY,r,t);
  ellipse(AsteroidX + 20,AsteroidY +30,r-40,t-40);
  ellipse(AsteroidX- 40,AsteroidY -25,r-40,t-40);
  ellipse(AsteroidX - 20,AsteroidY +32,r-40,t-40);
  ellipse(AsteroidX + 30,AsteroidY - 35,r-35,t-35);

  //asteroid craters
  stroke(#2E2727);
  fill(#2E2727);
  ellipse(AsteroidX +7,AsteroidY +6,r-85,t-83);
    ellipse(AsteroidX +20,AsteroidY +30,r-75,t-71);
   ellipse(AsteroidX +8,AsteroidY -20,r-70,t-74);
  ellipse(AsteroidX - 30,AsteroidY -18,r-76,t-80);
  ellipse(AsteroidX -20,AsteroidY +25,r-78,t-75);
   ellipse(AsteroidX +40,AsteroidY -30,r-78,t-75);
   pop();
}
 
 
 //Tryed to make a collition system but  couldn't makeit.
   void CollitionDetection(){
if( SpaceshipX -50 == AsteroidY +50){

     messagePosition += 700;
    CrashSize += 3000;
    noLoop(); }
  if( SpaceshipX-20 == AsteroidX +50||SpaceshipX+20 == AsteroidX -50){
   messagePosition += 700;
    CrashSize += 3000;
    noLoop(); }
  }
}


//Asteroid Array
AsteroidsConstruction[] AsteroidArray = new AsteroidsConstruction[30];



//SETUP
void setup(){
  size( 700,700);
  smooth();
  rectMode(CENTER);
  textAlign(CENTER);

//Asteroid Array
  for (int i=0; i < AsteroidArray.length; i++){
   AsteroidArray[i] = new AsteroidsConstruction(random(100,680), random(-4000,0 ),r,t);
if (i >= AsteroidArray.length){
  i = 0;}

  }  
}


void draw(){ 
  background(#120C55);
 //Asteroid funtion
   for (int i=0; i < AsteroidArray.length; i++){ 
AsteroidArray[i].drawAsteroid();
AsteroidArray[i].AsteroidSpeed();
AsteroidArray[i].CollitionDetection();
 
   
//Spaceship funtion
drawSpaceship();
fill(0,0,0);
textSize(100);
text(message2, messagePosition,messagePosition);
 //
 
   }   
}
