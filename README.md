

<!-- CHESS -->

  64 x 64 

p - 8+8 

0  1  2  3 .. 8
1
2
3
..
8

Board Initial state : 
R , C 

[
    [0,0], [0,1], [0,2], [0,3],[0,4], [0,5], [0,6], [0,7],  ---- T1 
    [1,0], [1,1], [1,2], [1,3],[1,4], [1,5], [1,6], [1,7],
    .
    .
    [6,0], [6,1], [6,2],
    [7,0], [7,1], [7,2], [7,3],[7,4], [7,5], [7,6], [7,7]   --   T2
]

T1 Pawn positions :

T1P1  - [0,0] 
T1P2  - [0,1] 
..

T2P1 - [7,0]
T2P2 - [7,1] 
.. 

PawnSelection - 

Transition 


Transitions : 
P - move (vertical) 
    T1 - r,c --> r+1,c  
    
    T2 - r,c --> r-1, c
    
    NOT condition - T1 : r+1,c T2 : r-1,c empty  OR WIN 

P - kill (diagonal)

    T1 -- T2  :  (T1 (r,c) & T2 (r+1, c+1)) OR (T1 (r,c) & T2 (r+1, c-1)) 
    T2 -- T1  : (T2 (r,c) & T1 (r-1, c-1) OR (T2 (r,c) & T1 (r-1, c+1)))

P - win 
    T1 - r == 7 
    T2 - r == 0 

    T1 - [] OR T2 - []

P - draw 

<!-- Tables  -->

INITIAL_STATE 
TEAMS

Game --> Pawn

    state - enum - progress, completed  
    final_state - string - "WT1", "WT2", ..  


Pawn
    row
    column
    team
    game_id
     

