% Viewpoint 1: Which colour, if any, does each shape have?

int: n; % number of objects
int: s; % number of shapes
int: c; % number of colours
constraint assert(s >= n, "Not enough shapes");

array[1..s] of var 0..c: Colour; % 0 is a dummy colour 7
% There are n objects:
constraint count(Colour,0) = s-n;
% The numbers of objects of the used colours are distinct:
constraint alldifferent_except_0(global_cardinality(Colour,1..c));
% The objects have distinct shapes:
% implied by lines 6 and 9
% ... add here the other constraints ...
solve satisfy;