class Tile implements Comparable<Tile> {
  
  int xcor, ycor, row, col, dist;
  Tower tower;
  boolean isPath;

  Tile(int x, int y) {
    xcor = x;
    ycor = y;
    row = y/50;
    col = (x-150)/50;
    dist = currentMap.cols + Math.abs(row-currentMap.startRow);
    tower = null;
  }
  
  boolean isSameTile(Tile other) {
    return other.row == row && other.col == col;
  }
  
  boolean hasTower() {
    return tower != null;
  }
  
  void setTower(Tower t) {
    tower = t;
  }
  
  Tower getTower() {
    return tower;
  }
  
  int getX() {
    return xcor;
  }
  
  int getY() {
    return ycor;
  }
  
  int getR() {
    return row;
  }
  
  int getC() {
    return col;
  }
  
  int getDist() {
    return dist;
  }
  
  Tower removeTower() {
    Tower t = tower;
    tower = null;
    return t;
  }
  
  int compareTo(Tile other) {
    return dist - other.dist;
  }
}