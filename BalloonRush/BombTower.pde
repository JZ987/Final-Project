class BombTower extends Tower{
  
  public static final String image = "Images/Bomb_Tower.png";
  BombTower(){
    // int w, int h, int cost, float atkSpeed, Projectile ammo, String m
    super(60, 75, 1600, 0.75, new Projectile(0), image);
  }
  
  void shoot() {
  }
  
  void die() {
  }

}