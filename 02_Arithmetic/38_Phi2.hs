{-
(*) Compare the two methods of calculating Euler's totient function.

Use the solutions of problems 34 and 37 to compare the algorithms. Take the number of reductions as a measure for efficiency. Try to calculate phi(10090) as an example.

(no solution required)
-}

import Data.List

totient :: Int -> Int
totient m = length $ filter (\x -> gcd m x == 1) [1..(m-1)]

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
{--
ghci> totient (10090000)
4032000

ghci> phi (1009000000)
403200000

=> Phi function is much faster
}