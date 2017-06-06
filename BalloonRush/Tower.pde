abstract class Tower{
   
  private int w, h, cost, range;
  private float atkSpeed, currentX, currentY;
  private Projectile ammunition;
  private PImage pic;
  
  abstract void shoot();
  abstract void die();
  void setPosition(float x, float y){
    currentX = x;
    currentY = y;
  }
  int getCost(){
    return cost;
  }
  PImage getPic(){
    return pic;
  }
  float getX(){
    return currentX;
  }
  float getY(){
    return currentY;
  }
  int getWidth(){
    return w;
  }
  int getHeight(){
    return h;
  }
  int getRange(){
    return range;
  }
}