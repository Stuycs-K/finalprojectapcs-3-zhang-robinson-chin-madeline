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
    int [][] directions = {
      {-1,0},{1,0},{0,-1},{0,1},
      {-1,-1},{-1,1},{1,-1},{1,1}
    };
    
    for(int[] dir : directions){
      int r = this.row+dir[0];
      int c = this.col+dir[1];
      
      while(r>=0&& r<8 && c>=0 && c<8){
        if(board[r][c]==null){
          moves.add(""+r+c);
        }
        else{
          if(board[r][c].white!=this.white){
            moves.add(""+r+c);
          }
          break;
        }
        r+=dir[0];
        c+=dir[1];
      }
    }
    //for (int y = this.row - 1; y >= 0; y--) {
    //  if (board[y][this.col] == null) {
    //    moves.add(""+y+this.col);
    //  }
    //  else {
    //    if (board[y][this.col].white != this.white) {
    //      moves.add(""+y+this.col);
    //    }
    //    break;
    //  }
    //}
    //for (int y = this.row + 1; y < 8; y++) {
    //  if (board[y][this.col] == null) {
    //    moves.add(""+y+this.col);
    //  }
    //  else {
    //    if (board[y][this.col].white != this.white) {
    //      moves.add(""+y+this.col);
    //    }
    //    break;
    //  }
    //}
    
    //for (int y = this.col - 1; y >= 0; y--) {
    //  if (board[this.row][y] == null) {
    //    moves.add(""+this.row+y);
    //  }
    //  else {
    //    if (board[this.row][y].white != this.white) {
    //      moves.add(""+this.row+y);
    //    }
    //    break;
    //  }
    //}
    //for (int y = this.col + 1; y < 8; y++) {
    //  if (board[this.row][y] == null) {
    //    moves.add(""+this.row+y);
    //  }
    //  else {
    //    if (board[this.row][y].white != this.white) {
    //      moves.add(""+this.row+y);
    //    }
    //    break;
    //  }
    //}
    
    //for (int y = this.row + 1, z = this.col + 1; y < 8 && z < 8; y++, z++) {
    //  if (board[y][z] == null) {
    //    moves.add(""+y+z);
    //  }
    //  else {
    //    if (board[y][z].white != this.white&& !(board[y][z] instanceof King)) {
    //      moves.add(""+y+z);
    //    }
    //    break;
    //  }
    //}
    
    //for (int y = this.row - 1, z = this.col - 1; y >=0 && z >=0; y--, z--) {
    //  if (board[y][z] == null) {
    //    moves.add(""+y+z);
    //  }
    //  else {
    //    if (board[y][z].white != this.white&& !(board[y][z] instanceof King)) {
    //      moves.add(""+y+z);
    //    }
    //    break;
    //  }
    //}
    
    //for (int y = this.row - 1, z = this.col + 1; y >=0 && z < 8; y--, z++) {
    //  if (board[y][z] == null) {
    //    moves.add(""+y+z);
    //  }
    //  else {
    //    if (board[y][z].white != this.white&& !(board[y][z] instanceof King)) {
    //      moves.add(""+y+z);
    //    }
    //    break;
    //  }
    //}
    
    //for (int y = this.row + 1, z = this.col - 1; y < 8 && z >=0; y++, z--) {
    //  if (board[y][z] == null) {
    //    moves.add(""+y+z);
    //  }
    //  else {
    //    if (board[y][z].white != this.white&& !(board[y][z] instanceof King)) {
    //      moves.add(""+y+z);
    //    }
    //    break;
    //  }
    //}
    return filterIllegalMoves(moves,board);
  }
}
