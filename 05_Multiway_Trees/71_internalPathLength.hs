{-
(*) Determine the internal path length of a tree.

We define the internal path length of a multiway tree as the total sum of the path lengths from the root to all nodes of the tree. By this definition, tree5 has an internal path length of 9.

Example in Haskell:

λ> ipl tree5
9
λ> ipl tree4
2
-}


import Tree

ipl :: (Tree Char) -> Int
ipl t = ipl' t 1
    where 
        ipl' (Node _ []) 0 = 0
        ipl' (Node _ xs) n = n * (length xs) + sum [ipl' x (n+1) | x <- xs]

ipl' :: Tree a -> Int
ipl' = ipl'' 0
  where ipl'' d (Node _ ts) = d + sum (map (ipl'' (d+1)) ts)