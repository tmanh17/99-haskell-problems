{-
(**) Determine whether a given integer number is prime.

Example:

* (is-prime 7)
T
Example in Haskell:

λ> isPrime 7
True
-}

-- check :: Int -> Int -> Bool
-- check n x = mod n x == 0 


isPrime :: Integer -> Bool
isPrime n 
  | n <= 1 = False
  | otherwise = not(any ((\n x -> mod n x == 0) n) [2..(floor $ sqrt $ fromIntegral n)])