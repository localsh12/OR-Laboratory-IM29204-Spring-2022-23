/*********************************************
 * OPL 12.5 Model
 * Author: CL-51
 * Creation Date: Jan 18, 2023 at 1:26:24 PM
 *********************************************/
int N=...;
range Product=1..N;
dvar float+ units[Product];//PARKHA,GOOSE,PANTS,PRODUCTS
float C[Product]=...;//cutting time per unit
float I[Product]=...;//insulting time per unit
float S[Product]=...;//sewing time per unit
float P[Product]=...;//packaging time per unit
int demand[Product]=...;
int penalty[Product]=...;
int profit[Product]=...;

int C1=...; //CAPACITY 
int C2=...;
int C3=...;
int C4=...;

maximize sum(i in Product) (profit[i]*units[i]-(demand[i]-units[i])*penalty[i]);

subject to
{//TIME CONSTRAINTS
  sum (i in Product) (C[i]*units[i])<=C1;
  sum (i in Product) (I[i]*units[i])<=C2;
  sum (i in Product) (S[i]*units[i])<=C3;
  sum (i in Product) (P[i]*units[i])<=C4;
   forall (i in Product) units[i]<=demand[i];//DEMAND CONSTRAINTS
 }
 execute {
   for (var i in Product)
     writeln(i, '=', units[i]);
   }     
   //UNITS=[800 ,750 ,387.5 ,500]
    
 