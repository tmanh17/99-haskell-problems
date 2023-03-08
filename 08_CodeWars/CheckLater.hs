module PIN where
import Control.Monad (mapM)

adjacent :: Char -> String
adjacent x = case x of
  '1' -> "124"
  '2' -> "1235"
  '3' -> "236"
  '4' -> "1457"
  '5' -> "24568"
  '6' -> "3569"
  '7' -> "478"
  '8' -> "57890"
  '9' -> "689"
  '0' -> "80"

getPINs :: String -> [String]
getPINs = mapM adjacent


module PIN where

import Control.Monad (liftM2)

adjacent :: Char -> String 
adjacent '1' = "124"
adjacent '2' = "1235"
adjacent '3' = "236"
adjacent '4' = "1457"
adjacent '5' = "24568"
adjacent '6' = "3569"
adjacent '7' = "478"
adjacent '8' = "57890"
adjacent '9' = "689"
adjacent '0' = "80"

getPINs :: String -> [String]
getPINs = foldr (liftM2 (:) . adjacent) [[]]
