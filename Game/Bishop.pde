class Bishop extends chessPiece{
    Bishop(int r, int c, boolean white){
    super(r,c,white);
  }
  
  ArrayList<String> allowedMoves(chessPiece[][] board){
    ArrayList<String> moves = new ArrayList<>();
    int[][] moveSet={
      {-1,-1},{1,1},{-1,1},{1,-1}
    };
    
    for(int[] direction:moveSet){
      int newRow = row+direction[0];
      int newCol = col+direction[1];
      if (inBounds(newRow,newCol)){
        if(board[newRow][newCol]==null){
          moves.add(""+newRow+newCol);
          }
          else {
            if (board[r][c]==null){
              moves.add("" + newRow+newCol); 
             }
             break;
          }
          newRow+=d[0];
          newCol+=d[1];
        }
      }
      return moves;
    }
  
  boolean inBounds(int r, int c){
    return r>=0 && r<8 && c>=0 && c<8;
  }
}
