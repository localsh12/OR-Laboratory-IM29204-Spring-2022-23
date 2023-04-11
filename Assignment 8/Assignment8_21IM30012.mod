/*********************************************
 * OPL 12.5 Model
 * Author: ime
 * Creation Date: 22-Mar-2023 at 2:24:06 PM
 *********************************************/
int n =...;
range N=1..n;
dvar boolean x[N][N];
int cost[N][N]=...;
dvar float+ u[N];
minimize
  sum(i ,j in N) x[i][j]*cost[i][j];
subject to{
  forall(j in N)sum(i in N) x[i][j]==1;
  forall(i in N)sum(j in N) x[i][j]==1;
  forall(i in 1..n,j in 2..n)u[i]-u[j]+n*x[i][j]<=n-1;
  u[1]==0;
 
  
}  
execute POSTPROCESS {
    for (var i in N)
        for (var j in N)
            if (x[i][j] > 0) write(i, " -> ", j, "\n");  }