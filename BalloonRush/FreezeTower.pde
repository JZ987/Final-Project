class FreezeTower extends Tower{

  public static final String image = "Images/Ice_Tower.png";
  
  FreezeTower() {
    // int w, int h, int cost, float atkSpeed, float range, Projectile ammo, String m
    super(47, 50, 2500, 1, 150, new Projectile(0), image);
  }
  
  void shoot(){
  }
  
  void die() {
  }
}