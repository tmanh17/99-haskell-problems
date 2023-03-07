module StringRepeat where


import Data.List;

sortArray :: [Int] -> [Int]
sortArray [] = []
sortArray (x:xs) = sortArray' (x:xs) 0 odds
  where 
    odds = sortBy (\x y -> compare x y) (filter (\x -> mod x 2 == 1) (x:xs))
    sortArray' [] _ _ = []
    sortArray' (x:xs) n odds 
      | mod x 2 == 0 = x:(sortArray' xs n odds)
      | otherwise = (odds!!n):(sortArray' xs (n+1) odds)