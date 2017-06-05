class Tile{
  
  int row, col;
  Tower tower;
  
  Tile(int x, int y){
    row = x;
    col = y;
  }
  
  Tile(int x, int y, Tower t) {
    this(x,y);
    tower = t;
  }
  
  void setTower(Tower t) {
    tower = t;
  }
  
  Tower getTower() {
    return tower;
  }
  
  int getRow() {
    return row;
  }
  
  int getCol() {
    return col;
  }
  
  Tower removeTower() {
    Tower t = tower;
    tower = null;
    return t;
  }
}