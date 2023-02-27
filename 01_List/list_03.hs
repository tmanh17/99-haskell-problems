{-
(*) Find the K'th element of a list. The first element in the list is number 1.

Example:

* (element-at '(a b c d e) 3)
c
Example in Haskell:

λ> elementAt [1,2,3] 2
2
λ> elementAt "haskell" 5
'e'
-}

import Data.Maybe

elementAt :: [a] -> Int -> Maybe a
elementAt [] _ = Nothing
elementAt (x:_) 0 =  Just x
elementAt (_:xs) k 
 | k < 0 = Nothing
 | otherwise = elementAt xs (k-1)
