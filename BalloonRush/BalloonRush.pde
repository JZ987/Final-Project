static PImage currentPic, titleScreen, desktopMap1, desktopMap2, jungleMap1, donut, dartMonkey, ninjaMonkey, superMonkey, bombTower, freezeTower, sniperMonkey, redBloon, blueBloon, greenBloon, yellowBloon, pinkBloon, rainbowBloon, ceramicBloon;
boolean dartMonkeyOver, ninjaMonkeyOver, superMonkeyOver, bombTowerOver, freezeTowerOver, sniperMonkeyOver, boomerangMonkeyOver, magicMonkeyOver, pineappleOver, roadSpikeOver = false;
static ArrayList<Balloon> balloons;
static ArrayList<Tower> towers;
static ArrayList<Projectile> projectiles;
Tower currentTower;
static int currency;
float angle;
public static Map currentMap;
MazeSolver solver;

static int health = 100;

int difficulty;
int MAX_DIFFICULTY = 4;
int[] spawnRates = new int[]{100, 50, 30, 20, 10};

void setup(){
  size(1500, 900);
  loadImages();
  initialize();
  addLayout();
  this.loadPixels();
  difficulty = 0;
  //println("Solving maze");
  solver.solve();
}

void draw(){
  this.updatePixels();
  updateScreen();
  update(mouseX, mouseY);
  //currency+=10;
  if (frameCount % spawnRates[difficulty] == 0 && frameCount > 0) {
    balloons.add(new Balloon((int)random(1, difficulty+2)));
  }
  if (frameCount % 1000 == 0 && difficulty < MAX_DIFFICULTY) {
    difficulty++;
    println("Difficulty: " + difficulty);
  }
  if(currentTower != null){
    fill(0, 100);
    ellipse(mouseX, mouseY, currentTower.range*2, currentTower.range*2);
    image(currentTower.pic, (50-currentTower.w)/2 + mouseX-25, mouseY-25, currentTower.w, currentTower.h);
    noFill();
  }
  //println(frameRate);
}

void mousePressed(){
  if(currentTower != null){
    if(mouseX < 150){
      currentTower = null;
    }else if(currency >= currentTower.cost){
      //currentMap.addTower((int)mouseX/50, (int)mouseY/50, currentTower);
      Tile currTile = currentMap.getTile(mouseX, mouseY);
      if (currTile.tower != null) {
        return;
      }
      currentTower.setTile(currTile);
      currentTower.setPosition(((int)mouseX/50)*50, ((int)mouseY/50)*50);
      if (solver.solve()) {
        towers.add(currentTower);
        currency -= currentTower.cost;
        currentTower = null;
      } else {
        currTile.setTower(null);
        println("Cannot place tower there");
      }
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
  }
}

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
  solver = new MazeSolver();
  currentMap = new Map(1);
  balloons = new ArrayList<Balloon>();
  towers = new ArrayList<Tower>();
  projectiles = new ArrayList<Projectile>();
  currency = 3000;
}

void addLayout(){
  image(currentMap.map, 0, 0, width, height);
  stroke(126);
  for(float i = 0; i < height; i+=50){
    line(150, i, width, i);
  }
  for(float i = 150; i < width; i+=50){
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
  text("$" + currency, 75, 50);
  text(balloons.size() + " balloons", 75, 100);
  text("Health: " + health, 75, 150);
  
  //Update objects
  for(Tower t : towers){
    t.update();
    t.display();
  }
  
  for(int i = 0; i < projectiles.size(); i++){
    if(projectiles.get(i).shouldDie()){
      projectiles.remove(i);
      i--;
    }else{
      projectiles.get(i).update();
      projectiles.get(i).display();
    }
  }
  
  for(int i = 0; i < balloons.size(); i++){
    if(balloons.get(i).shouldDie()){
      balloons.remove(i);
      i--;
    }else{
      balloons.get(i).update();
      balloons.get(i).display();
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