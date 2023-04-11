/*********************************************
 * OPL 12.5 Model
 * Author: CL--30
 * Creation Date: 01-Mar-2023 at 2:51:45 PM
 *********************************************/
using CP;
range loc=1..7;
range fac=1..7;
int distance[loc][loc]=...;
int flow [fac][fac]=...;
dvar int x[loc] in fac ;
dexpr float cost= sum(i in loc,j in loc)(distance[i][j]*flow[x[i]][x[j]]*0.5);
minimize cost;
subject to{

    allDifferent(x);
 }  
 execute{}