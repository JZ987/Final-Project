class SniperMonkey extends Tower{

  public static final String image = "Images/Sniper_Monkey.png";
  
  SniperMonkey(){
    // int w, int h, int cost, float atkSpeed, float range, Projectile ammo, String m
    super(30, 50, 1200, 0.75, 0, new Projectile(0), image);
  }
  
  void shoot(){
  }
  
  void die(){
  }
}