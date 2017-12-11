import ddf.minim.*;
import ddf.minim.analysis.*;
 
Minim minim;
AudioPlayer song;
FFT fft;

int numFrames = 6;
int currentFrame = 0;
PImage[] images = new PImage[numFrames];
PImage[] images2 = new PImage[numFrames];


float s=5;
float sf=0.25;
float sum;

void setup()
{
  size(800, 800);
  
  frameRate(6);
      images[0]  = loadImage("0.gif");
      images[1]  = loadImage("1.gif"); 
      images[2]  = loadImage("2.gif");
      images[3]  = loadImage("3.gif"); 
      images[4]  = loadImage("4.gif");
      images[5]  = loadImage("5.gif"); 
      
      images2[0]  = loadImage("01.gif");
      images2[1]  = loadImage("11.gif");
      images2[2]  = loadImage("21.gif");
      images2[3]  = loadImage("31.gif");
      images2[4]  = loadImage("41.gif");
      images2[5]  = loadImage("51.gif");
  
  minim = new Minim(this);
  song = minim.loadFile("let.mp3", 1024);
  song.play();
  fft = new FFT(song.bufferSize(), song.sampleRate());
}
 
void draw()
{
  background(0);
  fft.forward(song.mix);
  
  fill(#7366BD);
  
 /* stroke(255, 0, 0, 128);
  for(int i = 0; i < fft.specSize(); i++)
  {
    line(i, height, i, height - fft.getBand(i)*4); 
  }
 
  stroke(255);
  for(int i = 0; i < song.left.size() - 1; i++)
  {
    line(i, 50 + song.left.get(i)*250, i+1, 50 + song.left.get(i+1)*250);
    line(i, 50 + song.right.get(i)*250, i+1, 50 + song.right.get(i+1)*250);
  }
  */
  currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
  
  image(images[(currentFrame) % numFrames], 30, 100,  width/5, height/5);
  
  image(images2[(currentFrame) % numFrames], 0, 0);
  
  image(images[(currentFrame + 3) % numFrames], 600, 100,  width/5, height/5);
   
  }
  