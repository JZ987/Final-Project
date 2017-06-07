class FreezeTower extends Tower{
  
  private float atkSpeed,  currentX, currentY;
  private int w, h, range, cost;
  private Projectile ammunition;
  private PImage freezeTower;
  
  FreezeTower(){
    atkSpeed = 1;
    cost = 2500;
    w = 47;
    h = 50;
    range = 150;
    freezeTower = loadImage("Images/Ice_Tower.png");
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
    return freezeTower;
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