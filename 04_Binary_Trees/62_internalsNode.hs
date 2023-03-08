{-
Collect the internal nodes of a binary tree in a list

An internal node of a binary tree has either one or two non-empty successors. Write a predicate internals/2 to collect them in a list.

Example:

% internals(T,S) :- S is the list of internal nodes of the binary tree T.
Example in Haskell:

λ> internals tree4
[1,2]
-}

import Tree

tree4 = Branch 1 (Branch 2 Empty (Branch 4 Empty Empty))
                 (Branch 2 Empty Empty)

internals :: (Tree Integer) -> [Integer]
internals (Empty) = []
internals (Branch x Empty Empty) = []
internals (Branch x l r) = [x] ++ (internals l) ++ (internals r)
