int: n;
array[1..n] of var 0..9 : x;

constraint sum(x) = product(x);
% constraint forall(i,j in 1..n where i<j)(x[i] >= x[j]);
constraint forall(i in 1..(n-1))(x[i] <= x[i+1]);

output["Result", show(x)];

solve satisfy;

% output["Result", show(x)];
% solve minimize (x-7)^2;