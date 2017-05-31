class HealthBar{
   
  private int maxHealth, currentHealth;
  
  HealthBar(int maxHealth){
    this.maxHealth = maxHealth;
    this.currentHealth = maxHealth;
  }
  
  void setCurrentHealth(int nHealth){
    currentHealth = nHealth;
  }
  
  int getCurrentHealth(){
    return currentHealth;
  }
  
}