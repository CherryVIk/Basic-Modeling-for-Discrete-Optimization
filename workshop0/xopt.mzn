int: n = 10;
var 0..n: x; 

% constraint x mod 4 = 0;

% other way to show x mod 4
predicate mod4(var int:x) =
let { var int: y } in x = 4 * y;

constraint mod4(x);

var int: obj = (x-7)^2;
solve minimize obj;

% output ["x = ", show(x), " "];