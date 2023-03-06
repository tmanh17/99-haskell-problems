{-
(**) Rotate a list N places to the left.

Hint: Use the predefined functions length and (++).

Examples:

* (rotate '(a b c d e f g h) 3)
(D E F G H A B C)

* (rotate '(a b c d e f g h) -2)
(G H A B C D E F)
Examples in Haskell:

λ> rotate ['a','b','c','d','e','f','g','h'] 3
"defghabc"

λ> rotate ['a','b','c','d','e','f','g','h'] (-2)
"ghabcdef"

-}



rotate :: (Eq a) => [a] -> Int -> [a]
rotate [] _ = []
rotate xs n = (restPart' xs (mod n $ length xs)) ++ (take (mod n $ length xs) xs) 
    where restPart' [] _ = []
          restPart' (x:xs) n 
            | n >= 1 = (restPart' xs (n-1))
            | otherwise = x:(restPart' xs (n-1))