chessPiece[][] board;
ArrayList<String> history;
boolean turn;
PImage wPawn, bPawn, wRook, bRook, wKnight, bKnight, wBishop, bBishop,
wQueen, bQueen, wKing, bKing;
public static Pawn lastDoubleStep=null;
static boolean kingSafe=true;
int[] kingIsInCheck=null;
boolean gameOver= false;
String gameOverMessage ="";

ArrayList<String> highlightSquares=new ArrayList<String>();
void setup() {
  size(1300,1070);
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
      fill(196,164,132);
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

void keyPressed() {
  if (key == 'c' || key == 'C') {
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

 /* board[0][1] = new Knight(0, 1, false);
  board[0][6] = new Knight(0, 6, false);
  board[7][1] = new Knight(7, 1, true);
  board[7][6] = new Knight(7, 6, true);

  board[0][2] = new Bishop(0, 2, false);
  board[0][5] = new Bishop(0, 5, false);
  board[7][2] = new Bishop(7, 2, true);
  board[7][5] = new Bishop(7, 5, true);

  board[0][3] = new Queen(0, 3, false);
  board[7][3] = new Queen(7, 3, true); */

  board[0][4] = new King(0, 4, false);
  board[7][4] = new King(7, 4, true);

  history = new ArrayList<String>();
  turn = true;
  hold=null;
  highlightSquares.clear();
  gameOver=false;
  gameOverMessage="";
}
if (key == 'p' || key == 'P') {
      loadImgs();
  board = new chessPiece[8][8];
  //history = new ArrayList<>();
  
  for (int y = 0; y < 8; y++) {
    board[1][y] = new Pawn(1, y, false); 
    board[6][y] = new Pawn(6, y, true);   
  }
  board[6][6] = null;
  board[1][6] = new Pawn(1,6,true);
  board[0][6] = null;
  
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
  turn = true;
  hold=null;
  highlightSquares.clear();
  gameOver=false;
  gameOverMessage="";
}

if (key == 's' || key == 'S') {
      loadImgs();
  board = new chessPiece[8][8];
  //history = new ArrayList<>();
  
  board[0][0] = new King (0,0,false);
  board[1][5] = new Queen(1,5,true);
  board[4][2] = new King (4,2,true);

    history = new ArrayList<String>();
  turn = true;
  hold=null;
  highlightSquares.clear();
  gameOver=false;
  gameOverMessage="";
}

if (key == 'x' || key == 'X') {
      loadImgs();
  board = new chessPiece[8][8];
  board[0][6] = new King(0,6,false);
  board[0][5] = new Rook(0,5,false);
  board[1][5] = new Pawn(1,5,false);
  board[1][7] = new Pawn(1,7,false);
  
  board[6][1] = new Bishop(6,1,true);
  board[7][5] = new Queen(7,5,true);
  board[7][7] = new King(7,7,true);


    history = new ArrayList<String>();
  turn = true;
  hold=null;
  highlightSquares.clear();
  gameOver=true;
  gameOverMessage="";
}
}

void display() {
  grid(); 
  }
  
  
void checkEndGame(){
  boolean current = !true;
  
  if(checkmate(current)){
    gameOver=true;
    gameOverMessage = (current ? "White" : "Black") + " is checkmated. " + (current ?"Black":"White") +" wins!";
  }
  else if(stalemate(current)){
    gameOver=true;
    gameOverMessage="Stalemate! It's a draw.";
  }
}
chessPiece hold = null;
void mousePressed() {
  int row = mouseY / 125;
  int col = mouseX / 125;
  if (row<0||row>7||col<0||col>7){
    return;
  }
  if (hold == null) {
    chessPiece piece = board[row][col];
    if (piece!=null&& piece.white == turn){
    hold=piece;
    highlightSquares = piece.allowedMoves(board); 
  } else {
    highlightSquares = new ArrayList<String>();
  }
}else {
    ArrayList<String> moves = hold.allowedMoves(board);
    
    if (hold instanceof King && board[row][col] instanceof Rook) {
      if (hold.white == board[row][col].white) {
        int r = hold.row;
        int rookCol=board[row][col].col;
        int kingTarget = (rookCol==0)?2:6;
        int rookTarget = (rookCol==0)?3:5;
        
        board[r][kingTarget]=hold;
        board[r][4]=null;
        hold.col =kingTarget;
        
        board[r][rookTarget]=board[row][col];
        board[row][col]=null;
        board[r][rookTarget].col=rookTarget;
        
        ((King)hold).hasMoved=true;
        ((Rook)board[r][rookTarget]).hasMoved=true;
        
        moveLog(hold,r,4,r,kingTarget,false,false,kingTarget==6,kingTarget==2);
        turn=!turn;
        hold=null;
        highlightSquares.clear();
        checkEndGame();
        return;
      }
    }
    if (moves.contains(""+row+col)) {
     
    /*  board[row][col] = hold;
      board[hold.row][hold.col] = null;
      hold.row = row; 
      hold.col = col;
      //hold = null; */
      hold.move(board,row,col);
      if (hold instanceof Pawn && Math.abs(hold.row - row) == 2) {
        lastDoubleStep=null;
      }
      turn = !turn;
      checkEndGame();
    }
    hold = null;
    highlightSquares = new ArrayList<String>();
  }
}

void highlightMoves(){
  noStroke();
  fill(0,255,0,120);
  for (String move: highlightSquares){
    int row = int (move.substring(0,1));
    int col = int(move.substring(1,2));
    ellipse(col*125+62,row*125+62,80,80);
  }
}

void highlightSelectedPiece(){
  if (hold !=null){
    fill(255,255,0,120);
    rect(hold.col*125,hold.row*125,125,125);
  }
}
void draw() {
  background(200);
  display();
  highlightSelectedPiece();
  highlightMoves();
  highlightCheck();
  putP();
  historyLog();
  textSize(20);
  fill(0);
  text("Board Presets:",20,1010);
  textSize(18);
  text("c/C - castling",25,1030);
  text("p/P - pawn promotion",25,1050);
  kingIsInCheck=null;
  if(check(!turn)){
    for(int i = 0;i<8;i++){
      for(int j = 0; j<8;j++){
        chessPiece p = board[i][j];
        if(p instanceof King && p.white == !turn){
          kingIsInCheck=new int[]{i,j};
        }
      }
    }
  }
  
  text("s/S - stalemate",250,1030);
  text("x/X - checkmate",250,1050);
  if(gameOver){
    fill(0);
    textSize(32);
    textAlign(CENTER,CENTER);
    text(gameOverMessage,width/2,height-40);
  }
}

void highlightCheck(){
  if(kingIsInCheck !=null){
    fill(255,0,0,100);
    rect(kingIsInCheck[1]*125,kingIsInCheck[0]*125,125,125);
  }
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
        break;
      }
    }
  }
  if (row == -1 || col == -1) {
    println("king not found");
    return false;
  }
  
  for (int y = 0; y < 8; y++) {
    for (int z = 0; z < 8; z++) {
      if (board[y][z] != null && board[y][z].white != turn) {
        chessPiece attacker = board[y][z];
        Game.kingSafe=false;
        ArrayList<String> moves = attacker.allowedMoves(board);
        Game.kingSafe=true;
        if (moves.contains("" +row+col)){
          return true;
        }
      }
    }
  }
  return false;
}

boolean checkmate (boolean chessColor){
  if (!check(chessColor)){
    return false;
  }
  for (int i = 0; i<8;i++){
    for (int j=0;j<8;j++){
      chessPiece piece = board[i][j];
      if(piece!=null&& piece.white==chessColor){
        ArrayList<String> moves = piece.allowedMoves(board);
        for (String move: moves){
          int r =Integer.parseInt(move.substring(0,1));
          int c =Integer.parseInt(move.substring(1,2));
          
          chessPiece capture = board[r][c];
          int oldR = piece.row;
          int oldC = piece.col;
          board[r][c]=piece;
          board[oldR][oldC] = null;
          piece.row=r;
          piece.col=c;
          
          boolean kingInCheck = check(chessColor);
          
          board[oldR][oldC] = piece;
          board[r][c]=capture;
          piece.row=oldR;
          piece.col=oldC;
          
          if(!kingInCheck){
            return false;
          }
        }
      }
    }
  }
  return true;
}

String col(int col){
  return ""+(char)('a'+col);
}
String row(int row){
  return ""+(8-row);
}

String pieceLetter(chessPiece p){
  String name = p.getPiece();
  if (name.equals("Knight")){
    return "N";
  }
    if (name.equals("King")){
    return "K";
  }
    if (name.equals("Queen")){
    return "Q";
  }
    if (name.equals("Rook")){
    return "R";
  }  if (name.equals("Bishop")){
    return "B";
  }
  return "";
}
void historyLog(){
  fill (240);
  rect(1000,0,300,1000);
  fill(0);
  textSize(24);
  textAlign(LEFT,TOP);
  text("Move log",1020,20);
  textSize(16);
  int show = 36;
  int start=max(0,history.size()-show);
  for(int i = start;i<history.size();i++){
    int number = i/2+1;
    String initial = history.get(i);
    String base = initial.replace("+","").replace("#", "");
    boolean isCheck=initial.contains("+");
    boolean isCheckmate=initial.contains("#");
    
    String display = (i%2==0 ? number + ". " : "") + base;
    
    fill(0);
    text(display,1020,60+(i-start)*28);
    
    if(isCheck||isCheckmate){
      fill(255,0,0);
      text(isCheck?"+":"#",1020+textWidth(display),60+(i-start)*28);
    }
  }
}

void moveLog(chessPiece p,int initialR, int initialC, int toR, int toC, boolean capture, boolean promotion, boolean castleKing, boolean castleQueen){
String move = "";
if (castleKing){
  move="O-O";
}
else if (castleQueen){
  move = "O-O-O";
}
else{
  String piece = pieceLetter(p);
  if (piece.equals("K")&& !capture){
      return;
  }
      if(piece.equals("")){
        if (capture){
          if (p instanceof Pawn && ((Pawn)p).ep) {
            move += col(initialC)+ "x" + col(toC) + row(toR) +" e.p.";
        }
        else {
      move += col(toC)+row(toR);
      }
    }else{
      move += col(toC)+row(toR);
    }
  if(promotion) move += "=Q";
  }
  else {
    move+=piece;
    if(capture)move+="x";
    move+=col(toC)+row(toR);
  }
}/*
if (p instanceof Pawn) {
  Pawn pi = (Pawn) p;
  if (pi.ep) {
  move+=" e.p.";
  }
}*/
chessPiece captured = board[toR][toC];
int originalR = p.row;
int originalC=p.col;
board[toR][toC]=p;
board[originalR][originalC]=null;
p.row=toR;
p.col=toC;
boolean isCheckmate=checkmate(!p.white);
boolean isCheck = !isCheckmate && check(!p.white);
board[originalR][originalC]=p;
board[toR][toC]=captured;
p.row=originalR;
p.col=originalC;

if(isCheckmate){
  move+="#";
}else if(isCheck){
  move+="+";
}

if (!p.white)move = "... " + move;
if (!move.equals(""))history.add(move);
}


boolean stalemate (boolean chessColor){
  if (check(chessColor)){
    return false;
  }
  for (int i = 0; i<8;i++){
    for (int j=0;j<8;j++){
      chessPiece piece = board[i][j];
      if(piece!=null&& piece.white==chessColor){
        ArrayList<String> moves = piece.allowedMoves(board);
        for (String move: moves){
          int r =Integer.parseInt(move.substring(0,1));
          int c =Integer.parseInt(move.substring(1,2));
          
          chessPiece capture = board[r][c];
          int oldR = piece.row;
          int oldC = piece.col;
          board[r][c]=piece;
          board[oldR][oldC] = null;
          piece.row=r;
          piece.col=c;
          
          boolean kingInCheck = check(chessColor);
          
          board[oldR][oldC] = piece;
          board[r][c]=capture;
          piece.row=oldR;
          piece.col=oldC;
          
          if(!kingInCheck){
            return false;
          }
        }
      }
    }
  }
  return true;
}
//moved castling 
