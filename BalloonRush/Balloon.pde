class Balloon{
 
  private float velocity, currentX = random(width), currentY = random(height);
  private int health;
  private PImage pic = loadImage("Images/DonutFull.jpg");
  private int w = 50, h = 50;
  
  Balloon(float velocity, int maxHealth){
    this.velocity = velocity;
    health = maxHealth;
  }
  
  PImage getPic(){
    return pic;
  }
  
  int getWidth(){
    return w;
  }
  
  int getHeight(){
    return h;
  }
  
  float getX(){
    return currentX;
  }
  
  float getY(){
    return currentY;
  }
  
  void setX(float x){
    currentX += x;
  }
  
  void setY(float y){
    currentY += y;
  }
}