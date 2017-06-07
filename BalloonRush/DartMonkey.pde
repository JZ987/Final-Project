class DartMonkey extends Tower{
  
  public static final String image = "Images/Dart_Monkey.png";
  
  DartMonkey() {
    // int w, int h, int cost, float atkSpeed, Projectile ammo, String m
    super(75, 75, 500, 1, new Projectile(0), image);
  }
  
  void shoot(){
  }
  
  void die(){  
  }  
}