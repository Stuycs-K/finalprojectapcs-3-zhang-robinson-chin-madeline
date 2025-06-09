abstract class chessPiece{
int row;
int col;
boolean white;

public chessPiece(int r, int c, boolean white) {
  this.row=r;
  this.col=c;
  this.white = white;
}


abstract String getPiece();

boolean checkSq(chessPiece[][] board, int r, int c) {
  if (board[r][c] == null) {
    return true;
  }
  else {
    return false;
  }
}

abstract ArrayList<String> allowedMoves(chessPiece[][] board);

boolean kingInCheck(chessPiece[][] board, boolean white){
  for(int r = 0; r<8; r++){
    for(int c =0; c<8;c++){
      chessPiece p = board[r][c];
      if(p!=null && p instanceof King && p.white==white){
        King k = (King)p;
        return k.checked(board,k.row,k.col);
      }
    }
  }
  return false;
}

ArrayList<String> filterIllegalMoves(ArrayList<String>moves,chessPiece[][]board){
  if(!kingSafe){
    return moves;
  }
  ArrayList<String> legalMoves=new ArrayList<>();
  int oldRow = this.row;
  int oldCol = this.col;
  
  for(String move:moves){
    int newRow = Integer.parseInt(move.substring(0,1));
    int newCol = Integer.parseInt(move.substring(1,2));
    chessPiece target=board[newRow][newCol];
    
    board[newRow][newCol]=this;
    board[oldRow][oldCol]=null;
    this.row=newRow;
    this.col=newCol;
    
    kingSafe=false;
    if(!kingInCheck(board,this.white)){
      legalMoves.add(move);
    }
    kingSafe=true;
    board[newRow][newCol]=target;
    board[oldRow][oldCol]=this;
    this.row=oldRow;
    this.col=oldCol;
  }
  return legalMoves;
}

void move(chessPiece[][] board, int r, int c) {
  ArrayList<String> moves = this.allowedMoves(board);
      chessPiece hold = board[r][c];
    if (this instanceof King && hold instanceof Rook && this.white == hold.white) {
      King ur = (King)this;
      if (ur.castle) {
      if (c == 0) {
        history.add(""+this.row+this.col+" castles " +r+c);
      board[r][2] = this;
       board[r][3] = hold;
      board[this.row][this.col] = null;
      board[r][c] = null;
      this.col = 2;
      this.row = r;
      hold.col = 3;
      hold.row = r;
      //turn = !turn;
      return;
      }
      if (c == 7) {
        history.add(""+this.row+this.col+" castles " +r+c);
      board[r][6] = this;
      board[this.row][this.col] = null;
      board[r][5]=hold;
      board[r][c] = null;
      this.col = 6;
      this.row=r;
      hold.col = 5;
      //turn = !turn;
      return;
      }
    }
    }
   // for (int y = 0; y < moves.size(); y++) {
  //  if ((""+this.row+this.col).equals(moves.get(y))) {
    if (moves.contains(""+r+c)) {
       
    //history.add(""+this.row+this.col+" to " +r+c);
      board[r][c] = this;
      board[this.row][this.col] = null;
      row = r;
      col = c;
      return;
    }
    //}
//  }
}
}

//I like dont think we need capture??
  
