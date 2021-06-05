array[int] of int: readings;
int: start;
int: n = length(readings);
set of int: HOUR = 1..n;
set of int: HOUR0 = 0..n;

% given conditions
enum CHOICE = {heat, strongly_heat, cool, strongly_cool, do_nothing};
array[CHOICE] of int: price = [1, 5, 3, 9, 0];
array[CHOICE] of int: heating = [1, 4, -2, -5, 0];

% values for calculate and output
array[HOUR] of var CHOICE: choice;
array[HOUR] of var 1..infinity: amount;

array[HOUR0] of var int: temp;
var int: cost = sum(i in HOUR) ( price[choice[i]] * amount[i] );

% helper for constraint
% gets current temperature in building
% array[HOUR0] of var int: b;

% constraint b[0] = start;
constraint temp[0] = start;
% constraint 
%   forall(h in HOUR) (b[h] = (b[h-1] + readings[h]) div 2);
  
constraint 
  forall(h in HOUR) (temp[h] = (temp[h-1] + readings[h]) div 2 + heating[choice[h]]);
% constraint 
%   forall(h in HOUR) (
%     let {
%       var CHOICE: x;
%       var 1..infinity: y;
%     } in temp[h] = b[h] + heating[x]*y /\
%          choice[h] = x /\ 
%          amount[h] = y              
%    );                  
% constraint 
%   forall(h in HOUR) (temp[h] >= 25 /\ temp[h] <= 30);

solve minimize cost;

% output ["b = \(b) \n"];
output ["temp = ", show(temp), "\nchoice = ", show(choice), "\ncost = ", show(cost), "\n"];