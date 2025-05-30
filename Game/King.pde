class King extends chessPiece{
  boolean castle;
  public King(int r, int c, boolean white) {
    super(r,c,white);
    //castle = false;
  }
  ArrayList<String> allowedMoves(chessPiece[][] board) {
    ArrayList<String> moves = new ArrayList<>();
      if (board[this.row-1][this.col] == null) {
        moves.add(""+(this.row-1)+this.col);
      }
      else if (board[this.row-1][this.col].white != this.white) {
          moves.add(""+(this.row-1)+this.col);
        }
    
      if (board[this.row+1][this.col] == null) {
        moves.add(""+(this.row+1)+this.col);
      }
      else if (board[this.row+1][this.col].white != this.white) {
          moves.add(""+(this.row+1)+this.col);
        }
 
    
    if (board[this.row][this.col - 1] == null) {
        moves.add(""+this.row+(this.col-1));
      }
      else if (board[this.row][this.col - 1].white != this.white) {
          moves.add(""+(this.row)+(this.col - 1));
        }
        
    if (board[this.row][this.col + 1] == null) {
        moves.add(""+this.row+(this.col+1));
      }
      else if (board[this.row][this.col +1].white != this.white) {
          moves.add(""+(this.row)+(this.col + 1));
        }
    
    if (board[this.row+1][this.col + 1] == null) {
        moves.add(""+(this.row+1)+(this.col+1));
      }
      else if (board[this.row+1][this.col + 1].white != this.white) {
          moves.add(""+(this.row+1)+(this.col + 1));
        }
    
    if (board[this.row-1][this.col - 1] == null) {
        moves.add(""+(this.row-1)+(this.col-1));
      }
      else if (board[this.row-1][this.col - 1].white != this.white) {
          moves.add(""+(this.row-1)+(this.col - 1));
        }
    
    if (board[this.row-1][this.col + 1] == null) {
        moves.add(""+(this.row-1)+(this.col+1));
      }
      else if (board[this.row-1][this.col + 1].white != this.white) {
          moves.add(""+(this.row-1)+(this.col + 1));
        }
    
    if (board[this.row+1][this.col - 1] == null) {
        moves.add(""+(this.row+1)+(this.col-1));
      }
      else if (board[this.row+1][this.col - 1].white != this.white) {
          moves.add(""+(this.row+1)+(this.col - 1));
        }
        
        boolean king1 = true;
        boolean king2 = true; 
        boolean king3 = true;
  for (int z = 0; z < history.size(); z++) {
    if (this.white){
      if (history.get(z).contains("74")) {
        king3 = false;
      }
        if(history.get(z).contains("70")){
      king1 = false;
    }
    if(history.get(z).contains("77")){
      king2 = false;
    }
    
    }
    else {
      if (history.get(z).contains("04")) {
        king3= false;
      }
        if(history.get(z).contains("00")){
      king1 = false;
    }
    if(history.get(z).contains("07")){
      king2 = false;
    }
    }
  }
      if (this.white) {
        if (king3) {
        if(king1) {
          for (int y = this.col - 1; y >= 0; y--) {
            if (y == 0) {
              moves.add(""+this.row+y);
              castle = true;
            }
            if (board[this.row][y] != null) {
              break;
            }
          }
        }
        if(king2) {
          for (int y = this.col + 1; y < 8; y++) {
            if (y == 7) {
              moves.add(""+this.row+y);
              castle = true;
            }
            if (board[this.row][y] != null) {
              break;
            }
          }
        }
      
      }
      }
      
      else {
        if (king3) {
        if(king1) {
          for (int y = this.col - 1; y >= 0; y--) {
            if (y == 0) {
              moves.add(""+this.row+y);
              castle = true;
            }
            if (board[this.row][y] != null) {
              break;
            }
          }
        if(king2) {
          for (int y = this.col + 1; y < 8; y++) {
            if (y == 7) {
              moves.add(""+this.row+y);
              castle = true;
            }
            if (board[this.row][y] != null) {
              break;
            }
          }
        }
      }
      }
      }
     ArrayList<String> moves1 = new ArrayList<>();
     for (String move : moves) {
     int row1 = Integer.parseInt(move.substring(0, 1));
     int col1 = Integer.parseInt(move.substring(1, 2));
     chessPiece opp = board[row1][col1]; 
     int holdr= this.row;
     int holdc = this.col;
     
     board[row1][col1] = this;
     board[holdr][holdc] = null;
     this.row=row1;
     this.col=col1;
     if (!checked(board,row1,col1)) {
       moves1.add(move);
     }
     board[row1][col1] = opp; 
     board[holdr][holdc] = this;
     this.row=holdr;
     this.col=holdc;
     }
     return moves1;
  }
  
  boolean checked(chessPiece[][] board, int r, int c) {
    for (int y = 0; y < 8; y++) {
      for (int z = 0; z < 8; z++) {
        chessPiece emmy= board[y][z];
        if (emmy != null && emmy.white != this.white) {
          ArrayList<String> movess = emmy.allowedMoves(board);
          if (movess.contains(""+r+c)) {
            return true;
          }
        }
      }
    }
    return false;
  }
}
