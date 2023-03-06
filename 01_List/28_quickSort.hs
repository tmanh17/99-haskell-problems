{-
Sorting a list of lists according to length of sublists

a) We suppose that a list contains elements that are lists themselves. The objective is to sort the elements of this list according to their length. E.g. short lists first, longer lists later, or vice versa.

Example:

* (lsort '((a b c) (d e) (f g h) (d e) (i j k l) (m n) (o)))
((O) (D E) (D E) (M N) (A B C) (F G H) (I J K L))
Example in Haskell:

λ> lsort ["abc","de","fgh","de","ijkl","mn","o"]
["o","de","de","mn","abc","fgh","ijkl"]
b) Again, we suppose that a list contains elements that are lists themselves. But this time the objective is to sort the elements of this list according to their length frequency; i.e., in the default, where sorting is done ascendingly, lists with rare lengths are placed first, others with a more frequent length come later.

Example:

* (lfsort '((a b c) (d e) (f g h) (d e) (i j k l) (m n) (o)))
((i j k l) (o) (a b c) (f g h) (d e) (d e) (m n))
Example in Haskell:

λ> lfsort ["abc", "de", "fgh", "de", "ijkl", "mn", "o"]
["ijkl","o","abc","fgh","de","de","mn"]

-}
import Data.List;


lsort :: (Eq a) => [[a]] -> [[a]]
lsort [] = []
lsort [x] = [x]
lsort (x:xs) =  lower ++ [x] ++ higher
    where 
        lower = lsort(filter ((\a b -> (length a) > (length b)) x) xs)
        higher = lsort(filter((\a b -> (length a) <= (length b)) x) xs)



lsort' :: [[a]] -> [[a]]
lsort' = sortBy (\xs ys -> compare (length xs) (length ys))

frequency len l = length (filter (\x -> length x == len) l)

lfsort :: [[a]] -> [[a]]
lfsort l = sortBy (\xs ys -> compare (frequency (length xs) l) (frequency (length ys) l)) l