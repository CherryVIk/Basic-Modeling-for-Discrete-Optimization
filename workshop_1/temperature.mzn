array[int] of int: readings;
int: start;
int: n = length(readings);
set of int: HOUR = 1..n;
set of int: HOUR0 = 0..n;

% given conditions
enum CHOICE = {heat, strongly_heat, cool, strongly_cool, do_nothing};
array[CHOICE] of int: price = [1, 5, 3, 9, 0];
array[CHOICE] of int: heating = [1, 4, -2, -5, 0];

% values for output
array[HOUR0] of var 25..30: temp;
array[HOUR] of var CHOICE: choice;
array[HOUR] of var 1..infinity: amount;

var int: cost = sum(i in HOUR) ( price[choice[i]] * amount[i] );

% constraints for solution
constraint temp[0] = start;
constraint forall(h in HOUR)
                 (temp[h] = (temp[h-1] + readings[h]) div 2 + heating[choice[h]]);
                 

solve minimize cost;

output ["temp = ", show(temp), "\nchoice = ", show(choice), "\ncost = ", show(cost)];
  