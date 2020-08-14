

/* ----------------- SHIPS --------------*/
class Ship {
  float x, y, vx, vy; // spaceship is defined by a position (x,y) & speed for both x and y axis
  boolean upPressed, downPressed, leftPressed, rightPressed; // used to know if spaceship needs to be moved

  int speed = 30; // const speed of ship
  int nbLifes = 5; // const number of ship life

  Ship() { // spaceship ctor
    this.x = width/2;
    this.y = height - height/4;
    this.vy = 0;
    this.vx = 0;
  }

  void resetPosition() {
    this.x = width/2;
    this.y = height - height/4;
    this.vy = 0;
    this.vx = 0;
  }

  void drawShip() { // check if any key have been pressed. if so, adapt spaceship position
    if (upPressed == true) {
      vy= -speed;
    } else if (downPressed == true) {
      vy = speed;
    } else {
      y -= vy;
      vy = 0;
    }

    if (leftPressed == true) {
      vx= -speed;
    } else if (rightPressed == true) {
      vx= speed;
    } else {
      vx=0;
    }

    x += vx;

    if (y-20>=50 && y<height) {
      y += vy;
    }


    if (x+10 < 0)
      x = width+9;

    if (x-10 > width) x = -9;

    spaceShip(x, y, 100);
  }

  // draw space
  void spaceShip(float x, float y, float w) {
    fill(50);
    noStroke();
    ellipse(x, y, w, w/3);
    ellipse(x, y-w/8, w/3, w/3);

    float diam = w * 0.125;
    for (float windowX = x-diam*2; windowX <= x+diam*2; windowX += diam*2) {
      fill(255);
      ellipse(windowX, y, diam, diam);
    }
  }
}
/* ----------------------------------------*/





/* ----------------- BULLETS --------------*/
class Bullet {
  float x, y, vy; // bullets have (x,y) position but only move in y axis
  float size;

  Bullet(Ship playerShip) {
    this.x = playerShip.x;
    this.y = playerShip.y - 15;
    this.vy = -10;
    this.size = 10;
  }

  void drawBullet() {
    //color
    fill(255, 0, 0);
    ellipse(x, y, size, size);
    y+=vy;
  }
}
/* ----------------------------------------*/


/* ----------------- STARS --------------*/
class Star { 
  float x, y; // same has bullet
  int vy;

  Star() { //ctor
    this.x = random(width);
    this.y = 0;
    this.vy = 4; //velocity of falling star
  }

  void drawStar() {
    scale(1);
    stroke(#FAFAF7);
    fill(#FAFAF7); 
    //Stars shape
    triangle(x, y, x + 3, y - 10, x + 6, y);  
    triangle(x +3, y - 3, x - 7, y, x + 3, y + 3);
    triangle(x + 3, y - 3, x + 12, y, x + 3, y + 3);
    triangle(x, y, x + 3, y + 10, x + 6, y);  

    y+=vy;
  }
}
/* ----------------------------------------*/


/* ----------------- ASTEROIDS --------------*/
class Asteroid {
  float size, x, y; // asteroids are defined by position (x,y) and a size

  int vy = 10; //speed of asteroid

  Asteroid(float size) {
    this.size = size;
    this.x = random(width);
    this.y = -size;
  }

  void drawAsteroid() {
    int r = 110;

    //scale(1);
    stroke(#504040);
    fill(#504040); 

    //Asteroid shape
    ellipse(x, y, r, r);
    ellipse(x + 20, y + 30, r - 40, r - 40);
    ellipse(x- 40, y - 25, r - 40, r - 40);
    ellipse(x - 20, y + 32, r - 40, r - 40);
    ellipse(x + 30, y - 35, r - 35, r - 35);

    //asteroid craters
    stroke(#2E2727);
    fill(#2E2727);
    ellipse(x + 7, y + 6, r - 85, r - 83);
    ellipse(x + 20, y + 30, r - 75, r - 71);
    ellipse(x + 8, y - 20, r - 70, r - 74);
    ellipse(x - 30, y - 18, r - 76, r - 80);
    ellipse(x - 20, y + 25, r - 78, r - 75);
    ellipse(x + 40, y - 30, r - 78, r - 75);

    y+=vy;
  }

  // check for collision with spaceship or bullet
  boolean checkCollision(Object other) {
    if (other instanceof Ship) { // if contact with spaceship screen become red for a fraction of seconds
      Ship playerShip = (Ship) other;
      float apothem = 10 * tan(60);
      float distance = dist(x, y, playerShip.x, playerShip.y-apothem);
      if (distance < size/2 + apothem + 10) { // check for distance
        // the entire frame goes green
        fill(255, 0, 0, 100);
        rect(0, 0, width, height);
        fill(255);
        CrashSound.play
          (1, 0.5);
        return true;
      }
    } else if (other instanceof Bullet) { // if contact with spaceship screen become green for a fraction of seconds
      Bullet bullet = (Bullet) other;
      float distance = dist(x, y, bullet.x, bullet.y); 
      //println(distance);
      if (distance <= size/2 + bullet.size/2 ) { // check for distance --> shoot has to be perfect
        // the entire frame goes green
        fill(0, 255, 0, 100); 
        rect(0, 0, width, height);
        fill(255);
        CrashSound.play
          (3, 0.1);
        return true;
      }
    }
    return false;
  }
}
/* ----------------------------------------*/


/* ------------ StartGame ------------------*/
class StartGame {
  String StartGameText, buttonText;
  int buttonX, buttonY, buttonW, buttonH;


  StartGame() { // ctor
    this.StartGameText = "Espace Asteroid Field!"; // title
    this.buttonText = "Start playing"; // message in button
    this.buttonW = 400; // button width
    this.buttonH = 100; // button height
    // button position x & y
    this.buttonX = width/2 - this.buttonW/2; 
    this.buttonY = height/2 - this.buttonH/2;
  }

  void drawStartGame() {
    fill(#120C55);
    rect(0, 0, width, height);
    rect(buttonX, buttonY, buttonW, buttonH);

    // title
    stroke(255);
    fill(255);
    textSize(60);
    text(this.StartGameText, width/3, height/4);

    // button
    fill(0);
    stroke(200);
    rect(buttonX, buttonY, buttonW, buttonH);
    fill(200);
    text(buttonText, buttonX+25, buttonY+70);
  }

  boolean mouseOverButton() {
    // return action when clicking on the button --> clicking outside button wont work
    return (mouseX > buttonX 
      && mouseX < buttonX + buttonW
      && mouseY > buttonY
      && mouseY < buttonY + buttonH);
  }
}
/* ----------------------------------------*/


/* ------------ EndGame ------------------*/
class EndGame { // similar as start Menu
  String gameOverText, buttonText, pointsText;
  int buttonX, buttonY, buttonW, buttonH;


  EndGame(int points) {
    this.gameOverText = "Game Over!";
    this.buttonText = "Retry";
    this.pointsText = "Your final Score is " + points; // display final number of pts 
    this.buttonW = 200;
    this.buttonH = 100;
    this.buttonX = width/2 - this.buttonW/2;
    this.buttonY = height/2 - this.buttonH/2;
  }

  void drawEndGame() {
    fill(#120C55);
    rect(0, 0, width, height);
    rect(buttonX, buttonY, buttonW, buttonH);

    // title
    stroke(255);
    fill(255);
    textSize(60);
    text(this.gameOverText, width/3, height/4);

    // button
    fill(0);
    stroke(200);
    rect(buttonX, buttonY, buttonW, buttonH);
    fill(200);
    text(buttonText, buttonX+25, buttonY+70);

    // display score
    stroke(255);
    fill(255);
    textSize(30);
    text(pointsText, width/3, height - height/4);
  }

  boolean mouseOverButton() { // same as start menu
    return (mouseX > buttonX 
      && mouseX < buttonX + buttonW
      && mouseY > buttonY
      && mouseY < buttonY + buttonH);
  }
}
/* ----------------------------------------*/



/*------------- INIT ---------------------*/
// Objects
Ship playerShip;
Bullet bullet;
StartGame start;
EndGame end;

// Arrays
ArrayList<Star> stars = new ArrayList<Star>(); // array of starts
ArrayList<Bullet> bullets = new ArrayList<Bullet>(); // array of bullets
ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>(); // array of asteroids

// Variables
int points;
float time; //vatiable of timer 
int starFrequency = 4; //frequency of star | LOWER == MORE STARS
float asteroidFrequency = 100; //frequency of asteroids | LOWER == MORE ASTEROIDS
boolean gameStart = false;
//music
import processing.sound.*;
SoundFile mainTheme;
SoundFile CrashSound;


// Window
void setup() {
  size(1300, 800); // window size (width, height)
  // new ship object
  playerShip = new Ship(); // call ship ctor
  points = 0; // init number of pt to 0
  mainTheme = new SoundFile(this, "Main Theme Rocket Game .mp3");
  CrashSound = new SoundFile(this, "crash sound  rocket game.mp3");   
  mainTheme.loop   
    (1, 0.2);
}


/*------------- MAIN CODE ---------------------*/
void draw() { 
  
  // pointeur null as long game is not ended
  if (end != null) {
    end.drawEndGame(); // when ended --> draw menu
    gameStart = false;
    time = 0;//restart timer
  } else if (!gameStart) { // gameStart = false --> window just opened
    start = new StartGame(); // call ctor
    start.drawStartGame(); // when ended --> draw menu
 
  }

  if (gameStart) { // gameStart = true --> went through start menu once 
    background(#120C55); // --> set background color
    drawStar(); // draw stars

    drawAsteroid(); // draw asteroids

    fill(255, 0, 0);
    stroke(255);
    drawBullet(); // draw bullet
    playerShip.drawShip(); // draw space

    // display current score
    stroke(255);
    fill(255);
    textSize(30);
    text("Points: " + points, 50, 50); 

    // display current nb of life(s)
    stroke(255);
    fill(255);
    textSize(30);
    text("Life(s): " + playerShip.nbLifes, 50, 100);

    // check if collision happened between asteroids and spaceshit/bullet
    checkCollision();
  }
}


/* --------------------- LOCAL FUNCTIONS ------------------- */
// Draw starts
void drawStar() {
  strokeWeight(8);
  stroke(255);
  if (frameCount % starFrequency == 0) { // if not enough stars on the current fame
    Star myStar = new Star(); // create one
    stars.add(myStar); // add new star to the stars array
  }
  for (int i = 0; i<stars.size(); i++) { // go across all stars in array
    Star currentStar = stars.get(i); // get info
    currentStar.drawStar(); // call draw function from star object
  }
}



// Draw bullets when vector size increases
void drawBullet() {
  //println(bullets.size());
  for (int i = 0; i<bullets.size(); i++) { // go across all bullets of the frame
    Bullet currentBullet = bullets.get(i);
    currentBullet.drawBullet(); // get bullet info and call draw function of the bullet object at the same time
  }
}


// draw asteroids
void drawAsteroid() {
  if (frameCount % asteroidFrequency == 0) { // if not enough asteroids on the current fame
    asteroids.add(new Asteroid(random(150, 250))); // create one and add it to the asteroids array at the same time
  }
 // frequency of asteroids 
    time = second(); // initialice timer
   println(time);
   println( asteroidFrequency);
 if (time == 59||time == 30){
  asteroidFrequency = asteroidFrequency - 1;
 }
  if (asteroidFrequency < 10){
   asteroidFrequency= 10;
  }
////

  for (int i = 0; i<asteroids.size(); i++) { // go across all asteroids of the frame
    Asteroid currentAsteroid = asteroids.get(i); // get info
    currentAsteroid.drawAsteroid(); // call draw function from asteroid object
    if (currentAsteroid.y > height + currentAsteroid.size) { // if asteroid go outside the window size...
      asteroids.remove(currentAsteroid); // ...delete it from array
      i--; // avoid memory error
      points--; // -1 pt for each asteroid missed
    }
  }
}

// Bullet and spaceship collision with asteroids
void checkCollision() { 
  for (int i = 0; i < asteroids.size(); i++) { // for all current asteroids...
    Asteroid a = asteroids.get(i); // ...get asteroids info
    if (a.checkCollision(playerShip) == true) { // if collision happended....
      playerShip.nbLifes = playerShip.nbLifes - 1; // remove one life
      if (playerShip.nbLifes == 0) { // if nb of space lifes == 0 ---> end game
        end = new EndGame(points);
        asteroidFrequency = 100;// restart Frequency   
      } else { // if still lifes available ---> reset spaceship position to 0.
        playerShip.resetPosition();
      }
    }


    for (int b = 0; b < bullets.size(); b++) { // for all current bullets...
      Bullet bullet = bullets.get(b); // ...get bullets info
      if (a.checkCollision(bullet) == true) { // if collision happended....
        points++; // add one pt

        asteroids.remove(a); // asteroid has been destroyed --> removed it from array
        bullets.remove(bullet); // remove bullet from array

        // avoid memory errors
        i--;
        b--;
        // clip indexes to 0 --> negative index array does not exist
        if (i < 0) i = 0; 
        if (b < 0) b = 0;
      }
    }
  }
}


// Action when key pressed
void keyPressed() {
  if (keyCode == UP || key == 'w' || key == 'W') {
    playerShip.upPressed = true;
  } else if (keyCode == DOWN || key == 's' || key == 'S') {
    playerShip.downPressed = true;
  } else if (keyCode == LEFT || key == 'a' || key == 'A') {
    playerShip.leftPressed = true;
  } else if (keyCode == RIGHT || key == 'd' || key == 'D') {
    playerShip.rightPressed = true;

    // } else if (key == 'p' || key == 'P') {
  } else if (key == ' ' || keyCode == SHIFT) {
    Bullet b = new Bullet(playerShip);
    bullets.add(b);
  }
}

// Action when key released
void keyReleased() {
  if (keyCode == UP || key == 'w' || key == 'W') {
    playerShip.upPressed = false;
  } else if (keyCode == DOWN || key == 's' || key == 'S') {
    playerShip.downPressed = false;
  } else if (keyCode == LEFT || key == 'a' || key == 'A') {
    playerShip.leftPressed = false;
  } else if (keyCode == RIGHT || key == 'd' || key == 'D') {
    playerShip.rightPressed = false;
  }
}


// Mouse event handler ---> for end game menu
void mousePressed() {
  if (end != null && end.mouseOverButton() == true) { // if end menu
    resetGame();
  }
  if (start != null && start.mouseOverButton() == true) { // if start menu
    gameStart = true;
  }
}

// Reset the game instead of killing & starting the app each time.....
void resetGame() {
  stars.clear();
  bullets.clear();
  asteroids.clear();
  playerShip = new Ship();
  end = null;
  points = 0;
}
