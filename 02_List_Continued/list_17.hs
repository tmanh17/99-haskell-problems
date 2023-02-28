{-
(*) Split a list into two parts; the length of the first part is given.

Do not use any predefined predicates.

Example:

* (split '(a b c d e f g h i k) 3)
( (A B C) (D E F G H I K))
Example in Haskell:

λ> split "abcdefghik" 3
("abc", "defghik")

-}

split :: (Eq a) => [a] -> Int -> [[a]]
split [] _ = [[]]
split (x:xs) k = split' (x:xs) k 1
    where split' [] _ _ = [[]]
          split' (x:xs) k counter 
            | k /= counter = x:(head (split' xs k (counter+1)))
            | k == counter = [x]:(split' xs k (counter+1))