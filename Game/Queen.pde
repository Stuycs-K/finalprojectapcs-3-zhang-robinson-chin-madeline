class Queen extends chessPiece{
    public Queen(int r, int c, boolean white) {
    super(r,c,white);
  }

  String getPiece(){
    return "Queen"; 
  } 
  
  void move(chessPiece[][] board,int r, int c){
    boolean isCapture = (board[r][c]!=null);
    super.move(board,r,c);
    moveLog(this,row,col,r,c,isCapture,false,false,false);
    
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
        if (board[this.row][y].white != this.white) {
          moves.add(""+this.row+y);
        }
        break;
      }
    }
    
    for (int y = this.row + 1, z = this.col + 1; y < 8 && z < 8; y++, z++) {
      if (board[y][z] == null) {
        moves.add(""+y+z);
      }
      else {
        if (board[y][z].white != this.white&& !(board[y][z] instanceof King)) {
          moves.add(""+y+z);
        }
        break;
      }
    }
    
    for (int y = this.row - 1, z = this.col - 1; y >=0 && z >=0; y--, z--) {
      if (board[y][z] == null) {
        moves.add(""+y+z);
      }
      else {
        if (board[y][z].white != this.white&& !(board[y][z] instanceof King)) {
          moves.add(""+y+z);
        }
        break;
      }
    }
    
    for (int y = this.row - 1, z = this.col + 1; y >=0 && z < 8; y--, z++) {
      if (board[y][z] == null) {
        moves.add(""+y+z);
      }
      else {
        if (board[y][z].white != this.white&& !(board[y][z] instanceof King)) {
          moves.add(""+y+z);
        }
        break;
      }
    }
    
    for (int y = this.row + 1, z = this.col - 1; y < 8 && z >=0; y++, z--) {
      if (board[y][z] == null) {
        moves.add(""+y+z);
      }
      else {
        if (board[y][z].white != this.white&& !(board[y][z] instanceof King)) {
          moves.add(""+y+z);
        }
        break;
      }
    }
    return filterIllegalMoves(moves,board);
  }
}
