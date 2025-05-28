abstract class chessPiece{
int row;
int col;
boolean white;

Piece(int r, int c, boolean white) {
  this.row=r;
  this.col=c;
  this.whit = white;
}

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
  for (int y = 0; y < moves.length; y++) {
    if ((""+this.row+this.col).equals(moves[y])) {
      board[r][c] = this;
      board[this.row][this.col] = null;
      row = r;
      col = col;
    }
  }
}

//I like dont think we need capture??
  
}
}
