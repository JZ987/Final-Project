class Tower{
   
  int w, h, cost, range, count;
  float atkSpeed, angle;
  Projectile ammo;
  PImage pic;
  PVector position;
  
  Tower(PImage pic, int w, int h, int cost, int range, float atkSpeed){
    this.pic = pic;
    this.w = w;
    this.h = h;
    this.cost = cost;
    this.range = range/2;
    this.atkSpeed = atkSpeed;
    count = 0;
  }
    
  void shoot(PVector target){
    if(count%atkSpeed == 0){
      BalloonRush.projectiles.add(new Projectile(this, target));
      count++;
    }
    count++;
  }
  
  void setPosition(float x, float y){
    position = new PVector(x+25, y+25);
    println(position);
  }
  
  void display(){
    pushMatrix();
    translate(position.x, position.y);
    //println(degrees(angle)+90);
    rotate(angle);
    noFill();
    ellipse(0, 0, range*2, range*2);
    image(pic, -w/2, -h/2, w, h);
    popMatrix();
    //image(pic, (50 - w)/2 + currentX, currentY, w, h);
  }
  
  
  // Idea: follow the first balloon entering range and go to next one when the first one die or leave range;
  void update(){
    for(Balloon b : BalloonRush.balloons){
      checkCollision(b);
    }
    /*
    if(BalloonRush.balloons.size() != 0){
      checkCollision(BalloonRush.balloons.get(0));
    }*/
  }
  
  void checkCollision(Balloon other){
    PVector distanceVect = PVector.sub(other.position, this.position);
    float distanceVectMag = distanceVect.mag();
    //println(distanceVectMag);
    float minDistance = this.range;
    if(distanceVectMag < minDistance){
      angle = distanceVect.heading() + PI/2;
      shoot(distanceVect);
    }
  }
}