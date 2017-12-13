import ddf.minim.*;
import ddf.minim.analysis.*;
 
Minim minim;
AudioPlayer song;
FFT fft;

int a,b;
int snejinok = 20;
int numFrames = 6;
int currentFrame = 0; 
int num = 16;
  
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
  
  
  minim = new Minim(this);
  song = minim.loadFile("let.mp3", 1024);
  song.play();
  fft = new FFT(song.bufferSize(), song.sampleRate());
}
 
void draw()
{
  background(#991000);
  fft.forward(song.mix);
 
  currentFrame = (currentFrame+1) % numFrames;  
  
  image(images[(currentFrame) % numFrames], 30, 100,  width/5, height/5);
  image(images2[(currentFrame) % numFrames], 0, 0);
  image(images[(currentFrame + 3) % numFrames], width - 280, 100,  width/5, height/5);
  
  for(int i=0; i<350; i++){
     mass_snejinok[i].draw();
     mass_snejinok[i].down(random(3));
  }
  
  if(frameCount > 18 ) {
    image(hny[frameCount % 16], 200, 200);
  }
  
  println(frameCount);
} 