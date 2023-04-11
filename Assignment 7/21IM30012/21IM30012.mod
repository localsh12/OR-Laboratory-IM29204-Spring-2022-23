/*********************************************
 * OPL 12.5 Model
 * Author: user
 * Creation Date: Mar 15, 2023 at 2:15:42 PM
 *********************************************/
using CP;
int n = ...;
range r = 1..n;
dvar boolean queen[r][r];
subject to
{
forall(i in r) sum(j in r) queen[i][j] == 1;
forall(i in r) sum(j in r) queen[j][i] == 1;
forall(k in -n+2..n-2) sum(i in r:i+k in r)queen[i][i+k] <= 1;
forall(k in 2..2*n-4) sum(i in r:k-i in r)queen[i][k-i] <= 1;
}
execute
{}																