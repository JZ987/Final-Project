class SniperMonkey extends Tower{
  
  public static final String image = "Images/Sniper_Monkey.png";
  
  SniperMonkey(){
    // int w, int h, int cost, float atkSpeed, Projectile ammo, String m
    super(55, 90, 1200, 0.75, new Projectile(0), image);
  }
  
  void shoot(){
  }
  
  void die(){
  }
}