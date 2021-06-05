% products
enum PRODUCT;
array[PRODUCT] of float: profit; % profit per unit each product

% resources
enum RESOURCE;
array[RESOURCE] of float: capacity; % amount of resources available

% Units of each resource required to produce 
%   1 unit of product

array[PRODUCT, RESOURCE] of float: consumption; 
% two-dimensional array declaration

% variables: how much should we make of each product
array[PRODUCT] of var int: produce;

% We produce >=0 elements
constraint forall(p in PRODUCT)(produce[p] >= 0);

% Production of only available resources
constraint forall(r in RESOURCE)(
  sum(p in PRODUCT)
    (consumption[p,r] * produce[p]) <= capacity[r]
);

% maximize profit
solve maximize sum(p in PRODUCT)
   (profit[p] * produce[p]);
 
output ["\(p): \(produce[p]) \n" | p in PRODUCT];