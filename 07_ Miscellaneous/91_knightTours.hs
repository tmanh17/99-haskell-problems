{-
(**) Knight's tour

Another famous problem is this one: How can a knight jump on an NxN chessboard in such a way that it visits every square exactly once? A set of solutions is given on the The_Knights_Tour page.

Hints: Represent the squares by pairs of their coordinates of the form X/Y, where both X and Y are integers between 1 and N. (Note that '/' is just a convenient functor, not division!) Define the relation jump(N,X/Y,U/V) to express the fact that a knight can jump from X/Y to U/V on a NxN chessboard. And finally, represent the solution of our problem as a list of N*N knight positions (the knight's tour).

There are two variants of this problem:

find a tour ending at a particular square
find a circular tour, ending a knight's jump from the start (clearly it doesn't matter where you start, so choose (1,1))
Example in Haskell:

λ> head $ knightsTo 8 (1,1)
[(2,7),(3,5),(5,6),(4,8),(3,6),(4,4),(6,5),(4,6),
(5,4),(7,5),(6,3),(5,5),(4,3),(2,4),(1,6),(2,8),
(4,7),(6,8),(8,7),(6,6),(4,5),(6,4),(5,2),(7,1),
(8,3),(6,2),(8,1),(7,3),(8,5),(7,7),(5,8),(3,7),
(1,8),(2,6),(3,4),(1,5),(2,3),(3,1),(1,2),(3,3),
(1,4),(2,2),(4,1),(5,3),(7,4),(8,2),(6,1),(4,2),
(2,1),(1,3),(2,5),(1,7),(3,8),(5,7),(7,8),(8,6),
(6,7),(8,8),(7,6),(8,4),(7,2),(5,1),(3,2),(1,1)]
λ> head $ closedKnights 8  
[(1,1),(3,2),(1,3),(2,1),(3,3),(5,4),(6,6),(4,5),
(2,6),(1,8),(3,7),(5,8),(4,6),(2,5),(4,4),(5,6),
(6,4),(8,5),(7,7),(6,5),(5,3),(6,1),(4,2),(6,3),
(8,2),(7,4),(5,5),(3,4),(1,5),(2,7),(4,8),(3,6),
(1,7),(3,8),(5,7),(7,8),(8,6),(6,7),(8,8),(7,6),
(8,4),(7,2),(5,1),(4,3),(3,5),(1,4),(2,2),(4,1),
(6,2),(8,1),(7,3),(5,2),(7,1),(8,3),(7,5),(8,7),
(6,8),(4,7),(2,8),(1,6),(2,4),(1,2),(3,1),(2,3)]
-}