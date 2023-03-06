{-
(**) Drop every N'th element from a list.

Example:

* (drop '(a b c d e f g h i k) 3)
(A B D E G H K)

Example in Haskell:

λ> dropEvery "abcdefghik" 3
"abdeghk"

-}

dropEvery :: (Eq a) => [a] -> Int -> [a]
dropEvery [] _ = []
dropEvery (x:xs) k = if k <= 0 then error "invalid input value" else dropEvery' (x:xs) k 1
    where
        dropEvery' [] _ _ = [] 
        dropEvery' (x:xs) k counter
            | mod counter k == 0 = dropEvery' xs k (counter+1)
            | otherwise = x:(dropEvery' xs k (counter+1))