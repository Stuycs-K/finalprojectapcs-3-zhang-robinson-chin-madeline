class King extends chessPiece{
  King(int r, int c, boolean white) {
    super(r,c,white);
  }
  ArrayList<String> allowedMoves(Piece[][] board) {
    ArrayList<String> moes = new ArrayList<>();
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
  }
}
