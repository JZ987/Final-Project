class DartMonkey extends Tower{
  
  private float atkSpeed,  currentX, currentY;
  private int w = 75, h = 75, cost;
  private Projectile ammunition;
  private PImage pic = loadImage("Images/Dart_Monkey.png");;
  
  DartMonkey(){
    atkSpeed = 1;
    cost = 500;
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
}