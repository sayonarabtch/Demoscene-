
class Sneg {
  float x, y, s;
  color w;
  Sneg(float _x, float _y, float _s, color _w){
    this.x = _x;
    this.y = _y;
    this.s = _s;
    this.w = _w;
  }
  void draw() {
    ellipse(this.x,this.y+cos(this.x/2),this.s,this.s);
   fill(this.w);
   if(this.y>=height){this.y=0;}
  }
  
  void down(float _s) {
    this.y+=_s;
  }
}