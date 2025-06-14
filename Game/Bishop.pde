class Bishop extends chessPiece{
    Bishop(int r, int c, boolean white){
    super(r,c,white);
  }
  void move(chessPiece[][] board,int r, int c){
    boolean isCapture = (board[r][c]!=null);
    super.move(board,r,c);
    moveLog(this,row,col,r,c,isCapture,false,false,false);
    
  }
  
  String getPiece(){
    return "Bishop"; 
  } 
  
  ArrayList<String> allowedMoves(chessPiece[][] board){
    ArrayList<String> moves = new ArrayList<>();
    int[][] moveSet={
      {-1,-1},{1,1},{-1,1},{1,-1}
    };
    for(int[] direction:moveSet){
      int newRow = row+direction[0];
      int newCol = col+direction[1];
      while (inBounds(newRow,newCol)){
        chessPiece target = board[newRow][newCol];
        
        if(board[newRow][newCol]==null){
          moves.add(""+newRow+newCol);
          }
          else {
            if (target.white!=this.white&& !(target instanceof King)){
              moves.add("" + newRow+newCol); 
             }
             break;
          }
          newRow+=direction[0];
          newCol+=direction[1];
        }
      }
      return filterIllegalMoves(moves,board);
    }
  
  boolean inBounds(int r, int c){
    return r>=0 && r<8 && c>=0 && c<8;
  }
}
