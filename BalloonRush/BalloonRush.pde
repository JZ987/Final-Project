PImage map, donut;
ArrayList<Balloon> balloons;
ArrayList<Tower> towers;
ArrayList<Projectile> projectiles;
boolean overDartMonkey, overNinjaMonkey, overSuperMonkey, overBombTower, overFreezeTower = false;

void setup(){
  size(1500, 900);
  map = loadImage("Images/Desktop1.jpg");
  donut = loadImage("Images/DonutFull.jpg");
}

void draw(){
  image(map, 0, 0, width, height);
  image(donut, 800, 275);
  update(mouseX, mouseY);
  if(overDartMonkey){
    fill(15);
  }
  fill(255);
  rect(0, 0, 200, 900);
}

void mouseDragged(){
  
}

void update(int x, int y) {
  if (overDartMonkey) {
    overDartMonkey = true;
  }else {
    overDartMonkey = overNinjaMonkey = overSuperMonkey = overBombTower = overFreezeTower = false;
  }
}