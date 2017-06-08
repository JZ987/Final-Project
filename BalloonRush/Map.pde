enum Direction {
  NORTH, SOUTH, EAST, WEST
}

class Map {
  
  PImage map;
  int rows, cols, startRow;
  Tile[][] grid;
  Tile startTile, endTile;
  
  Map(int index){
    rows = height/50;
    cols = (width-150)/50;
    startRow = rows/2;
    grid = new Tile[rows][cols];
    if(index == 0){
      map = loadImage("Images/Desktop1.jpg");
    } else if(index == 1){
      map = loadImage("Images/Desktop2.jpg");
    } else if(index == 2){
      map = loadImage("Images/JungleMap.jpg");
    }
    startTile = getTileRC(startRow, 0);
    endTile = getTileRC(startRow, cols-1);
  }
  
  void printGrid() {
    for(int r = 0; r < rows; r++) {
      for(int c = 0; c < cols; c++) {
        print(grid[r][c].getDist()+" ");
      }
      println();
    }
  }
  
  Tile getTileRC(int r, int c) {
    if ((r < 0 || r >= rows)
     || (c < 0 || c >= cols)) {
      return null; 
    }
    return grid[r][c];
  }
  
  Direction getNextDirection(Tile t) {
    int r = t.getR();
    int c = t.getC();
    Tile tile = getTile(r,c+1);
    if (tile != null && !tile.hasTower()) {
    }
    return Direction.NORTH;
  }
  
  Tile getTile(int x, int y) {
    int c = (x-150)/50;
    int r = y/50;
    return grid[r][c];
  }
  
  void addTower(int r, int c, Tower t) {
    grid[r][c].setTower(t);
  }
  
  Tower removeTower(int r, int c) {
    return grid[r][c].removeTower();
  }

  Tower getTower(int r, int c) {
    return grid[r][c].getTower();
  }
  
  int getStartRow() {
    return startRow;
  }
  int getRows() {
    return rows;
  }  
  int getCols() {
    return cols;
  }
  private void setupGrid() {
    for(int r = 0; r < rows; r++) {
      for(int c = 0; c < cols; c++) {
        grid[r][c] = new Tile(c*50+150, r*50);
      }
    }
  }
}