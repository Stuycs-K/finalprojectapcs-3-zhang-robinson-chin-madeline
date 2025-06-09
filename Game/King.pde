class King extends chessPiece{
  boolean castle;
  boolean check = false;
  boolean hasMoved = false;
  public King(int r, int c, boolean white) {
    super(r,c,white);
    //castle = false;
  }

  
  String getPiece(){
    return "King"; 
  } 
  ArrayList<String> allowedMoves(chessPiece[][] board) {
    ArrayList<String> moves = new ArrayList<>();
      if (row - 1 >= 0 && board[this.row-1][this.col] == null) {
        moves.add(""+(this.row-1)+this.col);
      }
      else if (row - 1 >= 0 && board[this.row-1][this.col].white != this.white) {
          moves.add(""+(this.row-1)+this.col);
        }
    
      if (row + 1 < 8 && board[this.row+1][this.col] == null) {
        moves.add(""+(this.row+1)+this.col);
      }
      else if (row + 1 < 8 && board[this.row+1][this.col].white != this.white) {
          moves.add(""+(this.row+1)+this.col);
        }
 
    
    if (col - 1 >=0 && board[this.row][this.col - 1] == null) {
        moves.add(""+this.row+(this.col-1));
      }
      else if (col - 1 >=0 && board[this.row][this.col - 1].white != this.white) {
          moves.add(""+(this.row)+(this.col - 1));
        }
        
    if (col + 1 <8 && board[this.row][this.col + 1] == null) {
        moves.add(""+this.row+(this.col+1));
      }
      else if (col + 1< 8 && board[this.row][this.col +1].white != this.white) {
          moves.add(""+(this.row)+(this.col + 1));
        }
    
    if (row + 1 < 8 && col+1 <8 && board[this.row+1][this.col + 1] == null) {
        moves.add(""+(this.row+1)+(this.col+1));
      }
      else if (row + 1 < 8 && col+1 <8 && board[this.row+1][this.col + 1].white != this.white) {
          moves.add(""+(this.row+1)+(this.col + 1));
        }
    
    if (row - 1 >=0 && col-1 >=0 &&board[this.row-1][this.col - 1] == null) {
        moves.add(""+(this.row-1)+(this.col-1));
      }
      else if (row - 1 >=0 && col-1 >=0 && board[this.row-1][this.col - 1].white != this.white) {
          moves.add(""+(this.row-1)+(this.col - 1));
        }
    
    if (row - 1 >=0 && col+1 <8 &&board[this.row-1][this.col + 1] == null) {
        moves.add(""+(this.row-1)+(this.col+1));
      }
      else if (row - 1 >=0 && col+1 <8 &&board[this.row-1][this.col + 1].white != this.white) {
          moves.add(""+(this.row-1)+(this.col + 1));
        }
    
    if (row +1 <8 && col-1 >=0 && board[this.row+1][this.col - 1] == null) {
        moves.add(""+(this.row+1)+(this.col-1));
      }
      else if (row +1 <8 && col-1 >=0 && board[this.row+1][this.col - 1].white != this.white) {
          moves.add(""+(this.row+1)+(this.col - 1));
        }
     /*   
        if (!check){
        boolean king1 = true;
        boolean king2 = true; 
        boolean king3 = true;
  //for (int z = 0; z < history.size(); z++) {
    for (String wop : history) {
      String[] swish = wop.split(" ");
      if (swish.length > 0) {
    if (this.white){
      if (swish[0].equals("74")) {
        king3 = false;
      }
        if(swish[0].equals("70")){
      king1 = false;
    }
    if(swish[0].equals("77")){
      king2 = false;
    }
    
    }
    else {
      if (swish[0].equals("04")) {
        king3= false;
      }
        if(swish[0].equals("00")){
      king1 = false;
    }
    if(swish[0].equals("07")){
      king2 = false;
    }
    }
  }
    }
      if (this.white) {
        if (king3) {
        if(king1) {
          for (int y = this.col - 1; y >= 0; y--) {
            if (y == 0 && board[this.row][y] instanceof Rook && board[this.row][y].white == this.white) {
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
            if (y == 7&& board[this.row][y] instanceof Rook && board[this.row][y].white == this.white) {
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
            if (y == 0 && board[this.row][y] instanceof Rook && board[this.row][y].white == this.white) {
              moves.add(""+this.row+y);
              castle = true;
            }
            if (board[this.row][y] != null) {
              break;
            }
          }
        if(king2) {
          for (int y = this.col + 1; y < 8; y++) {
            if (y == 7 && board[this.row][y] instanceof Rook && board[this.row][y].white == this.white) {
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
        }*/
        if(!this.hasMoved) {
          for (int y = this.col + 1; y < 8; y++) {
            if (y == 7 && board[this.row][y] instanceof Rook && board[this.row][y].white == this.white) {
              Rook tar = (Rook)board[this.row][y];
              if(!tar.hasMoved){
              moves.add(""+this.row+y);
              castle = true;
            }
            }
            if (board[this.row][y] != null) {
              break;
            }
        }
          for (int y = this.col - 1; y >= 0; y--) {
            if (y == 0 && board[this.row][y] instanceof Rook && board[this.row][y].white == this.white) {
              Rook tar = (Rook)board[this.row][y];
              if(!tar.hasMoved){
              moves.add(""+this.row+y);
              castle = true;
            }
            }
            if (board[this.row][y] != null) {
              break;
            }
          }
        }
      
      if (check) {
        return moves;
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
          check = true;
          Game.kingSafe = false;
          ArrayList<String> movess = emmy.allowedMoves(board);
          Game.kingSafe = false;
          check = false;
          if (movess.contains(""+r+c)) {
            return true;
          }
        }
      }
    }
    return false;
  }
  
  void move(chessPiece[][] board, int r, int c){
    boolean isCastleKing=(col==4&&c==6);
    boolean isCastleQueen = (col==4 && c==2);
    boolean isCastling = isCastleKing|| isCastleQueen;
    boolean isCapture= !isCastling &&board[r][c]!=null;
    
    moveLog(this,row,col,r,c,isCapture,false,isCastleKing,isCastleQueen);
    
    super.move(board,r,c);
    hasMoved = true;
  }
} 
