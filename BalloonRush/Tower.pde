class Tower{
   
  private int w, h, cost, range;
  private float atkSpeed, xcor, ycor;
  private Projectile ammo;
  private PImage pic;
  
  Tower(PImage pic, int w, int h, int cost, int range, float atkSpeed, float currentX, float currentY){
    this.pic = pic;
    this.w = w;
    this.h = h;
    this.cost = cost;
    this.range = range;
    this.atkSpeed = atkSpeed;
    this.currentX = currentX;
    this.currentY = currentY;
  }
    
  void shoot(){};
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
  void display(){
    image(pic, (50 - w)/2 + currentX, currentY, w, h);
  }
  void update(){
    
  }
}