class NinjaMonkey extends Tower{

  public static final String image = "Images/Ninja_Monkey.png";
  
  NinjaMonkey(){
    // int w, int h, int cost, float atkSpeed, float range, Projectile ammo, String m
    super(50, 50, 2000, 1.5, 400, new Projectile(0), image);
  }
  
  void shoot(){
  }
  
  void die(){
  }
}