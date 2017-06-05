class FreezeTower extends Tower{
  
  private float atkSpeed,  currentX, currentY;
  private int w = 70, h = 75, cost;
  private Projectile ammunition;
  private PImage pic = loadImage("Images/Ice_Tower.png");;
  
  FreezeTower(){
    atkSpeed = 1;
    cost = 2500;
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