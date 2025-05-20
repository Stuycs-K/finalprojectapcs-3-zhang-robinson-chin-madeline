
# Technical Details:

We will be using an overall Game class for the actual playing (this is also where edge cases will
be handled, such as castling), with an abstract subclass called Piece. Under Piece, 
we will have individual subclasses for each chess piece (King, Queen, etc.) to establish each piece's 
unique moves and edge cases. A 2D array will be used to keep track of the chess board and moves the players
make, using knowledge from labs such as N-Queens to understand possible moves and positions.
     
# Project Design

PERIOD 3  
Maddie Chin and Robinson Zhang  
Group Name  
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
|Game                 |							|Piece              |
|:--------------------|							|:------------------|
|board : int[][]      |							|x : int			|
|start()              |							|y : int            |
|move(row, col)       |							|turn : boolean     |
|checkmate() : boolean|							|canMove() : boolean|
															|
							-------------------------------------------------------------
							|Pawn |  |Rook  |  |Knight  |  |Bishop  |   |Queen |  |King |


    
# Intended pacing:

How you are breaking down the project and who is responsible for which parts.

A timeline with expected completion dates of parts of the project. (CHANGE THIS!!!!!)

