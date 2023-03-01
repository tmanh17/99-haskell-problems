{-
(**) Connected components (alternative solution)

Write a predicate that splits a graph into its connected components.

Example in Haskell:

λ> connectedComponents ([1,2,3,4,5,6,7], [(1,2),(2,3),(1,4),(3,4),(5,2),(5,4),(6,7)])
[[1,2,3,4,5][6,7]]
-}