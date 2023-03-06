{-
(**) Eliminate consecutive duplicates of list elements.

If a list contains repeated elements they should be replaced with a single copy of the element. The order of the elements should not be changed.

Example:

* (compress '(a a a a b c c a a d e e e e))
(A B C A D E)
Example in Haskell:

λ> compress "aaaabccaadeeee"
"abcade"
-}

compress :: (Eq a) => [a] -> [a]
compress [] = []
compress [x] = [x]
compress (x:xs) 
    | x == head xs = compress xs
    | otherwise = [x] ++ compress xs


compress' :: (Eq a) => [a] -> [a]
compress' = foldr skipDups []
    where skipDups x [] = [x]
          skipDups x acc
            | x == head acc = acc
            | otherwise = x:acc


compress'' :: (Eq a) => [a] -> [a]
compress'' list = compress_acc list []
          where compress_acc [] acc = acc
                compress_acc [x] acc = (acc ++ [x])
                compress_acc (x:xs) acc
                  | x == (head xs)  = compress_acc xs acc
                  | otherwise       = compress_acc xs (acc ++ [x])