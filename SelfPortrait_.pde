// Self portrait (Me playing piano)

size(850,675);
stroke(0,0,0,7);
//floor
fill(105,30,31);
rect(0,500,1250,275);
//Wall
fill(224,221,201);
rect(0,0,1250,500);

stroke(0,0,0);
//human neck
fill(237, 179, 128);
rect(562,320,26,50);

//face
//nose
triangle(600,290,600,311,612,311);
//head
fill(237, 179, 128);
ellipse(577,300,55,70);
//eyes
fill(255,255,255);
ellipse(595,292,20,20);
fill(0,0,0);
ellipse(600,296,8,8);
//mouth
line(600,320,588,320);
line(588,320,583,315);
//hair
fill(82, 34, 16);
ellipse(558,286,25,50);
ellipse(577,265,50,23);
//left human arm
fill(255,0,0);
ellipse(610,423,90,30);
fill(237, 179, 128);
rect(610,408,30,30);

//human torso

fill(255,0,0);
rect(550,350,50,150,15,15,0,0);


//rigth arm
fill(255,0,0);
ellipse(575,395,40,90);
ellipse(610,428,90,30);
fill(237, 179, 128);
rect(610,413,30,30);

//human and piano legs 
//Mylegs 
fill(0,0,255);
rect(550,477,125,40,20);
rect(650,477,40,142,20);
//piano legs
stroke(0,0,0,7);
fill( 153, 69,5);
rect(625,450,20,175);
rect(625,595,75,30);
 

//Piano body 
stroke(0,0,0,7);
fill( 153, 69,5);
rect(700,275,125,350);
rect(620,400,100,65,50,0,0,5);

//Piano chair
fill( 140, 50,15);
rect(500,510,110,50);
rect(585,550,25,75);
rect(500,550,25,75);
fill( 130, 40,15);
rect(495,500,120,25,7);
