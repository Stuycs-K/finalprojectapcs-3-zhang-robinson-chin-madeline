abstract class chessPiece{
int row;
int col;
boolean white;

Piece(int r, int c, boolean white) {
  this.row=r;
  this.col=c;
  this.white = white;
}

abstract String getPiece();

static boolean checkSq(int[][] board, int r, int c) {
  if (board[r][c] == null) {
    return true;
  }
  else {
    return false;
  }
}

abstract ArrayList<String> allowedMoves(Piece[][] board);


void move(chessPiece[][] board, int r, int c) {
  ArrayList<String> moves = this.allowedMoves(board);
      Piece hold = board[r][c];
    if (this instanceof King && hold instanceof Rook && this.white == hold.white && 
  this.castle) {
      if (this.col == 0 || c == 0) {
        this.history.add(""+this.row+this.col+" castles " +r+c);
      board[r][c+1] = this;
      board[this.row][this.col] = null;
      board[r][c+2]=hold;
      board[r][c] = null;
      this.col = c+1;
      hold.col = c+2;
      }
      if (this.col == 7 || c == 7) {
        this.history.add(""+this.row+this.col+" castles " +r+c);
      board[r][c-1] = this;
      board[this.row][this.col] = null;
      board[r][c-2]=hold;
      board[r][c] = null;
      this.col = c-1;
      hold.col = c-2;
      }
    }
    for (int y = 0; y < moves.length; y++) {
    if ((""+this.row+this.col).equals(moves[y])) {
      this.history.add(""+this.row+this.col+" to " +r+c);
      board[r][c] = this;
      board[this.row][this.col] = null;
      row = r;
      col = c;
    }
  }
}
}

//I like dont think we need capture??
  

}
