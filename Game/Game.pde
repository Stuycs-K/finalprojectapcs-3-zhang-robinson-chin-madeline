class Game{
int[][] board;
ArrayList<String> history;
boolean turn;
void setup() {
  size(1000,1000);
  board = new int[8][8];
  history = new ArrayList<String>();
  turn = false; //false will be 'white' and true will be 'black'
}
void grid() {
  for (int y = 0; y < width / 125; y++) {
    for (int z = 0; z < height / 125; z++) {
      stroke(255,255,255);
      fill(0,0,0);
      rect(y*125,z*125,125,125);
    }
  }
}
void draw() {
  grid(); 
  }
}
