class Balloon{
 
  private float velocity;
  private HealthBar healthBar;

  Balloon(float velocity, int maxHealth){
    this.velocity = velocity;
    healthBar = new HealthBar(maxHealth);
  }
  
  
  
}