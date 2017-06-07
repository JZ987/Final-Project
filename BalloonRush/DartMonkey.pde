class DartMonkey extends Tower{
  
  private float atkSpeed, currentX, currentY;
  private int w, h, range, cost;
  private Projectile ammunition;
  private PImage dartMonkey;
  
  DartMonkey(){
    atkSpeed = 1;
    cost = 500;
    w = h = 50;
    range = 300;
    dartMonkey = loadImage("Images/Dart_Monkey.png");
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
    return dartMonkey;
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