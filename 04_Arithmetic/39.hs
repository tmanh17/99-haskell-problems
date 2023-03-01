{-
(*) A list of prime numbers.

Given a range of integers by its lower and upper limit, construct a list of all prime numbers in that range.

Example in Haskell:

λ> primesR 10 20
[11,13,17,19]
-}

check :: Int -> Int -> Bool
check n x = mod n x == 0 

isPrime :: Int -> Bool
isPrime 1 = False
isPrime n =not(any (check n) [2..(floor $ sqrt $ fromIntegral n)])

primesR :: Int -> Int -> [Int]
primesR a b = primesR' a b a
    where 
        primesR' a b n
            | n > b || a > b = []
            | isPrime n = n:(primesR' a b (n+1))
            | not (isPrime n) = primesR' a b (n+1)