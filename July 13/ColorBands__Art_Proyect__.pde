 void setup(){
 size( 1000,500); 
 }
 int BandMov = -150;
 float  RandomColor1 = random(100,255);
 float  RandomColor2 = random( 200,255); 
 float RandomColor3= random( 150, 200);
 
void draw(){
background (255,255,255);
  // Colorchange 1
  if ( BandMov >= 100){
    background ( RandomColor1, RandomColor2,RandomColor3);
   }
   // Colorchange 2
    if ( BandMov >= 350){
    background ( RandomColor3, RandomColor1,RandomColor2);
    }
    // Colorchange 3
      if ( BandMov >= 600){
    background ( RandomColor2, RandomColor3,RandomColor1);
    }
    // Colorchange 4
      if ( BandMov >= 850){
    background ( RandomColor1, RandomColor2,RandomColor3);
    }
    // Colorchange 5
      if ( BandMov >= 1100){
    background ( RandomColor3, RandomColor2,RandomColor1);
    }
    // Colorchange 6
      if ( BandMov >= 1350){
    background ( RandomColor2, RandomColor3,RandomColor1);
    }
    // Colorchange 7
      if ( BandMov >= 1600){
    background ( RandomColor1, RandomColor2,RandomColor3);
    }
    // Colorchange 8
      if ( BandMov >= 1850){
    background ( RandomColor3, RandomColor1,RandomColor2);
    }
  
//Moving band 
  push();
   scale(0.6);
  translate(BandMov,0);
rotate( radians(10));
  for(int var = 0; var < 400 ; var = var + 5){
  line( var, 0, var + 200 , var + 400);
  }
  pop();

//StaticBand 1
  push();
  scale(0.6);
  translate(100,0);
rotate( radians( 10));
  for(int var = 0; var < 400 ; var = var + 5){
  line( var, 0, var + 200 , var + 400);
  }
  pop();
//StaticBand 2
  push();
  scale(0.6);
  translate(350,0);
rotate( radians( 10));
  for(int var = 0; var < 400 ; var = var + 5){
  line( var, 0, var + 200 , var + 400);
  }
  pop(); 
//StaticBand 3
  push();
  scale(0.6);
  translate(600,0);
rotate( radians( 10));
  for(int var = 0; var < 400 ; var = var + 5){
  line( var, 0, var + 200 , var + 400);
  }
  pop(); 
//StaticBand 4
  push();
  scale(0.6);
  translate(850,0);
rotate( radians( 10));
  for(int var = 0; var < 400 ; var = var + 5){
  line( var, 0, var + 200 , var + 400);
  }
  pop(); 
 //StaticBand 5
  push();
  scale(0.6);
  translate(1100,0);
rotate( radians( 10));
  for(int var = 0; var < 400 ; var = var + 5){
  line( var, 0, var + 200 , var + 400);
  }
  pop();
//StaticBand 6  
  push();
  scale(0.6);
  translate(1350,0);
rotate( radians( 10));
  for(int var = 0; var < 400 ; var = var + 5){
  line( var, 0, var + 200 , var + 400);
  }
  pop();
//StaticBand 7   
  push();
  scale(0.6);
  translate(1600,0);
rotate( radians( 10));
  for(int var = 0; var < 400 ; var = var + 5){
  line( var, 0, var + 200 , var + 400);
  }
  pop();
//StaticBand 8  
  push();
  scale(0.6);
  translate(1850,0);
rotate( radians( 10));
  for(int var = 0; var < 400 ; var = var + 5){
  line( var, 0, var + 200 , var + 400);
  }
  pop(); 
 
  // Band movement
  BandMov =  BandMov + 25; 

  }
