class SniperMonkey extends Tower{
  
  private float atkSpeed,  currentX, currentY;
  private int w, h, range, cost;
  private Projectile ammunition;
  private PImage sniperMonkey;
  
  SniperMonkey(){
    atkSpeed = 0.75;
    cost = 1200;
    w = 30;
    h = 50;
    range = 0;
    sniperMonkey = loadImage("Images/Sniper_Monkey.png");
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
    return sniperMonkey;
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