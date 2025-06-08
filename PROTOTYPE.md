
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
![UML Diagram](https://lucid.app/publicSegments/view/e63b292b-ff1f-427b-a795-b20ecca3c4a9/image.png)  


Outline:
1. Game
	- initiates board
	- starts game with one player's turn
	- allows the player to move one piece (according to the type) to a valid space before switching turns
	- moves continue according to whose turn it is
	- checks if the game has reached a checkmate and determines a winner
2. APiece (abstract)
	- basis for all pieces
	- includes row and col according to location on the board
	- checks for preexisting piece in a certain square/coordinates
	- creates an array of allowed moves for a piece, so it can be looped
  through to check for move allowability
	- allows a preexisting piece to be replaced  
	- ~~checks if player is allowed to move to a certain square/place on the board (will replace preexisting piece)~~ (removed for changed
	methodology and clarity purposes)
	- handles edge cases like castling
3. Pawn
	- piece can move one space forward at a time
	- if a piece is located in a forward diagonal, it may capture and move there; otherwise, it may not move diagonally
	- change to Queen piece when reaching he other end of the board is handled as an edge case in Game
4. Rook
	- can move down rows or columns
	- castling handled ~~in Game~~ (castling now handled in ~~Rook,~~ King, and APiece) (I did not know Rooks
	could not initiate castling)
5. Knight
	- can move in L shapes (two spaces one direction and one in a perpendicular direction to the first)
6. Bishop
	- can move diagonally on the board
7. Queen
	- can move in all directions
8. King
	- can move in all directions, but only one space at a time
	- castling handled ~~in Game~~ (castling now handled in ~~Rook,~~ King, and APiece)

# Intended pacing:

Robinson:
1. Logic
   - Checkmate/stalemate logic and execution
	 		- Pieces unable to eat King
   - Highlight

2. Board Setup
   - ~~Setup a 8 by 8 board as a 2D array~~ (maddie stole it)
   - Import all images
   - ~~Work on abstract Piece class~~ (mostly maddie)
	 - ~~History bar~~ (shared)

3. Pawn
   - One space forward
   - Two spaces on first move
	 - Can't move backwards
   - Diagonal capture
   - ~~En passant~~ (robby gave up :( sharing now!!!)
   - Pawn promotion to Queen

4. Knight
   - L shaped movement and capture
   - Can jump over pieces

5. Bishop
   - Diagonal movement and capture

Maddie:
1. Logic
   - Work on check ~~and checkmate logic~~ (gave it to robby)
   - ~~Check for legal and illegal moves~~ (we both did this in our own respective classes)
   - Castling (in King and APiece class)
	 - Mouse-click moving

2. Board Setup
   - Setup a checkered 8 by 8 board as a 2D array
   - Put the correct pieces in the array so they display properly
   - Move execution/player turns

3. APiece
   - Abstract/base methods (robby helped a little)

4. Rook
   - Horizontal and vertical movement and capture

5. Queen
   - Combination of Rook and Bishop movement and capture

6. King
   - One square in any direction and capture
	 - Initiates castling (click on King then Rook when no pieces are in the way)
   - Can't put themselves in check/checkmate


Shared:
   - Play though the game
       - ~~Legal and illegal moves~~ (already stated)
       - Capturing
       - ~~Turn switching~~ (easily handled by one person)
	- Allowed moves for each piece
	- En passant
  - Debug
  - Clean up redundant code
  - Add comments throughout the coding process
	- Make preset boards
  - Prepare demo and walk-through for presentation
  - History bar ~~(robby has to do this now)~~ (we're share it again)

A timeline with expected completion dates of parts of the project:

Phase 1: Setup and planning (May 21)
  - Finalize decision on which game to code
  - Assign roles and responsibilities
  - Set up Github Repo and Branches

Phase 2: Core game framework (May 28)
  - Initialize 8 by 8 board with all pieces
  - Turn tracking implementation
  - Code Piece abstract class
  - Moves for all pieces:
    	- Pawn: single/double movement and diagonal capture
    	- Knight: L shaped movement and capture, jumping over pieces
    	- Bishop: Diagonal movement and capture
    	- Rook: Vertical and horizontal movement and capture
    	- Queen: 8 direction movement
    	- King: 1 step all directions     

Phase 3: Rules and edge cases (May 30)
  - Castling
  - En passant
  - Pawn Promotion
  - King can't move into check and has to be saved from check
  - Check detection and checkmate detection

Phase 4: Testing and Polishing (June 1)
  - Play through the game to catch bugs
  - Test:
      - Legal and illegal moves
      - Check/checkmate logic
      - Switching and capturing
      - Any UI tweaks
  - Prepare demo and presentation

Phase 5: Cleaning up (June 9)
  - Clean up any errors
  - Make the board pretty
  - Finish up any faulty/remaining methods (castling, checkmate, highlight, move log)
	- Add preset boards for demo and testing
  - Video!
