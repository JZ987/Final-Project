class FreezeTower extends Tower{
  
  FreezeTower() {
    // int w, int h, int cost, float atkSpeed, Projectile ammo, String m
    super(70, 75, 2500, 1, new Projectile(0), "Images/Ice_Tower.png");
  }
  
  void shoot(){
  }
  
  void die(){
  }
}