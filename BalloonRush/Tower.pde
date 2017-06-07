abstract class Tower{
   
  private int w, h, cost, range;
  private float atkSpeed, xcor, ycor;
  private Projectile ammo;
  private PImage pic;
  
  Tower(int w, int h, int cost, float atkSpeed, float range, Projectile ammo, String m) {
    this.w = w;
    this.h = h;
    this.cost = cost;
    this.atkSpeed = atkSpeed;
    this.ammo = ammo;
    pic = loadImage(m);
  }

  abstract void shoot();
  abstract void die();
  
  void setPosition(float x, float y){
    xcor = x;
    ycor = y;
  }
  PImage getPic() {
    return pic;
  }
  int getCost(){
    return cost;
  }
  float getX(){
    return xcor;
  }
  float getY(){
    return ycor;
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