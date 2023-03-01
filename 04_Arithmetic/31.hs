{-
(**) Determine whether a given integer number is prime.

Example:

* (is-prime 7)
T
Example in Haskell:

λ> isPrime 7
True
-}

check :: Int -> Int -> Bool
check n x = mod n x == 0 

isPrime :: Int -> Bool
isPrime 1 = False
isPrime n =not(any (check n) [2..(floor $ sqrt $ fromIntegral n)])