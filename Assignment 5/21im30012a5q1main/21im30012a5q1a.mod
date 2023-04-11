/*********************************************
 * OPL 12.5 Model
 * Author: user
 * Creation Date: 08-Feb-2023 at 3:45:27 PM
 *********************************************/
int ND=...;
int c=...;	
range n=1..c;
range doc=1..ND;
dvar boolean x[doc];

int CC[doc]=...;  
int y[n][doc]=...;
 minimize 
 sum(i in doc)

     CC[i]*x[i];
subject to{
 forall(j in n)
   sum(i in doc)
     x[i]*y[j][i]==1;
}
//if consultance fess is given only once even if doctor visits two clinic