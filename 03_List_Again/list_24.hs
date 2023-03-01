{-
Lotto: Draw N different random numbers from the set 1..M.

Example:

* (rnd-select 6 49)
(23 1 17 33 21 37)
Example in Haskell:

λ> diff_select 6 49
[23,1,17,33,21,37]

-}
import System.Random (randomRIO)


removeVal :: (Eq a) => [a] -> a -> [a]
removeVal [] _ = []
removeVal (x:xs) num
    | x == num = removeVal xs num
    | otherwise = x:(removeVal xs num)

diff_select :: Int -> Int -> IO [Int]
diff_select n m
    | n > m  = error "invalid input data"
    | otherwise = diff_select' n m [1..m]
        where 
            diff_select' 0 _ _ = return []
            diff_select' n m xs = 
                do 
                    r <- randomRIO (0, (length xs)-1)
                    rest <- diff_select' (n-1) m (removeVal xs (xs!!r))
                    return ((xs!!r) : rest)



