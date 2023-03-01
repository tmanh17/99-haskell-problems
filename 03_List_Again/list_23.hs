{-
Extract a given number of randomly selected elements from a list.

Example:

* (rnd-select '(a b c d e f g h) 3)
(E D A)
Example in Haskell:

λ> rnd_select "abcdefgh" 3 >>= putStrLn
eda

-}

import System.Random (randomRIO)

rnd_select :: [a] -> Int -> IO [a]
rnd_select _ 0 = return []
rnd_select (x:xs) n =
    do 
        r <- randomRIO (0, length xs)
        if r < n
            then do
                rest <- rnd_select xs (n-1)
                return (x : rest)
            else rnd_select xs n

