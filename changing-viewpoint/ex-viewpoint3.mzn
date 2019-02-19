% Viewpoint 3: Which shape & colour does each object have?

int: n; % number of objects
int: s; % number of shapes
int: c; % number of colours
constraint assert(s >= n, "Not enough shapes");

array[1..n] of var 1..s: Shape;
array[1..n] of var 1..c: Colour;

% There are n objects:
% implied by lines 6 and 7
% The numbers of objects of the used colours are distinct:
constraint alldifferent_except_0(global_cardinality(Colour,1..c));
% The objects have distinct shapes:
constraint alldifferent(Shape);
% ... add here the other constraints ...
solve satisfy;