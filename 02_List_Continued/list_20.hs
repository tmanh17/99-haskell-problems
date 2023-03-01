{-
(*) Remove the K'th element from a list.

Example in Prolog:

?- remove_at(X,[a,b,c,d],2,R).
X = b
R = [a,c,d]
Example in Lisp:

* (remove-at '(a b c d) 2)
(A C D)
(Note that this only returns the residue list, while the Prolog version also returns the deleted element.)

Example in Haskell:

λ> removeAt 2 "abcd"
('b',"acd")

-}


removeAt :: (Eq a) => Int -> [a] -> (Maybe a, [a])
removeAt _ [] = (Nothing,[])
removeAt k (x:xs)
    | k == 1 = (
            Just x,
            snd (removeAt (k-1) xs)
        )
    | otherwise = (
            fst (removeAt (k-1) xs),
            x:snd (removeAt (k-1) xs)
        )