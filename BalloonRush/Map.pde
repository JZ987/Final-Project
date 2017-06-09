enum Direction {
  NORTH, SOUTH, EAST, WEST
}

class Map {

  PImage map;
  int rows = height/50;
  int  cols = (width-150)/50;
  int startRow = rows/2;
  Tile[][] grid;
  Tile startTile, endTile;

  Map(int index){
    grid = new Tile[rows][cols];
    if(index == 0){
      map = loadImage("Images/Desktop1.jpg");
    } else if(index == 1){
      map = loadImage("Images/Desktop2.jpg");
    } else if(index == 2){
      map = loadImage("Images/JungleMap.jpg");
    }
    setupGrid();
    startTile = getTileRC(startRow, 0);
    endTile = getTileRC(startRow, cols-1);
  }

  void printGrid() {
    for(int r = 0; r < rows; r++) {
      for(int c = 0; c < cols; c++) {
        boolean b = grid[r][c].isPath;
        if (b) {
          print("0 ");
        } else {
          print("1 ");
        }
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

  void clearBooleans() {
    for(int r = 0; r < rows; r++) {
      for(int c = 0; c < cols; c++) {
        grid[r][c].isPath = false;
        grid[r][c].visited = false;
      }
    }
  }

  boolean isValidMove(int r, int c) {
    Tile t = getTileRC(r, c);
    if (t == null) {
      return false;
    }
    return t.isPath && !t.visited;
  }

  Direction getNextDirection(Tile cur, Direction d) {
    int r = cur.getR();
    int c = cur.getC();
    if (isValidMove(r,c+1) && d != Direction.WEST) {
      return Direction.EAST;
    } else if (isValidMove(r,c-1) && d != Direction.EAST) {
      return Direction.WEST;
    } else if (isValidMove(r-1,c) && d != Direction.SOUTH) {
      return Direction.NORTH;
    } else if (isValidMove(r+1,c) && d != Direction.NORTH) {
      return Direction.SOUTH;
    } else {
      println("no valid moves");
      return Direction.SOUTH;
    }
  }

  Tile getNextTile(Tile curr, Direction d) {
    switch (getNextDirection(curr, d)) {
      case SOUTH:
        return getTileRC(curr.row+1, curr.col);
      case NORTH:
        return getTileRC(curr.row-1, curr.col);
      case EAST:
        return getTileRC(curr.row, curr.col+1);
      case WEST:
        return getTileRC(curr.row, curr.col-1);
      default:
        return null;
    }

  }

  Tile getTile(int x, int y) {
    int c = (x-150)/50;
    int r = y/50;
    return getTileRC(r, c);
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