param total >0;
set ID;
#set profit;
#set cost;

param profit {ID} > 0;
param cost {ID} > 0;
param f_min {ID} >= 0;
param f_max {j in ID} >= f_min[j];

var Invest {j in ID} integer >= f_min[j], <= f_max[j];

maximize Total_Profit: sum {j in ID} profit[j] * Invest[j];

subject to Total_Cost: sum {j in ID} cost[j] * Invest[j] <= total ;

data P7.dat;

#problem Integrality: X, Total_Profit, Total_Cost;

option solver cplex;
#option solution_round 6;


#option relax_integrality 1;
solve;
display Total_Profit;
display Invest;