{-
(**) Run-length encoding of a list (direct solution).

Implement the so-called run-length encoding data compression method directly. I.e. don't explicitly create the sublists containing the duplicates, as in problem 9, but only count them. As in problem P11, simplify the result list by replacing the singleton lists (1 X) by X.

Example:

* (encode-direct '(a a a a b c c a a d e e e e))
((4 A) B (2 C) (2 A) D (4 E))
Example in Haskell:

λ> encodeDirect "aaaabccaadeeee"
[Multiple 4 'a',Single 'b',Multiple 2 'c',
 Multiple 2 'a',Single 'd',Multiple 4 'e']

-}


data ListItem a = Multiple Int a | Single a deriving (Show)

encodeDirect :: (Eq a) => [a] -> [ListItem a]
encodeDirect [] = []
encodeDirect xs = encodeDirect' xs 1
    where encodeDirect' [] _ = []
          encodeDirect' [x] n = if n == 1 then [(Single x)] else [Multiple n x]
          encodeDirect' (x:xs) n
            | x == head xs = encodeDirect' xs (n+1)
            | otherwise = 
                if n == 1 then (Single x) : encodeDirect' xs 1
                else (Multiple n x) : encodeDirect' xs 1

-- encode is in list_10.hs
{-
λ> encode "aaaabccaadeeee"
[(4,'a'),(1,'b'),(2,'c'),(2,'a'),(1,'d'),(4,'e')]
-}
encode :: Eq a => [a] -> [(Int, a)]
encode [] = []
encode (x:xs) = encode' 1 x xs
    where encode' n x [] = [(n, x)]
          encode' n x (y:ys)
            | x == y = encode' (n + 1) y ys
            | otherwise = (n, x) : encode' 1 y ys


encodeDirect' :: (Eq a) => [a] -> [ListItem a]
encodeDirect' = map encodeHelper . encode
    where encodeHelper (1,x) = Single x
          encodeHelper (n,x) = Multiple n x