abstract class Tower{
   
  private int cost;
  private float atkSpeed, currentX, currentY;
  private Projectile ammunition;
  
  abstract void shoot();
  abstract void die();
  void setPosition(float x, float y){
    currentX = x;
    currentY = y;
  }
  int getCost(){
    return cost;
  }
  abstract PImage getPic();
  abstract float getX();
  abstract float getY();
  abstract float getWidth();
  abstract float getHeight();
}