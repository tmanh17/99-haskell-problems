{-
(**) Calculate Euler's totient function phi(m) (improved).

See problem 34 for the definition of Euler's totient function. If the list of the prime factors of a number m is known in the form of problem 36 then the function phi(m) can be efficiently calculated as follows: Let ((p1 m1) (p2 m2) (p3 m3) ...) be the list of prime factors (and their multiplicities) of a given number m. Then phi(m) can be calculated with the following formula:

phi(m) = (p1 - 1) * p1 ** (m1 - 1) * 
         (p2 - 1) * p2 ** (m2 - 1) * 
         (p3 - 1) * p3 ** (m3 - 1) * ...
Note that a ** b stands for the b'th power of a.
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

--[(3,2),(5,1),(7,1)]

f1 :: (Int, Int) -> Int
f1 (p,m) = (p-1) * p ^ (m-1)

phi :: Int -> Int
phi n = foldl (*) 1 (map f1 $ prime_factors_mult n)


phi' m = product [(p - 1) * p ^ (c - 1) | (p, c) <- prime_factors_mult m]
