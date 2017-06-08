import java.util.PriorityQueue;

class MazeSolver {

    private class Location implements Comparable<Location> {
        Tile tile;
        Location prev;
        Location(Tile t, Location p) {
            tile = t;
            prev = p;
        }
        int compareTo(Location other) {
            return tile.compareTo(other.tile);
        }
    }

   static void solve() {
        PriorityQueue<Location> starQueue = new PriorityQueue<Location>();
        Location current = new Location(currentMap.startTile, null);
        while (!current.tile.isSameTile(currentMap.endTile)) {
            if (current.tile == null || current.tile.hasTower()) {
                current = starQueue.remove();
            } else {
                int row = current.tile.getR();
                int col = current.tile.getC();
                starQueue.add(new Location(currentMap.getTileRC(row,col+1),current));
                starQueue.add(new Location(currentMap.getTileRC(row,col-1),current));
                starQueue.add(new Location(currentMap.getTileRC(row+1,col),current));
                starQueue.add(new Location(currentMap.getTileRC(row-1,col),current));
            }
        }
        currentMap.endTile.isPath = true;
        findPath(current);
    }

    private static void findPath(Location l) {
        if (l.tile.isSameTile(currentMap.startTile)) {
            l.prev.tile.isPath = true;
            findPath(l.prev);
        }
    }
}