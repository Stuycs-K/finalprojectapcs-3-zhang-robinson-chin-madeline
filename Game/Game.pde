chessPiece[][] board;
ArrayList<String> history;
//boolean turn;
void setup() {
  size(1000,1000);
  board = new Piece[8][8];
  
  for (int y = 0; y < 8; y++) {
    board[1][y] = new Pawn(1, y, false); 
    board[6][y] = new Pawn(6, y, true);   
  }
  
  board[0][0] = new Rook(0, 0, false);
  board[0][7] = new Rook(0, 7, false);
  board[7][0] = new Rook(7, 0, true);
  board[7][7] = new Rook(7, 7, true);

  board[0][1] = new Knight(0, 1, false);
  board[0][6] = new Knight(0, 6, false);
  board[7][1] = new Knight(7, 1, true);
  board[7][6] = new Knight(7, 6, true);

  board[0][2] = new Bishop(0, 2, false);
  board[0][5] = new Bishop(0, 5, false);
  board[7][2] = new Bishop(7, 2, true);
  board[7][5] = new Bishop(7, 5, true);

  board[0][3] = new Queen(0, 3, false);
  board[7][3] = new Queen(7, 3, true);

  board[0][4] = new King(0, 4, false);
  board[7][4] = new King(7, 4, true);

  history = new ArrayList<String>();
  //turn = false; //false will be 'white' and true will be 'black'
}
void grid() {
  for (int y = 0; y < width / 125; y++) {
    for (int z = 0; z < height / 125; z++) {
      if ((y + z) % 2 == 0) {
        fill(255,255,255);
      }
      else {
      fill(0,0,0);
      }
      rect(y*125,z*125,125,125);
    }
  }
}

void putP() {
  for (int y = 0; y < board.length; y++) {
  }
}

void display() {
  grid(); 
  }
  
//moved castling 
