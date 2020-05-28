import processing.video.*;
import peasy.*;
import java.util.ArrayList;
int puk=0;
PeasyCam cam;
Movie rick;
int skala=16;
boolean ok=true;
boolean zabawa=false;
boolean zabawa1=false;
boolean zabawa2=false;
boolean zabawa3=false;
int mnoz=1;
int h=0;
Blok[][] blok;

void setup() {
  fullScreen(P3D);
  rick=new Movie(this, "Rick.mp4");
  rick.loop();
  cam=new PeasyCam(this, width/2, 200, 20, width/2);
  colorMode(HSB,360);
}
void draw() {
  
  background(0);
  image(rick,0,0);
  rick.loadPixels();
  if (ok==true) {
    wczytaj();
  }
  for (int x=0; x<rick.width; x+=skala) {
    for (int y=0; y<rick.height; y+=skala) {
      int indeks=x+y*rick.width;
      color col=rick.pixels[indeks];
        blok[x][y].Rysuj(col);
        if(zabawa){
         blok[x][y].Zabawa();
        }
       
         else if(zabawa1){
         blok[x][y].Zabawa1();
        }
         else if(zabawa2){
         blok[x][y].Zabawa2();
        }
        else if(zabawa3){
         blok[x][y].Zabawa3();
        }
         else blok[x][y].ZabawaNot();
    }
  }

  text(blok.length, 100, 100);
  text(rick.height,100,200);
}
void wczytaj() {
    blok=new Blok[rick.width][rick.height];
  for (int x=0; x<rick.width; x++) {
    for (int y=0; y<rick.height; y++) {
      blok[x][y]= new Blok(x, y, skala);
      ok=false;
    }
  }
}
void movieEvent(Movie m) {
  m.read();
}
class Blok {
  float x;
  float y;
  int wielkosc;
  int raz;
  float startpozycja;
  int odleglosc;
  int doleglosc;
  int poczwielk;
  color kolor;
  Blok() {
    x=0;
    y=0;
    wielkosc=1;
    raz=0;
    startpozycja=x;
    odleglosc=abs((int)x-rick.width/2);
    doleglosc=abs((int)y-rick.height/2);
    poczwielk=wielkosc;
    
  }
  Blok(int yks, int ygrek, int w) {
    x=yks;
    y=ygrek;
    wielkosc=w;
    raz=0;
    startpozycja=x;
    odleglosc=abs((int)x-rick.width/2);
    doleglosc=abs((int)y-rick.height/2);  
    poczwielk=wielkosc;
}
  void Rysuj(color kol) {
    //noStroke();
    fill(kol+h);
    kolor=kol;
    translate(width/2+x, y);
    box(skala,skala,wielkosc);
    translate(-(width/2+x), -y);
  }
  void Zabawa(){
  if(y>rick.height/2)
  x+=odleglosc*0.01*doleglosc*0.01;
  else x-=odleglosc*0.01*doleglosc*0.01;
  }
    void Zabawa1(){
  if(x>rick.width/2)
  x+=odleglosc*0.01*doleglosc*0.01;
  else x-=odleglosc*0.01*doleglosc*0.01;
  }
    void Zabawa2(){
  if(y*y+x*x<odleglosc*doleglosc)
  x+=odleglosc*0.01*doleglosc*0.01;
  else x+=odleglosc*0.01*doleglosc*0.01;
  }
  void Zabawa3(){
  
  if(hue(kolor)>120 && hue(kolor)<300 && wielkosc<70)
  wielkosc++;
  else if(wielkosc>poczwielk && (hue(kolor)<120 ||   hue(kolor)>300)) wielkosc-=abs(wielkosc-poczwielk)*0.1;
  
  }
  void ZabawaNot(){
  if(x>startpozycja)x-=odleglosc*0.01;
  if(x<startpozycja)x+=odleglosc*0.01;
  if(wielkosc>poczwielk)wielkosc--;
  if(wielkosc<poczwielk)wielkosc++;
  }
}

void keyPressed(){
if(keyCode==UP)skala++;
if(keyCode==DOWN && skala!=1)skala--;
if(keyCode==LEFT)h-=5;
if(keyCode==RIGHT)h+=5;
if(key=='q'){ zabawa=!zabawa;}
if(key=='w'){ zabawa1=!zabawa1;}
if(key=='e'){ zabawa2=!zabawa2;}
if(key=='r'){ zabawa3=!zabawa3;}
if(key=='z'){ stroke(h);}
if(key=='x'){ noStroke();}


}
