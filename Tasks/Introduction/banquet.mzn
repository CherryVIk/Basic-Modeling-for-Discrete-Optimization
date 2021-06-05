enum DISH;
int: capacity;
array[DISH] of int: satisf; % array declarations
array[DISH] of int: size;

array[DISH] of var int: amt; %

% array lookups
% forall expression
constraint forall(i in DISH)(amt[i] >= 0);
constraint sum(i  in DISH)(size[i] * amt[i]) <= capacity;

% sum expression
solve maximize sum(i in DISH)(satisf[i] * amt[i]);

output ["Amount = ", show(amt), "\n"];