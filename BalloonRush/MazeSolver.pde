import java.util.PriorityQueue;

class MazeSolver {
  
    boolean visited[][];

    public class Location implements Comparable<Location> {
        Tile tile;
        Location prev;
        Location(Tile t, Location p) {
            tile = t;
            prev = p;
        }
        public int compareTo(Location other) {
          return tile.compareTo(other.tile);
        }
    }

   boolean solve() {
        visited = new boolean[currentMap.rows][currentMap.cols];
        PriorityQueue<Location> starQueue = new PriorityQueue<Location>();
        Location current = new Location(currentMap.startTile, null);
        while (true) {
            if (current == null) {
               return false; 
            }
            if (current.tile.isSameTile(currentMap.endTile)) {
               break;
            }
            if (current.tile.hasTower() || visited[current.tile.row][current.tile.col]) {
              current = starQueue.peek();
              starQueue.remove(current);
            } else {
                visited[current.tile.row][current.tile.col] = true;
                //currentMap.grid[current.tile.row][current.tile.col].visited = true;
                int row = current.tile.getR();
                int col = current.tile.getC();
                Tile candidate = currentMap.getTileRC(row,col+1);
                if (candidate != null && !visited[row][col+1]) {
                  starQueue.add(new Location(candidate,current));
                }
                candidate = currentMap.getTileRC(row,col-1);
                if (candidate != null && !visited[row][col-1]) {
                  starQueue.add(new Location(candidate,current));
                }
                candidate = currentMap.getTileRC(row+1,col);
                if (candidate != null && !visited[row+1][col]) {
                  starQueue.add(new Location(candidate,current));
                }
                candidate = currentMap.getTileRC(row-1,col);
                if (candidate != null && !visited[row-1][col]) {
                  starQueue.add(new Location(candidate,current));
                }
            }
        }
        currentMap.clearBooleans();
        currentMap.endTile.isPath = true;
        findPath(current);
        //currentMap.printGrid();
        return true;
    }

    private void findPath(Location l) {
        while (!l.tile.isSameTile(currentMap.startTile)) {
            currentMap.grid[l.prev.tile.row][l.prev.tile.col].isPath = true;
            //l.prev.tile.isPath = true;
            l = l.prev;
      }
    }
}