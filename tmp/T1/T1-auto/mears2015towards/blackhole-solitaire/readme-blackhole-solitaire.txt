[1] Towards Automatic Dominance Breaking for Constraint Optimisation Problems, 2014. \url{https://www.ijcai.org/Proceedings/15/Papers/057.pdf}.
            \3 [1] Knapsack.
            \3 [1] Photo Placement.
            \3 [1] Blackhole solitaire.


4.4 Evaluation: Blackhole Solitaire

Let us now consider the effect of almost symmetries. The blackhole solitaire problem is a satisfaction problem where a standard deck of playing cards — minus the ace of spades — is dealt into 17 piles of three cards. These cards are played one-by-one into a discard pile, which begins with only the ace of spades. Each card played must be one higher or one lower than the current top of the discard pile, and only the top card of each pile is playable. The task is to find a sequence of plays that ends with all cards on the discard pile. A model for this problem is:

 % Card at position
array[1..52] of var 1..52: cardAt;
% Position of card
array[1..52] of var 1..52: position;
% Constraint A: Ace of Spades played first constraint cardAt[1] == 1;
 % Constraint B: Consecutive cards match
constraint forall(i in 1..51)
( table([cardAt[i], cardAt[i+1]],
           neighbours) );
 % Constraint C: Link card-at and position
constraint inverse(cardAt, position);
% Constraint D: cards on top played first constraint forall(i in 1..17, j in 1..2)
   ( position[layout[i,j]] <
     position[layout[i,j+1]] );

and is included in the MiniZinc distribution with (a) one variable for each card representing the position in the sequence it is played, and (b) one variable for each position in the sequence representing the card played at that position. These variables are linked by an inverse constraint (con- straint C in the model). The other two significant constraints state that cards played in succession must match, i.e., their face values differ by exactly one (B), and that each card must be played before any card underneath it in its pile (D).

The model has an almost symmetry σ: cards with the same face value are symmetric, except for constraint D which states that for each pile i, the jth card is played before the one underneath (the j+1th). Relaxing the problem by removing D leads to the automatic detection of σ, that is, finding 37 pairs of cards that can be swapped and thus used as domi- nance mappings. The scond for the dominance breaking con- straint associated to σ, is simply σ(D). Since this is a satisfac- tion problem, the ocond imposes an arbitrary ordering on the variables to break σ. This leads to the following dominance breaking constraint:

constraint
  (forall(i in 1..17, j in 1..2)
        (position_prime[layout[i,j]] <
         position_prime[layout[i,j+1]]))
  -> lex_lesseq(position,position_prime);

This constraint has two problems. First, it requires the solver to support a reified version of the lexicographical or- dering constraint. We automatically fix this by observing that the position variables are constrained to be all dif- ferent (by the inverse constraint) and, therefore, the lex- icographical constraint can be reduced to position[a] < position[b], where a and b are the two cards being swapped by the mapping. Second, the left hand side of the implication is too strong, causing very weak propagation. A single mapping affects at most two of the piles; the other piles are unchanged and so that part of the condition is known to be true and could be eliminated from the forall. We repair this automatically by omitting from the forall any part which is left syntactically identical by the symmetry. Additionally, after canonicalization the dominance breaking constraints do not refer to any variables introduced by the duplication pro- cess. Therefore, all of the duplicated variables and constraints are omitted. The resulting dominance constraints are similar to the ones manually identified by Chu and Stuckey[2012] for this problem.

Table 5 shows the effect on search reduction and running time for many instances of the model (again taken from [Chu and Stuckey, 2012]). Clearly, the dominance breaking con- straints cause a large reduction in search space and running time. The automatic simplification of the dominance break- ing constraint as described above is crucial – without it, the dominance breaking constraint does not reduce the search space.