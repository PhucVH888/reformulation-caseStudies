set of int: Days = 1..7;
set of int: Mon2Fri = 1..5;
enum Doctors = {Dr_A, Dr_B, Dr_C, Dr_D, Dr_E};
enum ShiftTypes = {app, call, oper, none};

array[Doctors,Days] of var ShiftTypes: Roster;

solve minimize ...; % plug in an objective function 9
constraint forall(d in Days)(count(Roster[..,d],call) = 1);
constraint forall(w in Mon2Fri)(count(Roster[..,w],oper) <= 2);
constraint count(Roster,oper) >= 7;
constraint count(Roster,app) >= 4;
constraint forall(D in Doctors)(regular(Roster[D,..], (oper none|app|call|none)*);
% ... other constraints