{-
(*) Modified run-length encoding.

Modify the result of problem 10 in such a way that if an element has no duplicates it is simply copied into the result list. Only elements with duplicates are transferred as (N E) lists.

Example:

* (encode-modified '(a a a a b c c a a d e e e e))
((4 A) B (2 C) (2 A) D (4 E))
Example in Haskell:

λ> encodeModified "aaaabccaadeeee"
[Multiple 4 'a',Single 'b',Multiple 2 'c', Multiple 2 'a',Single 'd',Multiple 4 'e']
-}

data ListItem a = Multiple Int a | Single a deriving (Show)

encodeModified :: (Eq a) => [a] -> [ListItem a]
encodeModified [] = []
encodeModified xs = encodeModified' xs 1
    where encodeModified' [] _ = []
          encodeModified' [x] n = if n == 1 then [(Single x)] else [Multiple n x]
          encodeModified' (x:xs) n
            | x == head xs = encodeModified' xs (n+1)
            | otherwise = 
                if n == 1 then (Single x) : encodeModified' xs 1
                else (Multiple n x) : encodeModified' xs 1

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


encodeModified' :: (Eq a) => [a] -> [ListItem a]
encodeModified' = map encodeHelper . encode
    where encodeHelper (1,x) = Single x
          encodeHelper (n,x) = Multiple n x