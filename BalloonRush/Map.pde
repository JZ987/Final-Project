abstract class Map{
  
  private PImage map;
  private int rows, cols;
  private Tile[][] grid;
  
  Map(){
    row = height/50;
    col = (width-150)/50;
    grid = new Tile[row][col];
  }
 /* 
  Map(String m, int r, int c) {
    map = loadImage(m);
    rows = r;
    cols = c;
    grid = new Tile[r][c];
  }
  */
  
  void addTower(int r, int c, Tower t) {
    grid[r][c].setTower(t);
  }
  
  Tower removeTower(int r, int c) {
    return grid[r][c].removeTower();
  }

  Tower getTower(int r, int c){
    return grid[r][c].getTower();
  }

  PImage getImage() {
    return map;
  }
  
  abstract void display();
 /*
  Map(int index){
    if(index == 0){
      map = loadImage("Images/Desktop1.jpg");
      grid = new PImage[75][75];
      row = 75;
      col = 75;
    }else if(index == 1){
      map = loadImage("Images/Desktop2.jpg");
      grid = new PImage[100][100];
      row = 100;
      col = 100;
    }else if(index == 2){
      map = loadImage("Images/JungleMap.jpg");
      grid = new PImage[50][50];
      row = 50;
      col = 50;
    }
  }
  */
}