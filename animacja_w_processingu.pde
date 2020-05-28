float ax, ay;
float bx, by;
float cx, cy;
float dx, dy;
float ex, ey;
float fx, fy;
float gx, gy;
float hx, hy;
float ix, iy;
float x, y;
float yhjk;
float mnoz=0.005;
int ab=0;
int licznik=0;
boolean ok=true;

void setup() {
  yhjk=0.1;
  colorMode(HSB);
  fullScreen();
  ax = 0;
  ay = 0;
  bx = 0;
  by = height;
  cx = width;
  cy = height;
  dx = width;
  dy = 0;
  ex=width/2;
  ey=0;
  fx=width/2;
  fy=height/2;
  gx=width/2;
  gy=height;
  hx=0;
  hy=height/2;
  ix=width;
  iy=height/2;
  x = random(width);
  y = random(height);
  background(0);
  stroke(255);
  strokeWeight(8);
  point(ax, ay);
  point(bx, by);
  point(cx, cy);
  point(dx, dy);
  point(ex, ey);
  point(fx, fy);
  point(gx, gy);
  point(hx, hy);
  point(ix, iy);
}

void draw() {
  fill(255);
  textSize(32);
  //text(yhjk,width/2,height/2);
  noStroke();
  
  fill(0,10);
  rect(0,0,width,height);
  
  stroke(ab++, 255, 255, 100);
  if (ab>255) ab=0;

  for (int i = 0; i < 10000; i++) {

    strokeWeight(4);
    point(x, y);


    int r = floor(random(9));
    if (r == 0) {

      x = lerp(x, ax, yhjk);
      y = lerp(y, ay, yhjk);
    } else if (r == 1) {

      x = lerp(x, bx, yhjk);
      y = lerp(y, by, yhjk);
    } else if (r == 2) {

      x = lerp(x, cx, yhjk);
      y = lerp(y, cy, yhjk);
    } else if (r == 3) {

      x = lerp(x, dx, yhjk);
      y = lerp(y, dy, yhjk);
    } else if (r == 4) {

      x = lerp(x, ex, yhjk);
      y = lerp(y, ey, yhjk);
    }
    //else if (r == 5) {

    //  x = lerp(x, fx, yhjk);
    //  y = lerp(y, fy, yhjk);
    //}
    else if (r == 6) {

      x = lerp(x, gx, yhjk);
      y = lerp(y, gy, yhjk);
    } else if (r == 7) {

      x = lerp(x, hx, yhjk);
      y = lerp(y, hy, yhjk);
    } else if (r == 8) {

      x = lerp(x, ix, yhjk);
      y = lerp(y, iy, yhjk);
    }
  }


  yhjk+=mnoz;
  if (yhjk>1.8 || yhjk<0.1)mnoz*=-1;
}
 void mouseWheel(MouseEvent event){
   ab += event.getCount()*100;
   yhjk-=mnoz;
 }
