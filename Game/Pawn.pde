class Pawn extends chessPiece{
  boolean hasMove = false;
  
  Pawn(int r, int c, boolean white){
   super(r,c,white);
  }
  
  ArrayList<String> allowedMoves(chessPiece[][] board){
    ArrayList<String> moves = new ArrayList<>();
    int dir;
    if(white){
      dir=-1;
    }
    else{
      dir =1;
    }
    
    if(inBounds(row+dir,col)&& board[row+dir] [col]==null){
      moves.add("" +(row+dir) +col);
    }
  }
}
