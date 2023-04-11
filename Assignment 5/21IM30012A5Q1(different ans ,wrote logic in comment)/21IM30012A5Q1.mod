/*********************************************
 * OPL 12.5 Model
 * Author: user
 * Creation Date: 08-Feb-2023 at 2:26:16 PM
 *********************************************/
int ND=...;
int c=...;	
range n=1..c;
range doc=1..ND;
dvar boolean x[n][doc];

int CC[doc]=...;  
int y[n][doc]=...;
 minimize 
 sum(i in doc)
   sum(j in n)
     CC[i]*x[j][i];
subject to{
 forall(j in n)
   sum(i in doc)
     x[j][i]*y[j][i]==1;
}
//if doctors fee are considered twice