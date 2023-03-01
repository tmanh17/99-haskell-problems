{-
(**) Goldbach's conjecture.

Goldbach's conjecture says that every positive even number greater than 2 is the sum of two prime numbers. Example: 28 = 5 + 23. It is one of the most famous facts in number theory that has not been proved to be correct in the general case. It has been numerically confirmed up to very large numbers (much larger than we can go with our Prolog system). Write a predicate to find the two prime numbers that sum up to a given even integer.

Example:

* (goldbach 28)
(5 23)
Example in Haskell:

λ> goldbach 28
(5, 23)
-}

check :: Int -> Int -> Bool
check n x = mod n x == 0 

isPrime :: Int -> Bool
isPrime 1 = False
isPrime n =not(any (check n) [2..(floor $ sqrt $ fromIntegral n)])


goldbach :: Int -> (Int, Int)
goldbach n 
    | isPrime (n-2) = (2, n-2)
    | otherwise = goldbach' n 3
        where 
            goldbach' n k
                | isPrime k && isPrime (n-k) = (k, n-k)
                | otherwise = goldbach' n (k+2)



primesR :: Int -> Int -> [Int]
primesR a b = primesR' a b a
    where 
        primesR' a b n
            | n > b || a > b = []
            | isPrime n = n:(primesR' a b (n+1))
            | not (isPrime n) = primesR' a b (n+1)

goldbach' n = head [(x,y) | x <- pr, y <- pr, x+y==n]
    where pr = primesR 2 (n-2)