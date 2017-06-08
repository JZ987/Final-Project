
static PImage currentPic, titleScreen, desktopMap1, desktopMap2, jungleMap1, donut, dartMonkey, ninjaMonkey, superMonkey, bombTower, freezeTower, sniperMonkey, redBloon, blueBloon, greenBloon, yellowBloon, pinkBloon, rainbowBloon, ceramicBloon;
boolean dartMonkeyOver, ninjaMonkeyOver, superMonkeyOver, bombTowerOver, freezeTowerOver, sniperMonkeyOver, boomerangMonkeyOver, magicMonkeyOver, pineappleOver, roadSpikeOver = false;
ArrayList<Balloon> balloons;
ArrayList<Tower> towers;
ArrayList<Projectile> projectiles;
Tower currentTower;
Map currentMap;
int currency;

void setup(){
  size(1500, 900);
  loadImages();
  initialize();
  addLayout();
  loadPixels();
}

void draw(){
  updatePixels();
  updateScreen();
  update(mouseX, mouseY);
  currency+=10;
  if(currentTower != null){
    fill(0, 100);
    ellipse(mouseX, mouseY, currentTower.getRange(), currentTower.getRange());
    image(currentTower.getPic(), (50-currentTower.getWidth())/2 + mouseX-25, mouseY-25, currentTower.getWidth(), currentTower.getHeight());
    noFill();
  }
  println(frameRate);
}

void mousePressed(){
  if(currentTower != null){
    if(mouseX < 150){
      currentTower = null;
    }else if(currency >= currentTower.getCost()){
      //currentMap.addTower((int)mouseX/50, (int)mouseY/50, currentTower);
      currentTower.setPosition(((int)mouseX/50)*50, ((int)mouseY/50)*50);
      towers.add(currentTower);
      currency -= currentTower.getCost();
      currentTower = null;
    }
  }else if(dartMonkeyOver){
    currentTower = new DartMonkey();
  }else if(bombTowerOver){
    currentTower = new BombTower();
  }else if(ninjaMonkeyOver){
    currentTower = new NinjaMonkey();
  }else if(freezeTowerOver){
    currentTower = new FreezeTower();
  }else if(sniperMonkeyOver){
    currentTower = new SniperMonkey();
  }else if(superMonkeyOver){
    currentTower = new SuperMonkey();
  }else{
    balloons.add(new Balloon((int)random(1, 5)));
  }
}

//Convert png to svg
void loadImages(){
  desktopMap1 = loadImage("Images/Desktop1.jpg");
  desktopMap2 = loadImage("Images/Desktop2.jpeg");
  jungleMap1 = loadImage("Images/JungleMap.jpg");
  dartMonkey = loadImage("Images/Dart_Monkey.png");
  ninjaMonkey = loadImage("Images/Ninja_Monkey.png");
  superMonkey = loadImage("Images/Super_Monkey.png");
  bombTower = loadImage("Images/Bomb_Tower.png");
  freezeTower = loadImage("Images/Ice_Tower.png");
  sniperMonkey = loadImage("Images/Sniper_Monkey.png");
  donut = loadImage("Images/DonutFull.jpg");
  redBloon = loadImage("Images/Red_Bloon.png");
  blueBloon = loadImage("Images/Blue_Bloon.png");
  greenBloon = loadImage("Images/Green_Bloon.png");
  yellowBloon = loadImage("Images/Yellow_Bloon.png");
  pinkBloon = loadImage("Images/Pink_Bloon.png");
  rainbowBloon = loadImage("Images/Rainbow_Bloon.png");
  ceramicBloon = loadImage("Images/Ceramic_Bloon_2.png");
}

void initialize(){
  currentMap = new DesktopMap2();
  balloons = new ArrayList<Balloon>();
  towers = new ArrayList<Tower>();
  projectiles = new ArrayList<Projectile>();
  currency = 1000;
}

void addLayout(){
  image(desktopMap2, 0, 0, width, height);
  stroke(126);
  for(float i = 0; i < height; i+=50){
    line(150, i, width, i);
  }
  for(float i = 150; i < width; i+= 50){
    line(i, 0, i, height);
  }
  fill(255, 50);
  rect(0, 0, 150, 900);
  rect(37.5, height-600, 75, 75); image(dartMonkey, 50, height-587.5, 50, 50);
  rect(37.5, height-500, 75, 75); image(bombTower, 55, height-487.5, 40, 50);
  rect(37.5, height-400, 75, 75); image(ninjaMonkey, 50, height-387.5, 50, 50);
  rect(37.5, height-300, 75, 75); image(freezeTower, 51.5, height-287.5, 47, 50);
  rect(37.5, height-200, 75, 75); image(sniperMonkey, 60, height-187.5, 30, 50);
  rect(37.5, height-100, 75, 75); image(superMonkey, 50, height-87.5, 50, 50);
}

void updateScreen(){
  //Update currency  
  textSize(30);
  fill(238,255,8);
  textAlign(CENTER);
  text(currency, 75, 50);
  text(balloons.size(), 75, 100);
  
  //Update objects
  for(Tower t : towers){
    t.display();
  }
  for(Projectile p : projectiles){
    image(p.getPic(), p.getX(), p.getY(), p.getWidth(), p.getHeight());
  }
  for(Balloon b : balloons){
    if(b.getHealth() <= 0 || b.getX() > 1300){
      b = null;
    }else{
      b.update();
      b.display();
    }
    //b.setX(b.getSpeed());
    //b.setY(b.getSpeed());
  }
  
  //Update text boxes
  if(dartMonkeyOver||ninjaMonkeyOver||superMonkeyOver||bombTowerOver||freezeTowerOver||sniperMonkeyOver){
    fill(255);
    rect(mouseX, mouseY, 400, -200);
    fill(0);
    textSize(30);
    text(overWhich(), mouseX+200, mouseY-170);
  }
}

void update(int x, int y){
  dartMonkeyOver = isOverObject(37.5, height-600, 75);
  bombTowerOver = isOverObject(37.5, height-500, 75);
  ninjaMonkeyOver = isOverObject(37.5, height-400, 75);
  freezeTowerOver = isOverObject(37.5, height-300, 75);
  sniperMonkeyOver = isOverObject(37.5, height-200, 75);
  superMonkeyOver = isOverObject(37.5, height-100, 75);
}

boolean isOverObject(float x, float y, int size){
  if(mouseX >= x && mouseX <= x+size &&
     mouseY >= y && mouseY <= y+size)
     return true;
     return false;
}

String overWhich(){
  if(dartMonkeyOver){
    return "Dart Monkey";
  }else if(bombTowerOver){
    return "Bomb Tower";
  }else if(ninjaMonkeyOver){
    return "Ninja Monkey";
  }else if(freezeTowerOver){
    return "Ice Tower";
  }else if(sniperMonkeyOver){
    return "Sniper Monkey";
  }else if(superMonkeyOver){
    return "Super Monkey";
  }
  return "";
}

PImage getPic(String name){
  if(name.equals("redBloon")){
    return redBloon;
  }else if(name.equals("blueBloon")){
    return blueBloon;
  }else if(name.equals("greenBloon")){
    return greenBloon;
  }else if(name.equals("yellowBloon")){
    return yellowBloon;
  }else if(name.equals("pinkBloon")){
    return pinkBloon;
  }else if(name.equals("rainbowBloon")){
    return rainbowBloon;
  }else if(name.equals("ceramicBloon")){
    return ceramicBloon;
  }else{
    return donut;
  }
}