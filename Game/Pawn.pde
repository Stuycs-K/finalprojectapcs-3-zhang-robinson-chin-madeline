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
      
      if (!hasMove && board[row+2*dir][col]==null){
        moves.add(""+(row+2*dir)+col);
      }
    }
    int [] sides ={-1,1};
    for (int dx:sides){
      int x=col +dx;
      int y = col+ dir;
      if (inBounds(x,y)){
        if(board[y][x]!=null&& board[y][x].white!=white){
          moves.add(""+y+x);
        }
        else if(board[y][x]==null&&board[row][x] instanceof Pawn){
          Pawn target = (Pawn) board[row][x];
          if (target.white != white && target  == Game.){
          }
        }
      }
    }
    return moves;
  }
  
  void move(chessPiece[][] board, int r, int c){
    super.move(board,r,c);
    hasMove=true;
  }
  
  boolean inBounds(int r, int c){
    return r>=0 && r<8 && c>=0 && c<8;
  }
}
