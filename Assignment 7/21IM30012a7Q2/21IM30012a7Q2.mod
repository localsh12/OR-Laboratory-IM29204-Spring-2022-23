/*********************************************
 * OPL 12.5 Model
 * Author: user
 * Creation Date: Mar 15, 2023 at 3:58:57 PM
 *********************************************/
using CP;
int N=...;
range ChessBoard = 1..N*N;

 


tuple coord
{
  int x;
  int y;  
};

 

{coord} Knightmoves2D[i in 1..N][j in 1..N]=
{<i+2,j+1>,<i+2,j-1>,<i+1,j+2>,<i+1,j-2>,
<i-2,j+1>,<i-2,j-1>,<i-1,j+2>,<i-1,j-2>}
inter {<x,y> | x in 1..N ,y in 1..N};

 

{int} Knightmove[i in ChessBoard]={(x-1)*N+y | <x,y> in Knightmoves2D[(i-1) div N+1][(i-1) % N+1]};
dvar int jump[ChessBoard] in ChessBoard;
dvar int Sequence[ChessBoard] in ChessBoard;
subject to {
forall(p in ChessBoard)
jump[p] in Knightmove[p];
Sequence[1] == jump[1];
forall(p in 2..N*N)
Sequence[p] == jump[Sequence[p-1]];
allDifferent(Sequence);
allDifferent(jump);
Sequence[N*N] == 1;
forall(p in ChessBoard)
sum(c in Knightmove[p]) (jump[c] == p) == 1;  

 


};

 

