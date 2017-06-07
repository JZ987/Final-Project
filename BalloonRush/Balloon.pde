class Balloon{
 
  private float velocity, currentX, currentY;
  private int health;
  private int w, h, spawnPoint;
  
  Balloon(int maxHealth){
    health = maxHealth;
    w = h = 50;
    spawnPoint = (int)random(3);
    currentX = 200;
    if(spawnPoint == 0){
      currentY = 100;
    }else if(spawnPoint == 1){
      currentY = 500;
    }else if(spawnPoint == 2){
      currentY = 800;
    }
  }
  
  PImage getPic(){
    if(health == 1){
      return loadImage("Images/Red_Bloon.png");
    }else if(health == 2){
      return loadImage("Images/Blue_Bloon.png");
    }else if(health == 3){
      return loadImage("Images/Green_Bloon.png");
    }else if(health == 4){
      return loadImage("Images/Yellow_Bloon.png");
    }else if(health == 5){
      return loadImage("Images/Pink_Bloon.png");
    }else if(health == 10){
      return loadImage("Images/Rainbow_Bloon.png");
    }else if(health == 20){
      return loadImage("Images/Ceramic_Bloon_2.png");
    }else if(health == 100){
      return loadImage("Images/MOAB_2.png");
    }
    return null;
  }
  
  int getWidth(){
    return w;
  }
  
  int getHeight(){
    return h;
  }
  
  float getSpeed(){
    if(health == 1){
      return 1;
    }else if(health == 2){
      return 2;
    }else if(health == 3){
      return 5;
    }else if(health == 4){
      return 10;
    }else if(health == 5){
      return 15;
    }else if(health == 10){
      return 12.5;
    }else if(health == 20){
      return 7.5;
    }else if(health == 100){
      return 1;
    }
    return 0;
  }
  
  float getX(){
    return currentX;
  }
  
  float getY(){
    return currentY;
  }
  
  int getHealth(){
    return health;
  }
  
  void setX(float x){
    currentX += x;
  }
  
  void setY(float y){
    currentY += y;
  }
  
  void setHealth(int health){
    this.health = health;
  }
}