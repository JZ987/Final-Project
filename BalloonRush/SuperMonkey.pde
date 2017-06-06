class SuperMonkey extends Tower{
  
  private float atkSpeed,  currentX, currentY;
  private int w = 50, h = 50, range = 100, cost;
  private Projectile ammunition;
  private PImage pic = loadImage("Images/Super_Monkey.png");;
  
  SuperMonkey(){
    atkSpeed = 3;
    cost = 3200;
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