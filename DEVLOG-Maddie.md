# Dev Log:

This document must be updated daily every time you finish a work session.

## Maddie Chin

### 2025-05-16 - Worked on Proposals
Robinson and I brainstormed ideas for games in class and worked on the short description/scope. He added it to the repo when he got home.  

### 2025-05-19 - Worked on Prototype
In class we discussed the direction of our project and what we wanted/needed to have. We discussed
the different classes and organization we wanted and how we would implement 
different ideas. When I got home, I spent a few hours typing out the 
technical details, the project design, the UML diagram (done in 
markdown), and the basic outline for our game and methods.  

### 2025-05-20 - Worked on Prototype
Talked with Robinson about work delegation and a general timeline in class. He added 
it to the repo later on.

### 2025-05-23 - Revised outline and UML Diagram
Talked with Mr. K about how our project will realistically function 
and made edits to the outline and methods. When I got home, I remade 
the UML diagram (on a proper website) with the changes in methodology. 

### 2025-05-27 - Began work on the classes/basics.
In class, Robinson added all the individual classes/subclasses and 
I started on the general setup of Game (like the checkered board and the 2D
array for the pieces). When I got home, I instated the abstract Piece class
with the basic methods and worked on the allowedMoves for Rook, Queen, and 
King (took around 2 hours, including the time it took to work out how I wanted the classes
to connect with one another other so they would work properly).  

### 2025-05-28 - Began work on castling.
Robinson and I agrued over the division of work and how to split the classes 
in class today. When I got home, I stuggled on castling for like two hours 
before I got something that might work. 

### 2025-05-29 - Worked on more castling and restricting king movements.
I continued to work on my castling logic before I rudely discovered 
that the rook cannot initiate the castling. I deleted a lot of the 
unecessary code and did my best to clean things up. Then, I began to work on 
making sure the king could not move in a way that would put itself into 
check by modifying allowedMoves and adding a helper method. This all took ~2-3 
hours because I was quite confused and don't really know how to play chess.   

### 2025-05-30 (includes weekend) - Fixed errors, worked on checkmate, made the board work.
During class and at home, I worked on going through all the processing 
errors we had and fixing them (~1 hour). Then, I rewrote the code that 
displayed the board images so all the pieces would show up nicely and load
properly (<45 mins). I updated the prototype and UML diagram to more 
accurately describe our code and I began working on the checkmate method 
of the game (~1 hour). Finally, I realized our board wasn't displaying the 
pieces' moves and only displayed the starting board, so I stop writing the checkmate 
code in favor of fixing that (~1.5 hours).  

### 2025-06-02 - Prepared for demo of MVP and more castling.
During class, Robby and I tried our best to not to break our code before showing 
off the MVP, and we mostly just talked about what else needed to be completed or 
tweaked by next week. Only Robby pushed so I didn't mess things up. We changed the color of the board to be prettier (a light brown :D!) 
and allow for the pieces to be seen more easily. At home, I continued 
to work on castling because it currently does not work properly (~1 hour).   

### 2025-06-03 - I defeated castling.
In class, we discussed what was left to be done of our project. I have to 
at least finish the castling function and make the preset boards for showcasing 
the game's features by Friday. Robby has the other stuff. One of us will 
probably make the move history bar later. Additionally, I identified some 
problem areas with my code regarding castling, and I looked at them more 
closely when I got home. Then, I finally got castling to work as intended (~45 minutes, not including class time).  

### 2025-06-04 - Updated everything and debugged castling.
In class, I updated the prototype and readme to accurately reflect 
the current state of our game and roles. At home, Robin pointed out 
some errors with my castling code and King class in general, so I fixed 
those mistakes (~1 hour at home).  

### 2025-06-06 (+ weekend) - En passant, preset boards, move log.
In class, (no Robbby tdy) I worked on debugging the code and changing 
the castling mechanic to utilize boolean flags for if the pieces had 
moved. I also added some of the preset boards. 
At home, I finished up en passant and made sure it worked correctly, added 
a small section on the screen to list what keys trigger what boards, fixed the move log 
so it didn't display any numbers or skip moves or list random 
captures, and added en passant notation to the move log (~2.5 hours).  

