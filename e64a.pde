int N;

boolean[] c = new boolean[100];
boolean someMode = false;


void setup() {
  size(800, 400, P2D);
  RESET();
  NBDRAW();
}

void draw() {


 }
 
 void mouseClicked() {
  
  if (mouseButton==LEFT && mouseX<=321)
  {
    int cx;
    int cy;
   cx=int(mouseX / 40);
   cy=int(mouseY / 40);
   if (cx<=7 && cy<=7) {N=(cy*8)+cx;
                                   }
  }
  
  if (mouseButton==LEFT && mouseX>=400)
  {
   int M;
   int mx;
   int my;
   
   mx=int((mouseX-400) / 40);
   my=int(mouseY / 40);
  //rect((mx*40)+400,my*40,40,40);
   if (mx<=7 && my<=7) {M=(my*8)+mx;
                      // println(M);
                       c[M]=!c[M];
                       }
                       
  //buttons
if (mouseButton==LEFT && mouseX>=730 && mouseY<=18)
  {
    RESET();
    NBDRAW();
   }  

if (mouseButton==LEFT && mouseX>=730 && mouseY>=40 && mouseY<=58)
  {
     for (int i = 0; i <=63; i++)  {c[i]=false;}
     NBDRAW();
   }     
   
  }
  
 NBDRAW(); 
}

void NBDRAW()
{
 background(0,0,0,0);

 stroke(255,255,255);
 strokeWeight(1);
    for (int i = 0; i <=7; i++) {
      for (int j = 0; j <=7; j++) {
               if (((i % 2==0) && (j % 2==0) )||((i % 2==1) && (j % 2==1) ))
     { fill(32,32,64);} else  {fill(132,132,64);}
        rect((i*40),(j*40),40,40);
                                  }
                                }
                                
    for (int i = 0; i <=7; i++) {
      for (int j = 0; j <=7; j++) {
               if (((i % 2==0) && (j % 2==0) )||((i % 2==1) && (j % 2==1) ))
     { fill(32,32,64);} else  {fill(132,132,64);}
        rect((i*40)+400,(j*40),40,40);
        if (c[(j*8)+i]==true) {fill(132,132,164);
                               ellipse((i*40)+400+20,(j*40)+20,30,30);
                                }
                                  }
                                }
 //draw source
 int cx;
 int cy;
 cx=N % 8;
 cy=int(N/8);
                        stroke(255,0,0);
                        strokeWeight(2);
                        fill(0,0,0,0);
                        rect(cx*40,cy*40,40,40);
                        fill(191,192,192);
                        textSize(32);
                        textAlign(LEFT);
                        text(binary(N,6),0,350);
                        textAlign(RIGHT);
                        fill(255,0,0);
                        text("Target=" + N,321,350);
                        
//Calc Parity
int P;
P=0;
 for (int i = 0; i <=63; i++) {
    if (c[i]) {P=P ^ i; }
  }
int T;
int tx;
int ty;
T= P^N;
tx=T%8;
ty=int(T/8);

stroke(0,255,0);
                        strokeWeight(2);
                        fill(0,0,0,0);
                        rect((tx*40)+400,ty*40,40,40);
                        fill(191,192,192);
                        textSize(32);
                        textAlign(LEFT);
                        text(binary(P,6),400,350);
                        fill(0,255,0);
                        textAlign(RIGHT);
                        text("Flip="+T,720,350);
                        textAlign(LEFT);
                        text(binary(T,6),400,380);
                        
//buttons
strokeWeight(1);
stroke(255,255,255);
fill(100,100,100);
rect(730,0,69,18,3);
rect(730,40,69,18,3);
fill(255,255,255);
textAlign(CENTER, CENTER);
textSize(15);
text("Random",765,9);
text("Clear",765,49);



}

void RESET()
{
  for (int i = 0; i <=63; i++) {
    if (random(1)>.5) {c[i]=true;} else {c[i]=false;}
  }
}