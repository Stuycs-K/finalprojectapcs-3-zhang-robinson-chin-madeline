abstract class chessPiece{
int row;
int col;
boolean white;

Piece(int r, int c, boolean white) {
  this.row=r;
  this.col=c;
  this.white = white;
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

boolean wantC(chessPiece[][] board, int r, int c) {
  Piece save = board[r][c];
  if (save instanceof King && this instance of Rook && this.white == save.white && 
  this.castle) {
    return true;
  }
  else if (save instanceof Rook && this instance of King && this.white == save.white && 
  this.castle) {
    return true;
  }
  return false;
}

void move(chessPiece[][] board, int r, int c) {
  ArrayList<String> moves = this.allowedMoves(board);
    if (this.wantC(board,r,c)) {
      
    }
    if ((""+this.row+this.col).equals(moves[y])) {
      this.history.add(""+this.row+this.col+" to " +r+c);
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
