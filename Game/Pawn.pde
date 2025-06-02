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
      if (inBounds(x,y)){
        if(board[y][x]!=null&& board[y][x].white!=white){
          moves.add(""+y+x);
        }
        else if(board[y][x]==null&&board[row][x] instanceof Pawn){
          Pawn target = (Pawn) board[row][x];
          if (target.white != white && target  == Game.lastDoubleStep&& ((white && row ==3)||(!white && row ==4))){
            moves.add(""+y+x);
          }
        }
      }
    }
    return moves;
  }
  
  void move(chessPiece[][] board, int r, int c){
    if (Math.abs(c-col)==1&&board[r][c]==null){
      board[row][c]=null;
    }
    int oldRow = row;
    
    super.move(board,r,c);
    hasMove=true;
    
    if (Math.abs(r-oldRow)==2){
      Game.lastDoubleStep=this;
    }
    else{
      Game.lastDoubleStep=null;
    }
    
    if((white && r ==0)|| (!white&&r==7)){
      board[r][c]=new Queen(r,c,white);
    }
  }
  
  boolean inBounds(int r, int c){
    return r>=0 && r<8 && c>=0 && c<8;
  }
}
