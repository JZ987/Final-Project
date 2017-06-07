class FreezeTower extends Tower{
  
  public static final String image = "Images/Ice_Tower.png";
  
  FreezeTower() {
    // int w, int h, int cost, float atkSpeed, Projectile ammo, String m
    super(70, 75, 2500, 1, new Projectile(0), image);
  }
  
  void shoot(){
  }
  
  void die(){
  }
\
}