/*********************************************
 * OPL 12.5 Model
 * Author: user_2
 * Creation Date: Feb 1, 2023 at 4:28:19 PM
 *********************************************/
int nl=...;
int sl=...;
range location =1..nl;
range store= 0..sl-1;
int capacity[location]=...;
int supcost[store][location]=...;
dvar boolean x[location];
dvar boolean y[store][location];
int fcost=...;
minimize
  sum(i in location)
    x[i]*fcost+
  sum(i in location)
    sum(j in store)
      y[j][i]*supcost[j][i];
subject to
{forall(i in location)
   sum(j in store)
     y[j][i]<=capacity[i];
 forall(j in store)
   sum(i in location)
     y[j][i]==1;
 forall(i in location , j in store)
   y[j][i]<=x[i];}
   execute DISPLAY_RESULTS{
  writeln("Open=",x);
  writeln("Storesof=",y);
}