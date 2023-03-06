--Find the last but one element of a list.
{-
Example in Haskell:

λ> myButLast [1,2,3,4]
3
λ> myButLast ['a'..'z']
'y'
-}

import Data.Maybe

myButLast :: [a] -> Maybe a
myButLast [] = Nothing
myButLast [x,_] = Just x
myButLast (_:xs) = myButLast xs

