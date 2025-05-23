
# Technical Details:

We will be using an overall Game class for the actual playing (this is also where edge cases will
be handled, such as castling), with an abstract subclass called Piece. Under Piece,
we will have individual subclasses for each chess piece (King, Queen, etc.) to establish each piece's
unique moves and edge cases. A 2D array will be used to keep track of the chess board and moves the players
make, using knowledge from labs such as N-Queens to understand possible moves and positions.

# Project Design

PERIOD 3  
Maddie Chin and Robinson Zhang  
A Rooky Mistake  
Brief Project description: Chess played according to the standardized rules on an
8x8 board. Two players will take turns moving one of their pieces (king, queen, rook,
bishop, knight, or pawn) to an appropriate spot. The game will include correct
movement mechanics and capturing rules, including edge cases (such as how a pawn can
move two spaces on its first move or castling). The game will end when some player
checkmates the other’s king with no possible way to escape. If possible during the time
frame, we would also like to implement the additional features to make the regular chess
into boom chess, including the ability to skip a turn to blow up a random square on the
board.  


UML Diagram:  
|Game                 |
|--|
|board : int[][] |
|start() |
|move(row,col) |
|checkmate() : boolean |
|turn : boolean|				

|Piece              |
|----------|		
|x : int			|
|y : int            |
|isPiece() : boolean|
|canMove() : boolean|

### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
&nbsp;
|Pawn | Rook | Knight | Bishop | Queen | King |
|--|--|--|--|--|--|  


Outline:
1. Game
	- initiates board
	- starts game with one player's turn
	- allows the player to move one piece (according to the type) to a valid space before switching turns
	- moves continue according to whose turn it is
	- checks if the game has reached a checkmate and determines a winner
2. Piece (abstract)
	- basis for all pieces
	- includes row and col according to location on the board
	- checks for preexisting piece in a certain square/coordinates
	- creates an array of allowed moves for a piece, so it can be looped
  through to check for move allowability
  - allows a preexisting piece to be replaced
	~~- checks if player is allowed to move to a certain square/place on the board (will replace preexisting piece)~~
3. Pawn
	- piece can move one space forward at a time
	- if a piece is located in a forward diagonal, it may capture and move there; otherwise, it may not move diagonally
	- change to Queen piece when reaching he other end of the board is handled as an edge case in Game
4. Rook
	- can move down rows or columns
	- castling handled in Game
5. Knight
	- can move in L shapes (two spaces one direction and one in a perpendicular direction to the first)
6. Bishop
	- can move diagonally on the board
7. Queen
	- can move in all directions
8. King
	- can move in all directions, but only one space at a time

# Intended pacing:

How you are breaking down the project and who is responsible for which parts.

A timeline with expected completion dates of parts of the project. (CHANGE THIS!!!!!)
