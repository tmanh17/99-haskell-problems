{-
(**) Determine the prime factors of a given positive integer.

Construct a list containing the prime factors and their multiplicity.

Example:

* (prime-factors-mult 315)
((3 2) (5 1) (7 1))
Example in Haskell:

λ> prime_factors_mult 315
[(3,2),(5,1),(7,1)]
-}

import Data.List

primeFactors :: Int -> [Int]
primeFactors n = primeFactors' n 2
    where 
        primeFactors' 1 _ = []
        primeFactors' n k
            | mod n k == 0 = k:(primeFactors' (div n k) k)
            | otherwise = primeFactors' n (k+1)
    

prime_factors_mult :: Int -> [(Int, Int)]
prime_factors_mult n = prime_factors_mult' (primeFactors n) 1
    where prime_factors_mult' [x] n = [(x, n)]
          prime_factors_mult' (x:xs) n
            | x == head xs = prime_factors_mult' xs (n+1)
            | otherwise  = (x, n):(prime_factors_mult' xs 1)


prime_factors_mult' = map encode . group . primeFactors
    where encode xs = (head xs, length xs)