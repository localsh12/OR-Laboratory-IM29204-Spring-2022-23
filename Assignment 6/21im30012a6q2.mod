/*********************************************
 * OPL 12.5 Model
 * Author: CL--30
 * Creation Date: 01-Mar-2023 at 4:32:31 PM
 *********************************************/
using CP;
range N=1..9;
int puzzle[N][N] =...; 
dvar int x[N][N] in N;

subject to {
 forall (i in N, j in N) 
if (puzzle[i,j] != 0)
puzzle[i,j] == x[i,j];
forall (num in N)
 allDifferent(all (i in 1..9) x[num,i]) && allDifferent(all (i in 1..9) x[i,num]) && allDifferent(all (i in 1..3, j in 1..3) x[((num-1) div 3)*3 + i][((num-1) % 3)*3 + j]); // 3x3
}// rules for suduku};