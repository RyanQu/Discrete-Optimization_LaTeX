param d1 = 1230;
param d2 = 1190;
param d3 = 845;
param d4 = 935;
param d5 = 915;
param d6 = 1625;
param d7 = 1510;

var o1 integer >= 0, <= 500;
var o2 integer >= 0, <= 500;
var o3 integer >= 0, <= 500;
var o4 integer >= 0, <= 500;
var o5 integer >= 0, <= 500;
var o6 integer >= 0, <= 500;
var o7 integer >= 0, <= 500;

var r1 integer >= 0, <= 600;
var r2 integer >= 0, <= 600;
var r3 integer >= 0, <= 600;
var r4 integer >= 0, <= 600;
var r5 integer >= 0, <= 600;
var r6 integer >= 0, <= 600;
var r7 integer >= 0, <= 600;

var b1 integer >= 0, <= 500;
var b2 integer >= 0, <= 500;
var b3 integer >= 0, <= 500;
var b4 integer >= 0, <= 500;
var b5 integer >= 0, <= 500;
var b6 integer >= 0, <= 500;
var b7 integer >= 0, <= 500;

var s1 integer >= 0;
var s2 integer >= 0;
var s3 integer >= 0;
var s4 integer >= 0;
var s5 integer >= 0;
var s6 integer >= 0;
var s7 integer >= 0;

minimize Cost: 20*(o1+o2+o3+o4+o5+o6+o7) + 25*(r1+r2+r3+r4+r5+r6+r7) + 45*(b1+b2+b3+b4+b5+b6+b7) + 2*(s1+s2+s3+s4+s5+s6+s7);

subject to Store1: s1 = o1 + r1 + b1 - d1;
subject to Store2: s2 = o2 + r2 + b2 + s1 - d2;
subject to Store3: s3 = o3 + r3 + b3 + s2 - d3;
subject to Store4: s4 = o4 + r4 + b4 + s3 - d4;
subject to Store5: s5 = o5 + r5 + b5 + s4 - d5;
subject to Store6: s6 = o6 + r6 + b6 + s5 - d6;
subject to Store7: s7 = o7 + r7 + b7 + s6 - d7;

subject to Demand1: o1 + r1 + b1 >= d1;
subject to Demand2: o2 + r2 + b2 + s1 >= d2;
subject to Demand3: o3 + r3 + b3 + s2 >= d3;
subject to Demand4: o4 + r4 + b4 + s3 >= d4;
subject to Demand5: o5 + r5 + b5 + s4 >= d5;
subject to Demand6: o6 + r6 + b6 + s5 >= d6;
subject to Demand7: o7 + r7 + b7 + s6 >= d7;

option solver cplex;
solve;

display Cost;

display o1,o2,o3,o4,o5,o6,o7;
display r1,r2,r3,r4,r5,r6,r7;
display b1,b2,b3,b4,b5,b6,b7;
display s1,s2,s3,s4,s5,s6,s7;

