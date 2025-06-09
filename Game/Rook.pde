class Rook extends chessPiece {
  boolean hasMoved = false;
  public Rook(int r, int c, boolean white) {
    super(r,c,white);
  }

  String getPiece(){
    return "Rook"; 
  } 
  
  ArrayList<String> allowedMoves(chessPiece[][] board) {
    ArrayList<String> moves = new ArrayList<>();
    for (int y = this.row - 1; y >= 0; y--) {
      if (board[y][this.col] == null) {
        moves.add(""+y+this.col);
      }
      else {
        if (board[y][this.col].white != this.white) {
          moves.add(""+y+this.col);
        }
        break;
      }
    }
    for (int y = this.row + 1; y < 8; y++) {
      if (board[y][this.col] == null) {
        moves.add(""+y+this.col);
      }
      else {
        if (board[y][this.col].white != this.white) {
          moves.add(""+y+this.col);
        }
        break;
      }
    }
    
    for (int y = this.col - 1; y >= 0; y--) {
      if (board[this.row][y] == null) {
        moves.add(""+this.row+y);
      }
      else {
        if (board[this.row][y].white != this.white) {
          moves.add(""+this.row+y);
        }
        break;
      }
    }
    for (int y = this.col + 1; y < 8; y++) {
      if (board[this.row][y] == null) {
        moves.add(""+this.row+y);
      }
      else {
        if (board[this.row][y].white != this.white ) {
          moves.add(""+this.row+y);
        }
        break;
      }
    }
    return filterIllegalMoves(moves,board);
  }
  
void move(chessPiece[][] board, int r, int c){
    boolean isCapture = (board[r][c]!=null);
    moveLog(this,row,col,r,c,isCapture,false,false,false);
    super.move(board,r,c);
    hasMoved = true;
  }
}  
  
