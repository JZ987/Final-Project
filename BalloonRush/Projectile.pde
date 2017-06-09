class Projectile{
  
  PImage pic;
  PVector startingPos, currentPos, velocity, target;
  int range;
  
  Projectile(Tower t, PVector target){
    startingPos = new PVector(t.position.x, t.position.y);
    currentPos = new PVector(startingPos.x, startingPos.y);
    this.target = target;
    this.target.mult(0.1);
    range = t.range;
    pic = BalloonRush.donut;
  }
  
  void display(){
    fill(0, 50);
    ellipse(currentPos.x, currentPos.y, 15, 15);
    noFill();
  }
  
  void update(){
    checkCollision();
    currentPos.add(target);
  }
  
  boolean checkCollision(){
    for(Balloon b : BalloonRush.balloons){
      PVector distanceVect = PVector.sub(new PVector(b.xcor, b.ycor), currentPos);
      float minDistance = distanceVect.mag();
      if(minDistance < 25){
        b.health -= 1;
        BalloonRush.currency+=3;
        return true;
      }
    }
    return false;
  }
  
  boolean shouldDie(){
    PVector distanceStart = PVector.sub(currentPos, startingPos);
    PVector distanceTarget = PVector.sub(currentPos, target);
    float distanceToStart = distanceStart.mag();
    float distanceToTarget = distanceTarget.mag();
    if(distanceToStart > range || checkCollision()){
      return true;
    }
    return false;
  }
}