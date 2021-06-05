% variables:
var float: R; % quarterly repayment
var float: P; % principal initially borrowed
var 0.0 .. 2.0: I; % interest rate

% independent variables:
var float: B1; % balance after one quarter
var float: B2; % balance after two quarters
var float: B3; % balance after three quarters
var float: B4; % balance owing at the end

constraint B1 = P * (1.0 + I) - R;
constraint B2 = B1 * (1.0 + I) - R;
constraint B3 = B2 * (1.0 + I) - R;
constraint B4 = B3 * (1.0 + I) - R;

solve satisfy;

output ["Borrowing \(P) at \(I*100)% interest, and repaying \(R) per quarter for 1 year leaves \(B4) owing "];










