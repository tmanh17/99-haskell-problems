{-
(*) Cycle from a given node

Write a predicate cycle(G,A,P) to find a closed path (cycle) P starting at a given node A in the graph G. The predicate should return all cycles via backtracking.

Example in Haskell:

λ> cycle 2 [(1,2),(2,3),(1,3),(3,4),(4,2),(5,6)]
[[2,3,4,2]]
λ> cycle 1 [(1,2),(2,3),(1,3),(3,4),(4,2),(5,6)]
[]
-}