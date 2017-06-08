class Balloon{
 
  private float speed, dx, dy;
  private int health, w, h, spawnPoint, xcor, ycor;
  //private PImage redBloon, blueBloon, greenBloon, yellowBloon, pinkBloon, rainbowBloon, ceramicBloon;
  private PImage pic;
  private Tile currTile;
  
  Balloon(int maxHealth){
    health = maxHealth;
    w = 30;
    h = 40;
    dx = 1;
    dy = 0;
    //spawnPoint = (int)random(3);
    xcor = 150;
    ycor = currentMap.getStartRow()*50;
    currTile = currentMap.getTile(xcor,ycor);
//    if(spawnPoint == 0){
//      ycor = 100;
//    }else if(spawnPoint == 1){
//      ycor = 500;
//    }else if(spawnPoint == 2){
//      ycor = 800;
//    }
  }
  
  void getImage(){
    if(health == 1){
      pic = BalloonRush.redBloon;
    }else if(health == 2){
      pic = BalloonRush.blueBloon;
    }else if(health == 3){
      pic = BalloonRush.greenBloon;
    }else if(health == 4){
      pic = BalloonRush.yellowBloon;
    }else if(health == 5){
      pic = BalloonRush.pinkBloon;
    }else if(health == 10){
      pic = BalloonRush.rainbowBloon;
    }else if(health == 20){
      pic = BalloonRush.ceramicBloon;
    }else if(health == 100){
      pic = loadImage("Images/MOAB_2.png");
    }
  }
  
  void getSpeed(){
    if(health == 1){
      speed = 1;
    }else if(health == 2){
      speed = 2;
    }else if(health == 3){
      speed = 5;
    }else if(health == 4){
      speed = 10;
    }else if(health == 5){
      speed = 15;
    }else if(health == 10){
      speed = 12.5;
    }else if(health == 20){
      speed = 7.5;
    }else if(health == 100){
      speed = 1;
    }
  }
  
  int getHealth(){
    return health;
  }
  
  float getX(){
    return xcor;
  }
  
  void display(){
    getImage();
    image(pic, (50 - w)/2 + xcor, (50 - h)/2 + ycor, w, h);
  }
  
  void update(){
    getSpeed();
    if(xcor > 1100 || xcor <= 150){
      //moveDown();
      //moveUp();
      //moveRight();
      //moveLeft();
      //dx = -dx;
      //dy = -dy;
    }
    xcor += dx * speed;
    ycor += dy * speed;
  }
  
  void setX(float x){
    xcor += x;
  }
  
  void setY(float y){
    ycor += y;
  }
  
  void setHealth(int health){
    this.health = health;
  }
  
  void moveDown(){
    dx = 0;
    dy = 1;
  }
  
  void moveUp(){
    dx = 0;
    dy = -1;
  }
  
  void moveLeft(){
    dx = -1;
    dy = 0;
  }
  
  void moveRight(){
    dx = 1;
    dy = 0;
  }
}