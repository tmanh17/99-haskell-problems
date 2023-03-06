{-
(**) Replicate the elements of a list a given number of times.

Example:

* (repli '(a b c) 3)
(A A A B B B C C C)
Example in Haskell:

λ> repli "abc" 3
"aaabbbccc"

-}



repli :: (Eq a, Enum a) => [a] -> Int -> [a]
repli [] _ = []
repli (x:xs) k = (take k [x,x..]) ++ (repli(xs) k)
