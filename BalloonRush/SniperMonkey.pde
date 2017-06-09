class SniperMonkey extends Tower{
  
  SniperMonkey(){   
    super(BalloonRush.sniperMonkey, 30, 50, 1200, width*2, 45);
  }
  
  void shoot(PVector target){
    if(count%atkSpeed == 0){
      if(BalloonRush.balloons.size() != 0){
        BalloonRush.balloons.get(0).health--;
        BalloonRush.currency++;
      }
      count++;
    }
    count++;
  }
}