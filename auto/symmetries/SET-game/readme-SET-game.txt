[2] A Reformulation Strategy for Multi-Dimensional CSPs: The Case Study of the SET Game, 2011. \url{https://digitalcommons.unl.edu/cgi/viewcontent.cgi?article=1177&context=cseconfwork}
            \3 [2] The SET game.


2.1 The Game of SET
SET is a combinatorial card game consisting of a deck of 81 playing cards. Each card is uniquely determined by the values of four attributes, namely, the number of objects drawn on the card and their color, filling, and shape. We denote these attributes by N, C, F, and S, respectively. Each attribute takes one of three possi- ble values as follows: {1,2,3} for the dimension number, {red,green,purple} for color, {striped,full,empty} for fill- ing, and {squiggle,oval,diamond} for shape, see as shown in Figure 2. To play the game, twelve cards are dealt and placed, face up, on the table, visible to all players. The players compete to find a collection of exactly three cards that constitute what we call a solution set. For each of the above listed attributes, the three cards of a solution set must all have either the same value or different values for the at- tribute. Figure 3 shows three cards forming a solution set. In this example, the three cards differ on all four attributes. The first player to identify a solution set picks it up, and the cards are replaced with new ones from the deck. If all players agree that a solution set cannot be found among the twelve cards, three more are dealt and the game resumes. The operation is repeated until a set is found. Usually, the number of cards on the table quickly returns to twelve. The maximum number of cards on the table at any one time is 21, because any combination of 21 cards is guaranteed to have at least a solution set. The proof was performed by exhaustive computation (Davis and McLagan 2003). The game contin- ues until all cards have been picked up or there are no more sets among the remaining cards. The winner is the player with the largest number of sets at the end of the game. For the sake of space, our examples will show game instances with only nine cards although the original game considers twelve cards.

Obviously, a simple nested for-loop can ‘easily’ generate
all combinations of three cards. Each combination can then
be tested to check whether or not it satisfies the constraint.
Such an approach is shortsighted. Indeed, human beings
are unlikely to play the game by examining 􏰁12􏰂 = 220 3
combinations. Instead, it is fair to assume that they use
various modeling and reformulation strategies. It would be
equally ridiculous to use the simple nested for-loop to solve
industrial-size problems because the number of combina-
tions grows exponentially with the size of the problem and
few of the generated combinations satisfy the constraints.

For example, 􏰁12􏰂 = 220 combinations have on average 2.7 3
solutions, and 􏰁81􏰂 = 85320 combinations have only 1080 3
solutions. Thus, the simple nested for-loop is a strategy that is neither interesting to teach a human player nor to use for automation in an industrial setting.