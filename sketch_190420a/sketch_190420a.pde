void setup(){
  fullScreen();
  background(25,2,160);
}
void draw(){
  ellipseMode(CENTER);
 
  rectMode(CENTER);
   fill(0,150,0);
  rect(width/2,height/2+200,width,height-200);
  rectMode(CORNER);
   fill(120,65,20);
  rect(width/2-250,height/2-200,500,400);
  fill(200,0,0);
  triangle(width/2-250,height/2-200,width/2+250,height/2-200,width/2,height/2-300);
  rectMode(CENTER);
  fill(0,0,200);
  rect(width/2-100,height/2-50,100,100); //okna
  rect(width/2+100,height/2-50,100,100);
  fill(100,100,100);
  rect(width/2,height/2+125,75,150); //drzwi
  
  fill(120,65,20);  //dfrzewo lewe{
  rect(200,height/2+200,50,300);
  fill(0,200,0);
  ellipse(200,height/2,300,300);//}
  
   fill(120,65,20); //drzewo prawe{
  rect(width-200,height/2+200,50,300); 
  fill(0,200,0);
  ellipse(width-200,height/2,300,300); //}
    fill(240,240,0);
   ellipse(1300,75,300,300); //slonce
  //kot
  fill(200);
  ellipse(830,115,10,30);
  ellipse(780,115,10,30);
  ellipse(800,100,100,30);
  ellipse(760,90,30,50);
  ellipse(785,115,10,30);
  
  ellipse(835,115,10,30);
 
  
  fill(0);
  ellipse(755,85,10,10);
  ellipse(765,85,10,10);
  fill(240);
  ellipse(770,65,10,20);
  ellipse(750,65,10,20);
  //ogon
  ellipse(850,90,10,30);
  
  
  
}
