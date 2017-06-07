class SuperMonkey extends Tower{
  
  public static final String image = "Images/Super_Monkey.png";
  
  SuperMonkey(){
    // int w, int h, int cost, float atkSpeed, Projectile ammo, String m
    super(75, 75, 3200, 3, new Projectile(0), image);
  }
  
  void shoot(){
  }
  
  void die(){
  }
}