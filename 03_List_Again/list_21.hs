{-
Insert an element at a given position into a list.

Example:

* (insert-at 'alfa '(a b c d) 2)
(A ALFA B C D)
Example in Haskell:

λ> insertAt 'X' "abcd" 2
"aXbcd"

-}


insertAt :: (Eq a) => a -> [a] -> Int -> [a]
insertAt _ [] _ = []
insertAt c (x:xs) pos
    | pos == 1 = c:x:(insertAt c xs (pos-1))
    | otherwise = x:(insertAt c xs (pos-1))

