PImage currentPic, titleScreen, desktopMap1, desktopMap2, jungleMap1, donut, dartMonkey, ninjaMonkey, superMonkey, bombTower, freezeTower, sniperMonkey, boomerangMonkey, magicMonkey, pineapple, roadSpike;
ArrayList<Balloon> balloons;
ArrayList<Tower> towers;
ArrayList<Projectile> projectiles;
Tower currentTower;
boolean dartMonkeyOver, ninjaMonkeyOver, superMonkeyOver, bombTowerOver, freezeTowerOver, sniperMonkeyOver, boomerangMonkeyOver, magicMonkeyOver, pineappleOver, roadSpikeOver = false;
color rectHighlight;
int currency;

void setup(){
  size(1500, 900);
  loadImages();
  initialize();
  currency = 0;
  addLayout();
}

void draw(){
  addLayout();
  updateScreen();
  update(mouseX, mouseY);
  textBox();
  currency+=10;
  if(currentTower != null){
    image(currentTower.getPic(), mouseX-37.5, mouseY-37.5, 75, 75);
  }
  println(frameRate);
}

void mouseClicked(){
  if(currentTower != null){
    if(currency >= currentTower.getCost()){
      currentTower.setPosition(mouseX, mouseY);
      towers.add(currentTower);
      currency -= currentTower.getCost();
      currentTower = null;
    }
  }else if(dartMonkeyOver){
    currentTower = new DartMonkey();
  }else if(bombTowerOver){
    currentPic = bombTower;
  }else if(ninjaMonkeyOver){
    currentPic = ninjaMonkey;
  }
}

void loadImages(){
  //currentPic = loadImage("Images/DartMonkey.png");
  desktopMap1 = loadImage("Images/Desktop1.jpg");
  desktopMap2 = loadImage("Images/Desktop2.jpeg");
  jungleMap1 = loadImage("Images/JungleMap.jpg");
  dartMonkey = loadImage("Images/Dart_Monkey.png");
  ninjaMonkey = loadImage("Images/Ninja_Monkey.png");
  superMonkey = loadImage("Images/Super_Monkey.png");
  bombTower = loadImage("Images/Bomb_Tower.png");
  freezeTower = loadImage("Images/Ice_Tower.png");
  sniperMonkey = loadImage("Images/Sniper_Monkey.png");
  boomerangMonkey = loadImage("Images/Boomerang_Thrower.png");
  magicMonkey = loadImage("Images/Monkey_Apprentice.png");
  pineapple = loadImage("Images/Exploding_Pineapple.png");
  roadSpike = loadImage("Images/Road_Spikes.png");
  donut = loadImage("Images/DonutFull.jpg");
}

void initialize(){
  balloons = new ArrayList<Balloon>();
  towers = new ArrayList<Tower>();
  projectiles = new ArrayList<Projectile>();
}

void addLayout(){
  image(desktopMap2, 0, 0, width, height);
  //image(donut, 900, 200, 300, 300);
  fill(255, 50);
  rect(0, 0, 200, 900);
  rect(0, height-600, 100, 100); image(dartMonkey, 12.5, height-587.5, 75, 75);
  rect(0, height-500, 100, 100); image(bombTower, 20, height-487.5, 60, 75);
  rect(0, height-400, 100, 100); image(ninjaMonkey, 12.5, height-387.5, 75, 75);
  rect(0, height-300, 100, 100); image(freezeTower, 15, height-287.5, 70, 75);
  rect(0, height-200, 100, 100); image(sniperMonkey, 22.5, height-195, 55, 90);
  rect(0, height-100, 100, 100); image(superMonkey, 12.5, height-87.5, 75, 75);
  fill(0, 150);
  image(boomerangMonkey, 120, height-595, 60, 90); rect(100, height-600, 100, 100); 
  image(magicMonkey, 112.5, height-487.5, 75, 75); rect(100, height-500, 100, 100); 
  rect(100, height-400, 100, 100);
  rect(100, height-300, 100, 100);
  fill(255, 10);
  rect(100, height-200, 100, 100); image(pineapple, 117.5, height-195, 65, 90);
  rect(100, height-100, 100, 100); image(roadSpike, 110, height-87.5, 80, 75);
}

void updateScreen(){
  textSize(30);
  fill(238,255,8);
  textAlign(CENTER);
  text(currency, 100, 50);
  for(Tower t : towers){
    image(t.getPic(), t.getX(), t.getY(), t.getWidth(), t.getHeight()); 
  }
}

void update(int x, int y) {
  dartMonkeyOver = isOverObject(0, height-600, 100);
  bombTowerOver = isOverObject(0, height-500, 100);
  ninjaMonkeyOver = isOverObject(0, height-400, 100);
  freezeTowerOver = isOverObject(0, height-300, 100);
  sniperMonkeyOver = isOverObject(0, height-200, 100);
  superMonkeyOver = isOverObject(0, height-100, 100);
  boomerangMonkeyOver = isOverObject(100, height-600, 100);
  magicMonkeyOver = isOverObject(100, height-500, 100);
  pineappleOver = isOverObject(100, height-200, 100);
  roadSpikeOver = isOverObject(100, height-100, 100);
}

void textBox(){
  if(dartMonkeyOver||ninjaMonkeyOver||superMonkeyOver||bombTowerOver||freezeTowerOver||sniperMonkeyOver||boomerangMonkeyOver||magicMonkeyOver||pineappleOver||roadSpikeOver){
    fill(255);
    rect(mouseX, mouseY, 400, -200);
    fill(0);
    textSize(30);
    String display = overWhich();
    text(display, mouseX+200, mouseY-170);
  }
}

boolean isOverObject(int x, int y, int size){
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
  }else if(boomerangMonkeyOver){
    return "Boomerang Monkey";
  }else if(magicMonkeyOver){
    return "Monkey Apprentice";
  }else if(pineappleOver){
    return "Exploding Pineapple";
  }else if(roadSpikeOver){
    return "Road Spike";
  }
  return "";
}