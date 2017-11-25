void setup() {
  size(800,800);
  background(0);
  noStroke();
}
int ax = 500;
int ay = 400;
int bx = 350;
int by = 250;
int cx = 300;
int cy = 450;

void draw() {
  textSize(32);
  fill(255,255,255);
  text("menchú", 10, 30); 
  fill(0, 102, 153);
  text("kincaid", 10, 60);
  fill(222,150,150);
  text("woolf", 10, 90);
  fill(255, 255, 255); 
  ellipse(ax, ay, 300, 300);
  // fill(255);
  // text("kincaid", ax-50, ay);
  fill(0, 102, 153,100);
  ellipse(bx, by, 300, 300);
  // fill(255);
  // text("woolf", bx-50, by);
  fill(222,150,150,100);
  ellipse(cx, cy, 300, 300);
  // fill(255);
  // text("eribon", cx-50, cy);
}