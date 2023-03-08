{-
Generate-and-test paradigm
Apply the generate-and-test paradigm to construct all symmetric, completely balanced binary trees with a given number of nodes.

Example:

* sym-cbal-trees(5,Ts).
Ts = [t(x, t(x, nil, t(x, nil, nil)), t(x, t(x, nil, nil), nil)), t(x, t(x, t(x, nil, nil), nil), t(x, nil, t(x, nil, nil)))] 
Example in Haskell:

λ> symCbalTrees 5
[Branch 'x' (Branch 'x' Empty (Branch 'x' Empty Empty)) (Branch 'x' (Branch 'x' Empty Empty) Empty),Branch 'x' (Branch 'x' (Branch 'x' Empty Empty) Empty) (Branch 'x' Empty (Branch 'x' Empty Empty))]
-}

import Tree

-- symCbalTrees :: [Int] -> [Tree Char]
-- symCbalTrees 0 = []
-- symCbalTrees n = []


mirror Empty          Empty          = True
mirror (Branch _ a b) (Branch _ x y) = mirror a y && mirror b x
mirror _              _              = False

symmetric Empty          = True
symmetric (Branch _ l r) = mirror l r
    where
        mirror Empty Empty = True
        mirror (Branch _ a b) (Branch _ x y) = mirror a y && mirror b x
        mirror _ _ = False

cbalTree :: Int -> [Tree Char]
cbalTree 0 = [Empty]
cbalTree n = let (q, r) = (n - 1) `quotRem` 2
    in [Branch 'x' left right | i     <- [q .. q + r],
                                left  <- cbalTree i,
                                right <- cbalTree (n - i - 1)]



symCbalTrees = filter symmetric . cbalTree


symCbalTrees' :: Int -> [Tree Char]
symCbalTrees' n = if n `mod` 2 == 0 then [] else 
    [ Branch 'x' t (reverseTree t) | t <- cbalTree (n `div` 2)]

reverseTree Empty = Empty
reverseTree (Branch x l r) = Branch x (reverseTree r) (reverseTree l)