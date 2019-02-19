int: n; set of int: PIZZA = 1..n; % number of pizzas wanted
array[PIZZA] of int: price;       % price of each pizza
int: m; set of int: VOUCH = 1..m; % number of vouchers
array[VOUCH] of int: buy; % buy this many to use voucher
array[VOUCH] of int: free; % get this many free

set of int: ASSIGN = -m .. m; % i -i 0 (free/paid with voucher i or not)
array[PIZZA] of var ASSIGN: how;
array[VOUCH] of var bool: used;

constraint forall(v in VOUCH)(used[v]<->sum(p in PIZZA)(how[p]=-v)>=buy[v]);
constraint forall(v in VOUCH)(sum(p in PIZZA)(how[p]=-v) <= used[v]*buy[v]);
constraint forall(v in VOUCH)(sum(p in PIZZA)(how[p]=v) <= used[v]*free[v]);
constraint forall(p1, p2 in PIZZA)((how[p1] < how[p2] /\ how[p1]= -how[p2])
    -> price[p2] <= price[p1]);
int: total = sum(price);
var 0..total: objective = sum(p in PIZZA)((how[p] <= 0)*price[p]);
