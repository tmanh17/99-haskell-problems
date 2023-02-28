{-
(**) Decode a run-length encoded list.

Given a run-length code list generated as specified in problem 11. Construct its uncompressed version.

Example in Haskell:

λ> decodeModified [Multiple 4 'a',Single 'b',Multiple 2 'c', Multiple 2 'a',Single 'd',Multiple 4 'e']
"aaaabccaadeeee"



data ListItem a = Multiple Int a | Single a deriving (Show)

decodeModified :: (Eq a) => [ListItem a] -> [a]
decodeModified [] = []
decodeModified (x:xs) = (generateList x) ++ (decodeModified xs)
    where generateList (Single val) = take 1 [val,val..]
          generateList (Multiple n val) = take n [val,val..]

-}

data ListItem a = Multiple Int a | Single a deriving (Show)

decodeModified :: (Eq a) => [ListItem a] -> [a]
decodeModified [] = []
decodeModified ((Single x):xs) = x:(decodeModified xs)
decodeModified ((Multiple 2 x):xs) = x:x:(decodeModified xs)
decodeModified ((Multiple n x):xs) = x:decodeModified((Multiple (n-1) x):xs)
