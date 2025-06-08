class Pawn extends chessPiece{
  boolean hasMove = false;
  
  Pawn(int r, int c, boolean white){
   super(r,c,white);
  }
  
  String getPiece(){
    return "Pawn"; 
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
      
      if (!hasMove && inBounds(row+2*dir,col)&&board[row+2*dir][col]==null){
        moves.add(""+(row+2*dir)+col);
      }
    }
    int [] sides ={-1,1};
    for (int dx:sides){
      int x=col +dx;
      int y = row+ dir;
      if (inBounds(y,x)){
        if(board[y][x]!=null&& board[y][x].white!=white&& !(board[y][x] instanceof King)){
          moves.add(""+y+x);
        }
        if(board[y][x]==null&&
        /*board[row][x]!=null&&*/
        board[row][x] instanceof Pawn&&
        board[row][x]==lastDoubleStep&&
        ((white && row ==3)|| (!white && row ==4))){
          println("a");
          moves.add(""+y+x);
          }
        }
      }
    return moves;
  }
  
  
  void move(chessPiece[][] board, int r, int c){
    boolean isCapture = (Math.abs(c-col)==1 && 
    (board[r][c]!=null || 
    (board[row][c] instanceof Pawn && 
    board[r][c]==null)));
    boolean promotion = ((white && r==0)|| (!white&& r ==7));
    moveLog(this, row,col,r,c,isCapture,promotion,false,false);
    if (Math.abs(c-col)==1&&board[r][c]==null
  /*  && board[row][c]!=null*/
    && board[row][c] instanceof Pawn){
      println("b");
      board[row][c]=null;
    }
    int oldRow = row;
    super.move(board,r,c);
    hasMove=true;
    if (Math.abs(r-oldRow)==2){
      lastDoubleStep=this;
    }
    else{
      lastDoubleStep=null;
    }
   if ((white&&row==0) || (!white && row ==7)){
      board[row][col]=new Queen(row,col,white);
    }
  }
  
  boolean inBounds(int r, int c){
    return r>=0 && r<8 && c>=0 && c<8;
  }
}
