/*********************************************
 * OPL 12.5 Model
 * Author: CL-51
 * Creation Date: Jan 18, 2023 at 2:37:06 PM
 *********************************************/
int N=...;
range months=1..N;
dvar float+ x[months];
dvar float+ e[months];

int demand[months]=...;
int cost[months]=...;//PRODUCTION COST
int inventcost=...;//INVENTORY COST


minimize sum(i in months) (cost[i]*x[i]+inventcost*e[i]);

subject to
{ e[1]==x[1]-100; //FOR FIRST MONTH
   forall (i in 2..N) e[i]==x[i]+e[i-1]-demand[i];//DEMAND CONSTRAINTS
 }
 execute {
   for (var i in months)
     writeln(i, '=', x[i]);
   }     
   //x=[100 ,440 , 0 ,140 ,220 ,110]
   //e=[0, 190 , 0 ,0 ,0 ,0]