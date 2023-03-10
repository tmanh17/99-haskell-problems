{-
Binary search trees (dictionaries)
Use the predicate add/3, developed in chapter 4 of the course, to write a predicate to construct a binary search tree from a list of integer numbers.

Example:

* construct([3,2,5,7,1],T).
T = t(3, t(2, t(1, nil, nil), nil), t(5, nil, t(7, nil, nil)))
Then use this predicate to test the solution of the problem P56.

Example:

* test-symmetric([5,3,18,1,4,12,21]).
Yes
* test-symmetric([3,2,5,7,4]).
No
Example in Haskell:

λ> construct [3, 2, 5, 7, 1]
Branch 3 (Branch 2 (Branch 1 Empty Empty) Empty) (Branch 5 Empty (Branch 7 Empty Empty))
λ> symmetric . construct $ [5, 3, 18, 1, 4, 12, 21]
True
λ> symmetric . construct $ [3, 2, 5, 7, 1]
True
-}


import Tree

mirror Empty          Empty          = True
mirror (Branch _ a b) (Branch _ x y) = mirror a y && mirror b x
mirror _              _              = False

symmetric Empty          = True
symmetric (Branch _ l r) = mirror l r
    where
        mirror Empty Empty = True
        mirror (Branch _ a b) (Branch _ x y) = mirror a y && mirror b x
        mirror _ _ = False

construct :: (Ord a) => [a] -> Tree a
construct [] = Empty
construct xs = foldl (flip addNode) Empty xs
    where 
        addNode x Empty = Branch x (Empty) (Empty)
        addNode x manhdt@(Branch y l r) = case compare x y of
            GT -> Branch y l (addNode x r) 
            LT -> Branch y (addNode x l) r
            EQ -> manhdt


construct' :: (Ord a) => [a] -> Tree a
construct' [] = Empty
construct' xs = foldl (addNode) Empty xs
    where 
        addNode Empty x = Branch x (Empty) (Empty)
        addNode manhdt@(Branch y l r) x = case compare x y of
            GT -> Branch y l (addNode r x) 
            LT -> Branch y (addNode l x) r
            EQ -> manhdt
