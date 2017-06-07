class SuperMonkey extends Tower{
  
<<<<<<< HEAD
  private float atkSpeed,  currentX, currentY;
  private int w, h, range, cost;
  private Projectile ammunition;
  private PImage superMonkey;
  
  SuperMonkey(){
    atkSpeed = 3;
    cost = 3200;
    w = h = 50;
    range = 650;
    superMonkey = loadImage("Images/Super_Monkey.png");
=======
  public static final String image = "Images/Super_Monkey.png";
  
  SuperMonkey(){
    // int w, int h, int cost, float atkSpeed, float range, Projectile ammo, String m
    super(50, 50, 3200, 3, 650, new Projectile(0), image);
  }
  
  void shoot(){
  }
  
  void die(){
  }
}