class SuperMonkey extends Tower{
  
  private float atkSpeed,  currentX, currentY;
  private int w, h, range, cost;
  private Projectile ammunition;
  private PImage superMonkey;
  
  SuperMonkey(){
    atkSpeed = 3;
    cost = 3200;
    w = h = 50;
    range = 650;
    superMonkey = loadImage("Images/Super_Monkey.png");
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
    return superMonkey;
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