import processing.sound.*;
SoundFile file;
Amplitude amp;


int a,b;
int snejinok = 20;
int numFrames = 6;
int currentFrame = 0; 
int num = 16;

PImage sugrob;
PImage sprite;
PImage jolka;
PImage zvezda;
PImage[] images = new PImage[numFrames];
PImage[] images2 = new PImage[numFrames];
PImage[] hny = new PImage[num];
Sneg[] mass_snejinok = new Sneg[500];

float s=5;
float sf=0.25;
float sum;

void setup()
{
  fullScreen();
  frameRate(6);
  img();
  for(int i=0; i<350; i++){    
    mass_snejinok[i] = new Sneg(random(width), random(height), 3.0, color(int(random(#000000, #ffffff))));    
  }   
  
  file = new SoundFile(this, "let.mp3");
  file.play();
  amp = new Amplitude(this);
  amp.input(file);
}
 
void draw()
{
  background(#991000);
  //println(amp.analyze());
 
  currentFrame = (currentFrame+1) % numFrames;  
  
  image(images[(currentFrame) % numFrames], 30, 100,  width/5, height/5);
  image(images2[(currentFrame) % numFrames], 0, 0);
  image(images[(currentFrame + 3) % numFrames], width - 280, 100,  width/5, height/5);
  
  for(int i=0; i<350; i++){
     mass_snejinok[i].draw();
     mass_snejinok[i].down(random(3));
  }
  
  image(jolka, 430, 100);
  int n = int(amp.analyze() * 30);
  for(int i = 0 ; i < n ; i++){
    image(sprite, 598, 94);    //image(sprite, 598, 94);  
    image(sprite, 646, 59);    //image(sprite, 646, 59);
    image(sprite, 618, 147);    //image(sprite, 618, 147);
    image(sprite, 689, 94);    //image(sprite, 689, 94);
    image(sprite, 672, 147);    //image(sprite, 672, 147);
  }  
  image(zvezda, 620, 85,(width/12.6) , (height/7));
  
  if(frameCount > 18 ) {
    image(hny[frameCount % 16], 500, 200);
  }
  if(mousePressed == true){
    println(mouseX, mouseY); 
  }
  image(sugrob, 0, 0);
  //println(frameCount);
} 