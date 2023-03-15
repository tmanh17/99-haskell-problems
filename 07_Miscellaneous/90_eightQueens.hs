{-
(**) Eight queens problem

This is a classical problem in computer science. The objective is to place eight queens on a chessboard so that no two queens are attacking each other; i.e., no two queens are in the same row, the same column, or on the same diagonal.

Hint: Represent the positions of the queens as a list of numbers 1..N. Example: [4,2,7,3,6,8,5,1] means that the queen in the first column is in row 4, the queen in the second column is in row 2, etc. Use the generate-and-test paradigm.

Example in Haskell:

λ> length (queens 8)
92
λ> head (queens 8)
[1,5,8,6,3,7,2,4]
-}


import Data.List

queens :: Int -> [[Int]]
queens 0 = []
queens n = queens' n 1 [] [] []
    where 
        queens' n i cols leftRight rightLeft 
            | i == (n+1) = [[]]
            | otherwise = [x:rest | x <- [1..n] \\ cols, rest <- queens' n (i+1) (x:cols) ((i+x):leftRight) ((i-x):rightLeft), not $ (i+x) `elem` leftRight, not $ (i-x) `elem` rightLeft]


queens' :: Int -> [[Int]]
queens' n = filter test (generate n)
    where generate 0      = [[]]
          generate k      = [q : qs | q <- [1..n], qs <- generate (k-1)]
          test []         = True
          test (q:qs)     = isSafe q qs && test qs
          isSafe   try qs = not (try `elem` qs || sameDiag try qs)
          sameDiag try qs = any (\(colDist,q) -> abs (try - q) == colDist) $ zip [1..] qs