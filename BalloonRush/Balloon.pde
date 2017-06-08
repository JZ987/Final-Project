class Balloon{
 
  float speed;
  int health, w, h, spawnPoint;
  PImage pic;
  PVector position, velocity;
  
  Balloon(int maxHealth){
    health = maxHealth;
    w = 30;
    h = 40;
    position = new PVector(width/2, random(100, 801));
    velocity = PVector.random2D();
    setSpeed();
  }
  
  void display(){
    getImage();
    //image(pic, (50 - w)/2 + currentX, (50 - h)/2 + currentY, w, h);
    image(pic, position.x-w, position.y-h, w, h);
  }
  
  void update(){
    position.add(velocity);
    //println(position);
  }
  
  void setHealth(int health){
    this.health = health;
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
  
  void setSpeed(){
    if(health == 1){
      velocity.mult(1);
    }else if(health == 2){
      velocity.mult(1.5);
    }else if(health == 3){
      velocity.mult(1.75);
    }else if(health == 4){
      velocity.mult(2);
    }else if(health == 5){
      velocity.mult(2.5);
    }else if(health == 10){
      velocity.mult(2.5);
    }else if(health == 20){
      velocity.mult(1.5);
    }else if(health == 100){
      velocity.mult(1);
    }
  }
  
  boolean shouldDie(){
    return health <= 0 || position.x > 900 || position.x < 0 || position.y > 900 || position.y < 0;
  }
}