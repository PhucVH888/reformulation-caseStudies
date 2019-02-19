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

% Viewpoint 2: Which shapes, if any, does each colour have?

int: n; % number of objects
int: s; % number of shapes
int: c; % number of colours
constraint assert(s >= n, "Not enough shapes");

array[1..c] of var set of 1..s: Shapes; 7
% There are n objects:
constraint n = sum(colour in 1..c)(card(Shapes[colour]));
% The numbers of objects of the used colours are distinct:
constraint alldifferent_except_0(colour in 1..c)
       (card(Shapes[colour]));
% The objects have distinct shapes:
constraint n = card(array_union(Shapes));
% ... add here the other constraints ...
solve satisfy;

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