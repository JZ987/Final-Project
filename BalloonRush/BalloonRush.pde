boolean dartMonkeyOver, ninjaMonkeyOver, superMonkeyOver, bombTowerOver, freezeTowerOver, sniperMonkeyOver, boomerangMonkeyOver, magicMonkeyOver, pineappleOver, roadSpikeOver = false;
ArrayList<Balloon> balloons;
ArrayList<Tower> towers;
ArrayList<Projectile> projectiles;
Tower currentTower;
Map currentMap;
int currency;

void setup(){
  size(1500, 900);
  currentMap = new DesktopMap2();
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

void initialize(){
  currentMap = new Map();
  balloons = new ArrayList<Balloon>();
  towers = new ArrayList<Tower>();
  projectiles = new ArrayList<Projectile>();
  currency = 1000;
}

void addLayout(){
  image(currentMap.getImage(), 0, 0, width, height);
  stroke(126);
  for(float i = 0; i < height; i+=50){
    line(150, i, width, i);
  }
  for(float i = 150; i < width; i+= 50){
    line(i, 0, i, height);
  }
  fill(255, 50);
  rect(0, 0, 200, 900);
  rect(0, height-600, 100, 100); image(loadImage(DartMonkey.image), 12.5, height-587.5, 75, 75);
  rect(0, height-500, 100, 100); image(loadImage(BombTower.image), 20, height-487.5, 60, 75);
  rect(0, height-400, 100, 100); image(loadImage(NinjaMonkey.image), 12.5, height-387.5, 75, 75);
  rect(0, height-300, 100, 100); image(loadImage(FreezeTower.image), 15, height-287.5, 70, 75);
  rect(0, height-200, 100, 100); image(loadImage(SniperMonkey.image), 22.5, height-195, 55, 90);
  rect(0, height-100, 100, 100); image(loadImage(SuperMonkey.image), 12.5, height-87.5, 75, 75);
  //fill(0, 150);
  //image(boomerangMonkey, 120, height-595, 60, 90); rect(100, height-600, 100, 100); 
  //image(magicMonkey, 112.5, height-487.5, 75, 75); rect(100, height-500, 100, 100); 
  //rect(100, height-400, 100, 100);
  //rect(100, height-300, 100, 100);
  //fill(255, 10);
  //rect(100, height-200, 100, 100); image(pineapple, 117.5, height-195, 65, 90);
  //rect(100, height-100, 100, 100); image(roadSpike, 110, height-87.5, 80, 75);
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
    //println("row : " + t.getX() + "col : " + t.getY());
    image(t.getPic(), (50 - t.getWidth())/2 + t.getX(), t.getY(), t.getWidth(), t.getHeight()); 
  }
  for(Projectile p : projectiles){
    image(p.getPic(), p.getX(), p.getY(), p.getWidth(), p.getHeight());
  }
  for(Balloon b : balloons){
    if(b.getX() > 1300){
      //balloons.remove(b);
      b = null;
    }else{
      image(b.getPic(), b.getX(), b.getY(), b.getWidth(), b.getHeight());
      b.setX(b.getSpeed());
      //b.setY(b.getSpeed());
    }
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