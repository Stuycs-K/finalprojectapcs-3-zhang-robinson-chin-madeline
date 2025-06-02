chessPiece[][] board;
ArrayList<String> history;
boolean turn;
PImage wPawn, bPawn, wRook, bRook, wKnight, bKnight, wBishop, bBishop,
wQueen, bQueen, wKing, bKing;
void setup() {
  size(1000,1000);
  loadImgs();
  board = new chessPiece[8][8];
  //history = new ArrayList<>();
  
  for (int y = 0; y < 8; y++) {
    board[1][y] = new Pawn(1, y, false); 
    board[6][y] = new Pawn(6, y, true);   
  }
  
  board[0][0] = new Rook(0, 0, false);
  board[0][7] = new Rook(0, 7, false);
  board[7][0] = new Rook(7, 0, true);
  board[7][7] = new Rook(7, 7, true);

  board[0][1] = new Knight(0, 1, false);
  board[0][6] = new Knight(0, 6, false);
  board[7][1] = new Knight(7, 1, true);
  board[7][6] = new Knight(7, 6, true);

  board[0][2] = new Bishop(0, 2, false);
  board[0][5] = new Bishop(0, 5, false);
  board[7][2] = new Bishop(7, 2, true);
  board[7][5] = new Bishop(7, 5, true);

  board[0][3] = new Queen(0, 3, false);
  board[7][3] = new Queen(7, 3, true);

  board[0][4] = new King(0, 4, false);
  board[7][4] = new King(7, 4, true);

  history = new ArrayList<String>();
  turn = true; //false will be 'white' and true will be 'black'
}
void grid() {
  for (int y = 0; y < width / 125; y++) {
    for (int z = 0; z < height / 125; z++) {
      if ((y + z) % 2 == 0) {
        fill(255,255,255);
      }
      else {
      fill(40,40,40);
      }
      rect(y*125,z*125,125,125);
    }
  }
}

void loadImgs(){
  wPawn=loadImage("wPawn.png");
  bPawn=loadImage("bPawn.png");
  wRook=loadImage("wRook.png");
  bRook=loadImage("bRook.png");
  wKnight=loadImage("wKnight.png");
  bKnight=loadImage("bKnight.png");
  wBishop=loadImage("wBishop.png");
  bBishop=loadImage("bBishop.png");
  wQueen=loadImage("wQueen.png");
  bQueen=loadImage("bQueen.png");
  wKing=loadImage("wKing.png");
  bKing=loadImage("bKing.png");

}
void putP() {
  for (int row = 0; row<8;row++) {
    for (int col = 0; col<8; col++){
      chessPiece p = board[row][col];
      if (p!=null){
        PImage img = getImage(p);
        if(img!=null){
          image(img,col*125,row*125,125,125);
        }
      }
    }
  }
}
/*
PImage getImage(chessPiece p){
  String preColor;
  String type = p.getPiece();
  if (p.white){
    preColor="w";
  }
  else{
    preColor ="b";
  }
} */

PImage getImage(chessPiece p){
  String type = p.getPiece();
  if (p.white){
    if (type.equals("Pawn")) {
      return wPawn;
    }
    if (type.equals("Rook")) {
      return wRook;
    }
    if (type.equals("King")) {
      return wKing;
    }
    if (type.equals("Queen")) {
      return wQueen;
    }
    if (type.equals("Bishop")) {
      return wBishop;
    }
    if (type.equals("Knight")) {
      return wKnight;
    }
  }
  else{
    if (type.equals("Pawn")) {
      return bPawn;
    }
    if (type.equals("Rook")) {
      return bRook;
    }
    if (type.equals("King")) {
      return bKing;
    }
    if (type.equals("Queen")) {
      return bQueen;
    }
    if (type.equals("Bishop")) {
      return bBishop;
    }
    if (type.equals("Knight")) {
      return bKnight;
    }  }
    return null;
}


void display() {
  grid(); 
  }
  
void draw() {
  background(200);
  display();
  putP();
}

boolean check(boolean turn) {
  int row = -1;
  int col = -1;
  for (int y = 0; y < 8; y++) {
    for (int z = 0; z < 8; z++) {
      chessPiece hold = board[y][z];
      if (hold instanceof King && hold.white == turn) {
        row = y;
        col = z;
      }
    }
  }
  if (row == -1 || col == -1) {
    println("king not found");
    return false;
  }
  for (int y = 0; y < 8; y++) {
    for (int z = 0; z < 8; z++) {
      if (board[y][z] != null && board[y][z].white != board[row][col].white) {
        if (board[y][z].allowedMoves(board).contains(""+row+col)) {
          return true;
        }
      }
    }
  }
  return false;
}


  
//moved castling 
