{-
(**) Extract a slice from a list.

Given two indices, i and k, the slice is the list containing the elements between the i'th and k'th element of the original list (both limits included). Start counting the elements with 1.

Example:

* (slice '(a b c d e f g h i k) 3 7)
(C D E F G)
Example in Haskell:

λ> slice ['a','b','c','d','e','f','g','h','i','k'] 3 7
"cdefg"

-}


slice :: (Eq a) => [a] -> Int -> Int -> [a]
slice [] _ _ = []
slice (x:xs) s e = slice' (x:xs) s e 1
    where slice' [] _ _ _ = []
          slice' (x:xs) s e counter
            | s <= counter && counter <= e = x:slice' xs s e (counter+1)
            | otherwise = slice' xs s e (counter+1)