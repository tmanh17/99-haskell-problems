{-
(*) Count the nodes of a multiway tree.

Example in Haskell:

λ> nnodes tree2
2
-}

import Tree

nnodes :: (Tree Char) -> Int
nnodes (Node _ []) = 1
nnodes (Node _ xs) = 1 + sum [nnodes x | x <- xs]