{-
λ> isPalindrome [1,2,3]
False
λ> isPalindrome "madamimadam"
True
λ> isPalindrome [1,2,4,8,16,8,4,2,1]
True
-}

import Data.Maybe

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome [] = True
isPalindrome [_] = True
isPalindrome xs = (head xs) == (last xs) && isPalindrome (init (tail xs))

isPalindrome' :: (Eq a) => [a] -> Bool
isPalindrome' xs = xs == reverse xs