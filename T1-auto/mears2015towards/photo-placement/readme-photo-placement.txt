[1] Towards Automatic Dominance Breaking for Constraint Optimisation Problems, 2014. \url{https://www.ijcai.org/Proceedings/15/Papers/057.pdf}.
            \3 [1] Knapsack.
            \3 [1] Photo Placement.
            \3 [1] Blackhole solitaire.


4.3 Evaluation: Photo Placement
Let us use the Photo Placement problem to show how our method applies to a model rather than to an instance (next section shows the usefulness of almost symmetries). We have considered two models referred to as photo1 and photo2, re- spectively: the one shown in Example 1 and the one given by Chu and Stuckey [2012]. After the CSP extraction, both mod- els contain only the position variables and the all-different constraint. Therefore, any permutation of the position vari- ables is a (full) symmetry. For such permutation groups we consider two sets of dominance mappings: (a) for all pairs of positions i and j, swaps i and j, and (b) for all pairs of positions i and j, reverse the subsequence between i and j. For both mappings, the dominance constraint automatically generated for photo2 is:

constraint sum(i in 1..n-1)
              (p[x_prime[i],x_prime[i+1]])
         - sum(i in 1..n-1)
              (p[x[i], x[i+1]])
<= 0; 􏰀

where the x array corresponds to the pos array in the photo1 model. The main difference between the models obtained with these two mappings is the extra constraint equating the variables to their primes. For example, the equating con- straint for the reversal mappings is:

array [1..n] of var 1..n : x_prime = [ x [ if 1 <= i /\ i <= 2
then 2 - i + 1
else i endif ] | i in 1..n ];

The resulting dominance breaking constraint is the one man- ually identified by Chu and Stuckey [2012] for this problem. Table 2 shows the effect on the search in terms of the total number of search nodes obtained when solving different in- stances of each of the two models without dominance break- ing (column None), and with dominance breaking using swap mappings (Swaps) and reversal mappings (Reversals). The instances are again from [Chu and Stuckey, 2012], where the size represents the number of people in the photo. The two models are tested on different instances because photo1 does not scale well to instances with more than about 10 people. Note that in a branch-and-bound search, extra constraints can increase the search if they divert it from finding early solutions that would have imposed constraints on the objective. Clearly, the reversal mappings consistently give a smaller search than the swap mappings for both models. In the first model, the dominance breaking constraints increase the node count, while in the second model they decrease it. A likely explanation for the poor performance in the first model is that the dominance breaking constraints propagate poorly and, thus, the lack of pruning due to the exclusion of early solutions is not compensated by later reductions in the search tree size. We are exploring ways to automatically detect and transform the constraints to improve pruning.

