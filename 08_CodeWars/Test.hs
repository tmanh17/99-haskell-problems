

module SumOfIntervals (sumOfIntervals) where

import Data.List

customCompare :: (Int, Int) -> (Int, Int) -> Ordering
customCompare (a,b) (c,d)
  | a > c = GT
  | a < c = LT
  | b > d = GT
  | b < d = LT
  | otherwise = EQ

compressedList :: [(Int, Int)] -> [(Int, Int)]
compressedList [] = []
compressedList [(a,b)] = [(a, b)]
compressedList ((a,b):(c,d):xs)
  | b >= d = compressedList ((a,b):xs)
  | b >= c = compressedList ((a,d):xs)
  | otherwise = (a,b):compressedList ((c,d):xs)
  

sumOfIntervals :: [(Int, Int)] -> Int
sumOfIntervals xs = sum (map (\x -> snd x - fst x) $ compressedList sortedList)
  where sortedList = sortBy (\x y -> customCompare x y) xs


