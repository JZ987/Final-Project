class BombTower extends Tower{
  
  private float atkSpeed, currentX, currentY;
  private int w = 40, h = 50, range = 10, cost;
  private Projectile ammunition;
  private PImage pic = loadImage("Images/Bomb_Tower.png");
  
  BombTower(){
    atkSpeed = 0.75;
    cost = 1600;
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