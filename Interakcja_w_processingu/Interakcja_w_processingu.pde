float Odcien=0; 
int Jasnosc=100;
int wj=3;
float wo=0.1;
float iks=600;
float igrek=500;
float mnoznik=1;
Bloczki b;
Zycka z;
boolean gra=true;
PImage rakieta;
PImage asteroida;
PImage zyc;
int zycie=200;
int punkty=0;


ArrayList<Bloczki> bloki= new ArrayList<Bloczki>();
ArrayList<Zycka> zycia= new ArrayList<Zycka>();

void setup(){
colorMode(HSB);
fullScreen();
imageMode(CENTER);
rakieta=loadImage("rakiet.png");
asteroida=loadImage("aster.png");
zyc=loadImage("zycie.png");

}


void draw(){
punkty+=second();
if(gra==true){
background(Odcien,Jasnosc,100);
textSize(32);



for(int i=0;i<15;i++){
b=new Bloczki();
bloki.add(b);
bloki.get(i).wskakuj(); 
bloki.get(i).odcien=i*15;
bloki.get(i).x-=bloki.get(i).odejm;
if(bloki.get(i).x<0)bloki.remove(i);
bloki.get(i).zycie(iks,igrek);

}
for(int i=0;i<2;i++){
z=new Zycka();
zycia.add(z);
zycia.get(i).lec();
zycia.get(i).x-=zycia.get(i).wlewo;
if(zycia.get(i).x<0||zycia.get(i).jest!=true)zycia.remove(i);
zycia.get(i).zycie(iks,igrek);

}

Odcien+=wo;
Jasnosc+=wj;
if(Jasnosc>160 || Jasnosc<100) wj*=-1;
narysuj(iks,igrek);




if(iks>1351)iks=1351;
if(igrek>753)igrek=753;
if(iks<15)iks=15;
if(igrek<10)igrek=15;

if(zycie<1) gra=false;

text("zycie: "+zycie,100,100);
text("punkty: "+punkty/100,100,200);
}
else{
textMode(CENTER);
textSize(72);
text("gameover",width/2-180,height/2);
}
}
void narysuj(float x, float y){
  image(rakieta,x,y,30,30);
  
 

}
void keyPressed(){
  if(keyCode==UP||key=='w') igrek-=1+15*mnoznik;
  if(keyCode==DOWN||key=='s') igrek+=1+15*mnoznik;
  if(keyCode==LEFT||key=='a') iks-=1+15*mnoznik;
  if(keyCode==RIGHT||key=='d') iks+=1+15*mnoznik;
}
void mouseWheel(MouseEvent event){
   mnoznik+=event.getCount()*-0.25;
 }
class Bloczki{
  float x;
  float y;
  float wielkosc;
  float odejm;
  float odcien;
  
  Bloczki(){
  x=width-10;
  y=random(height);
  wielkosc=110;
  odejm=random(8)+2;
  odcien=10;
  
  }
  void wskakuj(){
  tint(odcien,255,255);
  image(asteroida,x,y,wielkosc,wielkosc);
 
  noTint();
  
}
  void zycie(float yks, float ygrek){
  if(dist(yks,ygrek,this.x,this.y)<65) zycie--;

  }
  
}
class Zycka{
   float x;
  float y;
  float wielkosc;
  float wlewo;
  boolean jest;
  Zycka(){
  jest=true;
  x=width-10;
  y=random(height);
  wielkosc=30;
  wlewo=random(8)+2;
  
  }
  void lec(){
  image(zyc,x,y,wielkosc,wielkosc);
  }
  void zycie(float yks, float ygrek){
  if(dist(yks,ygrek,this.x,this.y)<30){zycie+=5;jest=false;}
  
  
  }
}
