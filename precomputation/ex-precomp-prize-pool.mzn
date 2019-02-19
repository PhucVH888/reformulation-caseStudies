 ...
array[1..5] of int: Pools = [1000,5000,15000,20000,25000];
var 1..5: x;
var 1..500: numWinners;
...
solve maximize Pools[x] div numWinners; % implicit: element!  

% Pre-compute all possible objective values
...
array[1..5] of int: Pools = [1000,5000,15000,20000,25000];
var 1..5: x;
var 1..500: numWinners;
...
array[1..5,1..500] of int: objFun = 
    array2d(1..5,1..500,
            [Pools[p] div n | p in 1..5, n in 1..500]
           );
solve maximize objFun[x,numWinners]; % implicit: 2D-element!