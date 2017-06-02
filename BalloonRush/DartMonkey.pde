class DartMonkey extends Tower{
  
  private float velocity, cost, currentX, currentY;
  private Projectile ammunition;
  private PImage pic;
  
  DartMonkey(float v, float c){
    velocity = v;
    cost = c;
  }
  
  void shoot(){
    
  }
  
  void die(){
      
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
  
  float getWidth(){
    return width;
  }
  
  float getHeight(){
    return height;
  }
}