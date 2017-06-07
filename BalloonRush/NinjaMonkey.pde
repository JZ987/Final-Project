class NinjaMonkey extends Tower{
  
  private float atkSpeed,  currentX, currentY;
  private int w, h, range, cost;
  private Projectile ammunition;
  private PImage ninjaMonkey;
  
  NinjaMonkey(){
    atkSpeed = 1.5;
    cost = 2000;
    w = h = 50;
    range = 400;
    ninjaMonkey = loadImage("Images/Ninja_Monkey.png");
  }
  
  void shoot(){
    
  }
  
  void die(){
      
  }
  
  void setPosition(float x, float y){
    currentX = x;
    currentY = y;
  }
  
  int getCost(){
    return cost;
  }
  
  PImage getPic(){
    return ninjaMonkey;
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