{-
(*) Duplicate the elements of a list.

Example:

* (dupli '(a b c c d))
(A A B B C C C C D D)
Example in Haskell:

λ> dupli [1, 2, 3]
[1,1,2,2,3,3]

-}

dupli :: (Eq a) => [a] -> [a]
dupli [] = []
dupli (x:xs) = [x,x] ++ dupli(xs)

dupli' :: (Eq a) => [a] -> [a]
dupli' [] = []
dupli' (x:xs) = x:x:dupli'(xs)

dupli'' xs = xs >>= (\x -> [x,x])


