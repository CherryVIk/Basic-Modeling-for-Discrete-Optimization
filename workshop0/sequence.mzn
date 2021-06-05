int: n;
set of int: INDEX = 1..n;
array[INDEX] of var 0..3 : x;

constraint x[1] = 0;
constraint x[n] = 3;

% constraint assert(n mod 3 == 1, "This n will give unsatisfiable result", n = n+1);
constraint forall(i,j in INDEX where i=j+1)(x[i] + x[j] <=3);
constraint forall(i in INDEX where i mod 3 = 0)(x[i] >= 2);


output["Sum = ", show(x)];

solve maximize sum(x);

% for n = 4 or 7 
% the model doesn't work