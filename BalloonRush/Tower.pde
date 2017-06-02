abstract class Tower{
   
  private float atkSpeed, cost, currentX, currentY;
  private Projectile ammunition;
  
  abstract void shoot();
  abstract void die();
  abstract PImage getPic();
  abstract float getX();
  abstract float getY();
  abstract float getWidth();
  abstract float getHeight();
}