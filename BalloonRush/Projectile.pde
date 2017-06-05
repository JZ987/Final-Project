class Projectile{
  
  private float velocity, currentX, currentY;
  private int dx, dy, w, h;
  private PImage pic;
  
  Projectile(float v){
    velocity = v;
  }
  
  PImage getPic(){
    return pic;
  }
  
  float getX(){
    return currentX + dx;
  }
  
  float getY(){
    return currentY + dy;
  }
  
  int getWidth(){
    return w;
  }
  
  int getHeight(){
    return h;
  }  
}