int N;
boolean someMode = false;


void setup() {
  size(321, 352, P2D);
  NBDRAW();
}

void draw() {


 }
 
 void mouseClicked() {
  NBDRAW();
  if (mouseButton==LEFT)
  {
    int cx;
    int cy;
   cx=int(mouseX / 40);
   cy=int(mouseY / 40);
   if (cx<=7 && cy<=7) {N=(cy*8)+cx;
                        stroke(255,0,0);
                        strokeWeight(1);
                        fill(0,0,0,0);
                        rect(cx*40,cy*40,40,40);
                        fill(191,192,192);
                        textSize(32);
                        textAlign(LEFT);
                        text(binary(N,6),0,350);
                        textAlign(RIGHT);
                        fill(255,0,0);
                        text(N,321,350);
                        }
  }
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
 
}