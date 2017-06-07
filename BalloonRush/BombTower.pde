class BombTower extends Tower{
  
  public static final String image = "Images/Bomb_Tower.png";
  
  BombTower(){
    // int w, int h, int cost, float atkSpeed, float range, Projectile ammo, String m
    super(40, 50, 1600, 0.75, 200, new Projectile(0), image);

  void shoot() {
  }
  
  void die() {
  }
}