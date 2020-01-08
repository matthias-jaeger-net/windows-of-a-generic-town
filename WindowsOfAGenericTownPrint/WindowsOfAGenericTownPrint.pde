void modern(float x, float y, int w, int h, PGraphics f) {
  f.beginDraw();
  f.pushMatrix();
  f.rectMode(CENTER);
  f.translate(x - w * 0.5, y - h * 0.5);
  f.fill(random(20));
  f.rect(0, 0, w, h);
  f.fill(random(200, 255));
  f.rect(0, 0, w * 0.8, h * 0.8);
  f.rectMode(CORNER);
  f.popMatrix();
  f.endDraw();
}

void old(float x, float y, int w, int h, PGraphics f) {
  f.beginDraw();
  f.pushMatrix();
  f.rectMode(CENTER);
  f.translate(x - w * 0.5, y - h * 0.5);
  f.fill(random(20));
  f.rect(0, 0, w, h);
  f.fill(random(100, 255));
  f.rect(0, 0, w * 0.4, h * 0.7, w * 0.2, w * 0.2, 0, 0);
  f.rectMode(CORNER);
  f.popMatrix();
  f.endDraw();
}

void old_random(float x, float y, int w, int h, PGraphics f) {
  f.beginDraw();
  f.pushMatrix();
  f.rectMode(CENTER);
  f.translate(x - w * 0.5, y - h * 0.5);
  f.fill(random(20));
  f.rect(0, 0, w, h);
  if (random(0, 1) > 0.4) {
    f.fill(200);
    f.rect(0, 0, w * 0.4, h * 0.7, w * 0.2, w * 0.2, 0, 0);
  }
  f.rectMode(CORNER);
  f.popMatrix();
  f.endDraw();
}

void modern_random(float x, float y, int w, int h, PGraphics f) {  
  f.beginDraw();
  f.pushMatrix();
  f.rectMode(CENTER);
  f.translate(x - w * 0.5, y - h * 0.5);
  f.fill(random(20));
  f.rect(0, 0, w, h);
  if (random(0, 1) > 0.4) {
    f.fill(random(100, 255));
    f.rect(0, 0, random(w * 0.2, w * 0.8), random(h * 0.2, h * 0.8));
  }
  f.rectMode(CORNER);
  f.popMatrix();
  f.endDraw();
}


PGraphics fascade(int w, int h, float r, float c) {
  PGraphics f = createGraphics(w, h);
  f.beginDraw();
  f.noStroke();
  float cellWidth = w / r;
  float cellHeight = h / c;
  float test = random(0, 1);
  for (int j = 0; j < c; j++) {
    for (int i = 0; i < r; i++) {
      if (test > 0 && test < 0.15) {
        modern(i * cellWidth, j * cellHeight, int(cellWidth), int(cellHeight), f);
      }
      if (test > 0.15 && test < 0.30) {
        old(i * cellWidth, j * cellHeight, int(cellWidth), int(cellHeight), f);
      }
      if (test > 0.30 && test < 0.45) {
        old_random(i * cellWidth, j * cellHeight, int(cellWidth), int(cellHeight), f);
      }
      if (test > 0.45 && test < 1.00) {
        modern_random(i * cellWidth, j * cellHeight, int(cellWidth), int(cellHeight), f);
      }
    }
  }
  f.endDraw();
  return f;
}

PGraphics p;

void setup() {
  // A1 300 dpi: 7016 x 9933
  size(7016, 9933, P2D);
  background(255);
  imageMode(CENTER);

  p = createGraphics(width, height, P3D);
  p.beginDraw();
  p.background(random(20));
  for (int i = 0; i < 200; i++) {
    p.pushMatrix();
    p.translate(random(0, width), random(0, height));
    p.rotateY(random(TAU));
    p.rect(0, 0, 100, 100);
    p.image(fascade(int(random(200, 1900)), int(random(200, 1900)), floor(random(3, 20)), floor(random(3, 20))), 0, 0);
    p.popMatrix();
  }
  p.endDraw();
  image(p, width*0.5, height*0.5);
  save("out.png");
  exit();
}
