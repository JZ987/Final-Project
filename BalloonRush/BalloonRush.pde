PImage map, donut;
ArrayList<Balloon> balloons;
ArrayList<Tower> towers;
ArrayList<Projectile> projectiles;
boolean overDartMonkey, overNinjaMonkey, overSuperMonkey, overBombTower, overFreezeTower = false;
int currency = 0;

void setup(){
  size(1500, 900);
  map = loadImage("Images/Desktop1.jpg");
  donut = loadImage("Images/DonutFull.jpg");
}

void draw(){
  image(map, 0, 0, width, height);
  image(donut, 800, 275);
  reset();
  update(mouseX, mouseY);
  if(overDartMonkey){
    fill(15);
  }
  frameRate(10);
}

void update(int x, int y) {
  fill(0);
  textSize(50);
  text(currency, 45, 50);
  if (overDartMonkey) {
    overDartMonkey = true;
  }else {
    overDartMonkey = overNinjaMonkey = overSuperMonkey = overBombTower = overFreezeTower = false;
  }
}

void reset(){
  fill(255);
  rect(0, 0, 200, 900);
}