class NinjaMonkey extends Tower{
  
  public static final String image = "Images/Ninja_Monkey.png";
  
  NinjaMonkey(){
    // int w, int h, int cost, float atkSpeed, Projectile ammo, String m
    super(75, 75, 2000, 1.5, new Projectile(0), image);
  }
  
  void shoot(){
  }
  
  void die(){
  }
}