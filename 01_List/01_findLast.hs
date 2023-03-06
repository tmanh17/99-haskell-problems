--Find the last element of a list
{-
Example in Haskell:

λ> myLast [1,2,3,4]
4
λ> myLast ['x','y','z']
'z'
-}

import Data.Maybe

findLast :: [a] -> Maybe a
findLast [] = Nothing
findLast [x] = Just x
findLast (x:xs) = findLast xs