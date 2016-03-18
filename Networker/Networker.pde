  
//import processing.sound.*;
//WhiteNoise noise;
Dots d [];  // this is the array that contains where the points are that are being drawn
int t = 300; // 
float c = 30; // the range. If individual points are in this range or radius, then draw a line from point to point
float weight = 0.6;
int yesno = 0; // i dont think I need this
int clearboard = 0; // doesnt currently work

void setup() {
 fullScreen(P3D);
  // size(1800, 800, P3D);
  //size(1800, 800);
  background(255);
  d = new Dots[t];
  for (int i = 0; i < t; i++) {
    d[i] = new Dots(0, 0);
  }
  
  println("Done setup");

}

void draw() {
  fill(0, 40); // the background. ( colour, transperancy)
  rect(0, 0, width, height);  // the background is black, and it makes change more smoothe on the canvas
  strokeWeight(weight);  // changes the thickness of the line
  float range = dist(mouseX, mouseY, pmouseX, pmouseY);
  if (mousePressed && range > 40) {
    addToArray();
  }
  c = (0.1 * mouseX);
 // noise.amp(c);
  weight =(0.003  * mouseY); // thickness of the line
  makeWeb(); // makes the lines
  backing(); // i dont think i need this
}

/*
I needed a section that would actually update the array. THis part I struggled on the most, but here it is. 
It turned out what I was doing wrong was in my syntax. I was trying to make the array change points
all within a for() loop. What that did was assign all the points in the array to whatever i did in the loop. 
I learned, now I need to make a broken telephone program basically. 
*/

void addToArray() {
  for (int i = 0; i < (d.length - 1); i++) {
    d[i] = d[i+1]; // this updates the array's points to fill up my array. 
  }
  println("added to array");
  d[d.length - 1] = new Dots(mouseX, mouseY); 
}


/*
This function has two for() loops. The reason why is I needed to look up inputs for input A and input D for the lines
so the same array is looked up twice, and lookup A compares to lookup B 

The range or radius to make lines comes into play here.

*/


void makeWeb() {
  for (int i = 0; i < (d.length-1); i++) {
    for (int j = 1; j < d.length; j++) {
      if (dist(d[i].x, d[i].y, d[j].x, d[j].y) < c) {
        float rc = random(0, 254);
        float rw = random(0, 0.0001) * 254;

        stroke(rw, rw, rc);
        line(d[i].x, d[i].y, d[j].x, d[j].y);
        rc = random(0, 254);
        rw = random(0, 0.0001) * 254;
      }
    }
  }
}

/*
Welome to the dot maker!
it makes points in the array. 
I think its pretty.
*/

class Dots {
  int x;
  int y;

  Dots(int _x, int _y) {
    colourize(); // each line each time its rendered gets a random blue value
    x = _x;
    y = _y;
  }
}

//generates the colours for the picture. pretty lights.
void colourize() {
  int redness = mouseX - pmouseX;
  stroke(200, 200, 200);
}

//this is the big blue circle

void backing() {
  fill(100, 100, 244);
  ellipse(700, 300, 400, 400);
}