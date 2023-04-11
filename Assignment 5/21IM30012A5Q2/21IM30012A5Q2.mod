/*********************************************
 * OPL 12.5 Model
 * Author: user
 * Creation Date: 08-Feb-2023 at 3:49:08 PM
 *******************************************/
 int p=...;
 range pro=1..p;
 int maccost[pro]=...;
 int profit[pro]=...;
 int res=...;
 int wood=...;
 int rr[pro]=...;
 int wr[pro]=...;
 int M=100000;
 
 dvar int+ x[pro];
 dvar boolean y[pro];

 maximize
   sum(i in pro)(
     x[i]*profit[i]-y[i]*maccost[i]);
 subject to{
sum(i in pro)
  x[i]*rr[i]<=res;
sum(i in pro)
  x[i]*wr[i]<=wood;
forall(i in pro)
  x[i]<=M*y[i] ;
     
}