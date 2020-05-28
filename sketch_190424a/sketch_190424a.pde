float kat = 45;
float dziel = 0.1;
int kolor=0;
boolean puls=true;
String text="text";
boolean ok=true;
boolean wolniej=false;
int dim;
void setup(){
  
  fullScreen();
  colorMode(HSB, 360,100,100,100);
  textSize(32);
  background(0,100);
  strokeWeight(5);
  dim=width/2;
  ellipseMode(RADIUS);
  
}

void draw(){
  
   
  noStroke();
  fill(0,5);
  rect(0,0,width,height);
  noFill();
 
  
  
  
  
  
  stroke(kolor,255,255);
  
  
  translate(width/2, height);
  kolor++;
  galazka(400);
  kat+=0.05;
  if(kolor>360) kolor=0;
  
}
void galazka(float dlugosc){
  pushMatrix();
  line(0,0,-dlugosc,0);
  translate(0, -dlugosc);
  if (dlugosc > 4){
    pushMatrix();
    rotate(kat);
    galazka(dlugosc * dziel);
    popMatrix();
  }
  popMatrix();
  pushMatrix();
  line(0,0,dlugosc,0);
  translate(0, dlugosc);
  if (dlugosc > 4){
    pushMatrix();
    rotate(kat);
    galazka(dlugosc * dziel);
    popMatrix();
  }
  popMatrix();
  if(puls && !wolniej){ dziel+=0.0001; if(dziel>0.6) wolniej=true;}
  if(puls && wolniej) dziel+=0.0000001;
  if(dziel>0.66){ puls=false; wolniej=false;} 
  if(!puls && !wolniej){ dziel-=0.0001; if(dziel<0.25) wolniej=true;}
  if(!puls && wolniej) dziel-=0.00001;
  if(dziel<0.2) { puls=true; wolniej=false;}
}
 void mouseWheel(MouseEvent event){
   kat += event.getCount()/5.0;
 }
void Gradient(float x, float y) {
  int radius = dim/2;
  float h = random(0, 255);
  for (int r = radius; r > 0; --r) {
    fill(h, 90, 90);
    ellipse(x, y, r, r);
    h = (h + 1) % 360;
}
}
