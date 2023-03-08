{-
(*) Construct the bottom-up order sequence of the tree nodes.

Write a predicate bottom_up(Tree,Seq) which constructs the bottom-up sequence of the nodes of the multiway tree Tree.

Example in Haskell:

λ> bottom_up tree5
"gfcdeba"
-}

bottom_up :: (Tree Char) -> [Char]
bottom_up :: (Node x []) = [x]
bottom_up :: (Node x ts) = x:[bottom_up t | t <- ts]