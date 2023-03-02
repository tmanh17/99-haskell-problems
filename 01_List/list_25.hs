{-
Generate a random permutation of the elements of a list.

Example:

* (rnd-permu '(a b c d e f))
(B A D C E F)
Example in Haskell:

λ> rnd_permu "abcdef"
"badcef"

-}

import System.Random (randomRIO)

removeAt :: (Eq a) => Int -> [a] -> [a]
removeAt _ [] = []
removeAt k (x:xs)
    | k == 0 = removeAt (k-1) xs
    | otherwise = x:(removeAt (k-1) xs)

rnd_permu :: (Eq a) => [a] -> IO [a]
rnd_permu [] = return []
rnd_permu xs = 
    do
        idx <- randomRIO (0, (length xs)-1)
        rest <- rnd_permu (removeAt idx xs)
        return ((xs!!idx):rest)



