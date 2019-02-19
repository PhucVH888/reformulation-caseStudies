forall(i in I)(Magic[i] = sum(j in I)(bool2int(Magic[j]=i))) 

% or, logically equivalently but better:

forall(i in I)(count(Magic,i,Magic[i]))

% or, logically equivalently and even better: 

global_cardinality_closed(Magic,I,Magic) 

% Implied Constraint:

sum(Magic)=n /\ sum(i in I)(Magic[i]*i)=n