class Balloon{

  float speed, dx, dy;
  int health, w, h, xcor, ycor;
  PImage pic;
  Tile currTile, nextTile;
  Direction d;

  Balloon(int maxHealth){
    health = maxHealth;
    w = 30;
    h = 40;
    dx = 0;
    dy = 0;
    xcor = 150;
    ycor = currentMap.getStartRow()*50;
    currTile = currentMap.getTile(xcor,ycor);
    d = currentMap.getNextDirection(currTile, null);
    nextTile = currentMap.getNextTile(currTile, null);
    switch (d){
      case NORTH:
        moveUp();
        break;
      case EAST:
        moveRight();
        break;
      case WEST:
        moveLeft();
        break;
      case SOUTH:
        moveDown();
        break;
      default:
        println("this should not be reached");
    }
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
      speed = 1.5;
    }else if(health == 2){
      speed = 2.5;
    }else if(health == 3){
      speed = 3.5;
    }else if(health == 4){
      speed = 4;
    }else if(health == 5){
      speed = 5;
    }else if(health == 10){
      speed = 5;
    }else if(health == 20){
      speed = 3;
    }else if(health == 100){
      speed = 1;
    }
  }

  void display(){
    getImage();
    image(pic, (50 - w)/2 + xcor, (50 - h)/2 + ycor, w, h);
  }

  void update(){
    getSpeed();
    currTile = currentMap.getTile(xcor,ycor);
    if (currTile == null) {
      return;
    }
    if (currTile.isSameTile(currentMap.endTile)) {
      BalloonRush.health -= health;
      health = 0;
      return;
    }
    if (currTile.isSameTile(nextTile) && abs(ycor - currTile.ycor) < 10) {
      nextTile = currentMap.getNextTile(currTile, d);
      d = currentMap.getNextDirection(currTile, d);
      switch (d) {
        case NORTH:
          moveUp();
          break;
        case EAST:
          moveRight();
          break;
        case WEST:
          moveLeft();
          break;
        case SOUTH:
          moveDown();
          break;
        default:
          println("this should not be reached");
      }
    }
    xcor += dx * speed;
    ycor += dy * speed;
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
  
  boolean shouldDie(){
    return health <= 0 || xcor > width || xcor < 0 || ycor > height || ycor < 0;
  }
}