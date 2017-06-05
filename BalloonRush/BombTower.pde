class BombTower extends Tower{
  
  private float atkSpeed, currentX, currentY;
  private int w = 60, h = 75, cost;
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
}