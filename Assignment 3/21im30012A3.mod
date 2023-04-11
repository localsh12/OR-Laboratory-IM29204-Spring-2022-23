/*********************************************
 * OPL 12.5 Model
 * Author: ime
 * Creation Date: 25-Jan-2023 at 1:13:21 PM
 *********************************************/
{string} Products = ...;

{string} Resources = ...;
int P = ...;
range Period=1..P;
tuple productData {
    float demand[Period];
    float inventoryCost;
    float insideCost;
    float outsideCost;
    float consumption[Resources];
    }

productData Product[Products] = ...;

float Capacity[Resources] = ...;
dvar float+ Inside[Products][Period];
dvar float+ Outside[Products][Period];
dvar float+ Inventory[Products][Period];
execute CPX_PARAM {
cplex.preind = 0;
cplex.simdisplay = 2;
}

minimize
sum(i in Period )
sum( p in Products )
(Product[p].insideCost * Inside[p][i] +
Product[p].outsideCost * Outside[p][i]+
Product[p].inventoryCost * Inventory[p][i]
 );

subject to {
forall( i in Period )
forall( r in Resources )
ctInside:
sum( p in Products )
Product[p].consumption[r] * Inside[p][i] <= Capacity[r];

forall( i in 2..P )
forall( p in Products )
ctDemand:
Inside[p][i]+ Outside[p][i] +Inventory[p][i-1]== Product[p].demand[i]+Inventory[p][i];
forall( p in Products )
  Inside[p][1]+ Outside[p][1] == Product[p].demand[1]+Inventory[p][1];}

  

tuple R { float x; float y; float z ;};

{R} Result = { <Inside[p][i],Outside[p][i],Inventory[p][i]> | p in Products , i in Period};

execute { writeln("Result=",Result); }

// solution (optimal) with objective 457
//Result= {<10 0 0> <0 100 0> <0 50 0> <0 20 0> <0 200 0> <50 0 0>  <66.667 33.333 0>}