class BombTower extends Tower{
  
  BombTower(){
    // int w, int h, int cost, float atkSpeed, Projectile ammo, String m
    super(60, 75, 1600, 0.75, new Projectile(0), "Images/Bomb_Tower.png");
  }
  
  void shoot() {
  }
  
  void die() {
  }
}