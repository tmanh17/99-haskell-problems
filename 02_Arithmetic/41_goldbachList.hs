{-
(**) Given a range of integers by its lower and upper limit, print a list of all even numbers and their Goldbach composition.

In most cases, if an even number is written as the sum of two prime numbers, one of them is very small. Very rarely, the primes are both bigger than say 50. Try to find out how many such cases there are in the range 2..3000.

Example:

* (goldbach-list 9 20)
10 = 3 + 7
12 = 5 + 7
14 = 3 + 11
16 = 3 + 13
18 = 5 + 13
20 = 3 + 17
* (goldbach-list 1 2000 50)
992 = 73 + 919
1382 = 61 + 1321
1856 = 67 + 1789
1928 = 61 + 1867
Example in Haskell:

λ> goldbachList 9 20
[(3,7),(5,7),(3,11),(3,13),(5,13),(3,17)]
λ> goldbachList' 4 2000 50
[(73,919),(61,1321),(67,1789),(61,1867)]
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

goldbach :: Int -> (Int, Int)
goldbach n 
    | isPrime (n-2) = (2, n-2)
    | otherwise = goldbach' n 3
        where 
            goldbach' n k
                | isPrime k && isPrime (n-k) = (k, n-k)
                | otherwise = goldbach' n (k+2)


goldbachList :: Int -> Int -> [(Int, Int)]
goldbachList s e = 
        if mod s 2 == 0 then goldbackL' s e s 
        else goldbackL' s e (s+1) 
    where 
        goldbackL' s e n
            | e < s || n > e = []
            | otherwise = (goldbach n):(goldbackL' s e (n+2))


goldbachList' :: Int -> Int -> Int -> [(Int, Int)]
goldbachList' s e k = filter (\(x,y) -> x > k && y > k) (goldbachList s e)

        