class Knight extends chessPiece{
  
  Knight(int r, int c, boolean white){
    super(r,c,white);
  }
  
  String getPiece(){
    return "Knight"; 
  } 
  
  void move(chessPiece[][] board,int r, int c){
    boolean isCapture = (board[r][c]!=null);
    super.move(board,r,c);
    moveLog(this,row,col,r,c,isCapture,false,false,false);
    
  }
  
  
  ArrayList<String> allowedMoves(chessPiece[][] board){
    ArrayList<String> moves = new ArrayList<>();
    int[][] moveSet={
      {-2,-1},{-2,1},{-1,-2},{-1,2},{1,-2},{1,2},{2,-1},{2,1}
    };
    
    for(int[] direction:moveSet){
      int newRow = row+direction[0];
      int newCol = col+direction[1];
      if (inBounds(newRow,newCol)){
        if(board[newRow][newCol]==null||(board[newRow][newCol].white!= this.white && !(board[newRow][newCol]instanceof King))){
          moves.add("" + newRow+""+newCol); 
        }
      }
    }
    return filterIllegalMoves(moves,board);
  }
  
  boolean inBounds(int r, int c){
    return r>=0 && r<8 && c>=0 && c<8;
  }
}
