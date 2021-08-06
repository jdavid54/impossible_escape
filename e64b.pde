int N;  // flip case with left click
int T;  // target case with right click
int P;  // natural parity

T = 0;  // target = 0
int tx;
int ty;
boolean flip;  // show only if corrct flip

boolean someMode = false;
boolean[] c = new boolean[64];

void setup() {
	size(321, 352, P2D);
	RESET();
	NBDRAW();
	draw_bits();
	calc_parity() 
}

void draw() {

 }
 
void mouseClicked() {
  //NBDRAW();
  if (mouseButton==RIGHT)
  {
    int cx;
    int cy;
	// get mouse coordinates   
	cx=int(mouseX / 40);
    cy=int(mouseY / 40);
	tx=cx;
 	ty=cy;
	flip=false;

  if (cx<=7 && cy<=7) {
	// coordinates up left corner
	T = (cy*8)+cx;

	NBDRAW();
	draw_bits();
	calc_parity();

	// color red
    stroke(255,0,0);
    strokeWeight(1);

	// draw empty square
    fill(0,0,0,0);

	// mark the case with red
    rect(cx*40,cy*40,40,40);
	
	// text color and size
    fill(0,255,0);
    textSize(12);

	// case number in binary on left
    textAlign(LEFT);
    text("Target = "+binary(T,6),0,331);  // value, x, y

	// case number in decimal on right
    textAlign(RIGHT);
	// color green
    fill(0,255,0);
    text(T,321,331);	
	}
  }

  if (mouseButton==LEFT)
  {
    int cx;
    int cy;
	// get mouse coordinates   
	cx=int(mouseX / 40);
    cy=int(mouseY / 40);
	 
  if (cx<=7 && cy<=7) {
	// coordinates up left corner
	N = (cy*8)+cx;
	//println(c[N]);
	c[N] = !c[N];

	if (N==P) {flip=true;}

	//println(c[N]);
	NBDRAW();
	draw_bits();
	calc_parity();
	
	// color red
    stroke(255,0,0);
    strokeWeight(1);

	// draw empty square
    fill(0,0,0,0);

	// mark the case with red
    rect(tx*40,ty*40,40,40);

	// text color and size target
    fill(255,255,255);
    textSize(12);
    }
  }
}

void draw_bits(){	
for (int i = 0; i <=7; i++) {
      for (int j = 0; j <=7; j++) {		
		if (c[(j*8)+i]==true) {
			if (((j*8+i) & 1))	{ 				
				fill(255,0,0);
		        ellipse((i*40)+5,(j*40)+5,8,8);}
			if (((j*8+i) & 2))	{ 				
				fill(0,255,0);
		        ellipse((i*40)+15,(j*40)+5,8,8);}
			if (((j*8+i) & 4))	{ 				
				fill(0,0,255);
		        ellipse((i*40)+25,(j*40)+5,8,8);}
			if (((j*8+i) & 8))	{
				fill(255,255,0);
		        ellipse((i*40)+5,(j*40)+15,8,8);}
			if (((j*8+i) & 16))	{
				fill(255,0,255);
		        ellipse((i*40)+15,(j*40)+15,8,8);}
			if (((j*8+i) & 32))	{
				fill(0,255,255);
		        ellipse((i*40)+25,(j*40)+15,8,8);}

				fill(255,255,255);
	textSize(12);
	textAlign(LEFT);
	text(j*8+i,(i*40)+5,(j*40)+35);
			}
}
}
}


void draw_circle(i,j) {

if (c[(j*8)+i]==true) {
		   fill(132,132,164);
           ellipse((i*40)+20,(j*40)+20,30,30);
            }	
}

void NBDRAW()
{
	 background(0,0,0,0);
	// grid color and thickness
	 stroke(255,255,255);
	 strokeWeight(1);

	// draw grid with 64 cases
    for (int i = 0; i <=7; i++) {
      for (int j = 0; j <=7; j++) {
		   if (((i % 2==0) && (j % 2==0) )||((i % 2==1) && (j % 2==1) ))
				{
				// color dark blue 
				fill(32,32,64);} 
				else  		
				{
				// color green
				fill(132,132,64);
				}
				// case i, j, size 40x40
				rect((i*40),(j*40),40,40);			
				//draw_circle(i,j);					
      }
    }
//draw_bits();
//calc_parity();

	// text color and size
    fill(0,255,0);
    textSize(12);

	// case number in binary on left
    textAlign(LEFT);
    text("Target = "+binary(T,6),0,331);  // value, x, y

	// case number in decimal on right
    textAlign(RIGHT);
	// color green
    fill(0,255,0);
    text(T,321,331);	
}

void calc_parity() {
	//int P;
	P = 0;
	// calc natural parity P by xoring case number 
	// with boolean true over all the grid
	for (int i = 0; i <=63; i++) {
		if (c[i]) {P=P ^ i; }
	  }
	P=P^T;  //add target address
	//print(P);
	textSize(12);
	textAlign(LEFT);
	// color green
    fill(0,255,0);
    text("Flip = "+binary(P,6),0,350);
	textAlign(RIGHT);
	// color green
    //fill(0,255,0);
    text(P,321,350);
	if (flip || P==0) {
		textAlign(LEFT);
		// color white
		fill(255,255,255);
		text("Hidden target="+binary(P^T,6),120,350);
		flip=false;
		}
}

void RESET()
{
  for (int i = 0; i <=63; i++) {
    if (random(1)>.5) {c[i]=true;} else {c[i]=false;}
  }
}