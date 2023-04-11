/*********************************************
 * OPL 12.5 Model
 * Author: user_2
 * Creation Date: Feb 1, 2023 at 2:19:02 PM
 *********************************************/
int np=...;
range products=1..np;
int nk=...;
range nknapsack=1..nk;
int utility[products]=...;
int weights[products]=...;
int capacity[nknapsack]=...;
dvar int+ x[nknapsack][products];

maximize 
   sum(i in products,j in nknapsack)
    x[j][i]*utility[i];
subject to{
  forall(j in nknapsack)
    sum(i in products)
      x[j][i]*weights[i]<=capacity[j];}
      
execute { writeln("Optimal solution found with objective: X \n      ",x); }

  