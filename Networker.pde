  
//import processing.sound.*;
//WhiteNoise noise;
Dots d [];
Mount mountains[];
int t = 300;
float c = 30;
float weight = 0.6;
int yesno = 0;
int clearboard = 0;

void setup() {
 fullScreen(P3D);
  // size(1800, 800, P3D);
  //size(1800, 800);
  background(255);
  d = new Dots[t];
  for (int i = 0; i < t; i++) {
    d[i] = new Dots(0, 0);
  }
  mountains = new Mount[20];
  for (int k = 0; k < 20; k ++) {
    mountains[k] = new Mount (k);
  }
  println("Done setup");
  instructions();
}

void draw() {
  fill(0, 40);
  rect(0, 0, width, height);
  strokeWeight(weight);
  float range = dist(mouseX, mouseY, pmouseX, pmouseY);
  if (mousePressed && range > 40) {
    addToArray();
  }
  c = (0.1 * mouseX);
 // noise.amp(c);
  weight =(0.003  * mouseY);
  makeWeb();
  backing();
}

void addToArray() {
  for (int i = 0; i < (d.length - 1); i++) {
    d[i] = d[i+1];
  }
  println("added to array");
  d[d.length - 1] = new Dots(mouseX, mouseY);
}

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
  bigLines();
  keyPressed();
  mountains();
}

class Dots {
  int x;
  int y;

  Dots(int _x, int _y) {
    colourize();
    x = _x;
    y = _y;
  }
}

void colourize() {
  int redness = mouseX - pmouseX;
  stroke(200, 200, 200);
}


void keyPressed() {
  if (key == 'v') {
    c = 150;
  } else if (key == 'b') {
    c = 50;
  } else if (key == 'r') {
    c = 80;
  }


  if (key == ' ' && yesno == 0) {
    clearboard = 1;
    yesno = 1;
  } else if (key == ' ' && yesno == 1) {
    clearboard = 0;
    yesno = 0;
  }
}
void bigLines() {

  if (c > 80) {
    strokeWeight(2);
  } else if (c < 70) {
    strokeWeight(0.5);
  } else {
    strokeWeight(1);
  }
}

void backing() {
  fill(100, 100, 244);
  ellipse(700, 300, 400, 400);
}

void instructions() {
  textSize(24);
  fill(100, 100, 255);
  text("Press V for thicker lines", 500, 100);
  text("press B for thinner lines", 500, 250);
  text("press R to revert to normal", 500, 400);
}

void mountains() {
}


class Mount {
  float xpos;
  float yrand;
  int index;
  Mount ( int Index ) {
    index = Index;
    xpos = index * (width / 20);
    yrand = height - (100 * (random(0.1, 2)) + (mouseY * (random(0.1, 2))));
  }
}