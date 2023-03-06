{-
(**) Determine the greatest common divisor of two positive integer numbers. Use Euclid's algorithm.

Example:

* (gcd 36 63)
9
Example in Haskell:

λ> [myGCD 36 63, myGCD (-3) (-6), myGCD (-3) 6]
[9,3,3]
-}

myGCD :: Int -> Int -> Int
myGCD a 0 = abs a
myGCD 0 b = abs b
myGCD a b = abs $ myGCD b (mod a b)