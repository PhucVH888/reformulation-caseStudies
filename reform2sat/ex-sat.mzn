var bool: w, x, y, z;

constraint (not w \/ not y) /\ (not x \/ y)
             /\ (not w \/ x \/ not z)
             /\ (x \/ y \/ z) /\ (w \/ not z);
             
w = false, x = true, y = true, z = false;