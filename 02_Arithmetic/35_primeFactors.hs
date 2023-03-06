{-
(**) Determine the prime factors of a given positive integer. Construct a flat list containing the prime factors in ascending order.

Example:

* (prime-factors 315)
(3 3 5 7)
Example in Haskell:

λ> primeFactors 315
[3, 3, 5, 7]
-}

primeFactors :: Int -> [Int]
primeFactors n = primeFactors' n 2
    where 
        primeFactors' 1 _ = []
        primeFactors' n k
            | mod n k == 0 = k:(primeFactors' (div n k) k)
            | otherwise = primeFactors' n (k+1)
    