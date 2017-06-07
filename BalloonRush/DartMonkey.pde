class DartMonkey extends Tower{
 
  public static final String image = "Images/Dart_Monkey.png";
  
  DartMonkey() {
    // int w, int h, int cost, float atkSpeed, float range, Projectile ammo, String m
    super(50, 50, 500, 1, 300, new Projectile(0), image);
  }
  
  void shoot(){
  }

  void die(){
  }
}