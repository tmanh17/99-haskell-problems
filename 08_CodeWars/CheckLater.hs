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



data Graph a = Graph [a] [(a, a)]
               deriving (Show, Eq)
			  
data Adjacency a = Adj [(a, [a])]
		   deriving (Show, Eq)

data Friendly a = Edge [(a, a)]
		  deriving (Show, Eq)

graphToAdj :: (Eq a) => Graph a -> Adjacency a
graphToAdj (Graph [] _)	     = Adj []
graphToAdj (Graph (x:xs) ys) = Adj ((x, ys >>= f) : zs)
   where 
      f (a, b) 
         | a == x = [b]
         | b == x = [a]
         | otherwise = []
      Adj zs = graphToAdj (Graph xs ys)

adjToGraph :: (Eq a) => Adjacency a -> Graph a
adjToGraph (Adj [])          = Graph [] []
adjToGraph (Adj ((v, a):vs)) = Graph (v : xs) ((a >>= f) ++ ys)
   where
      f x = if (v, x) `elem` ys || (x, v) `elem` ys
            then []
            else [(v, x)]
      Graph xs ys = adjToGraph (Adj vs)

graphToFri :: (Eq a) => Graph a -> Friendly a
graphToFri (Graph [] _)  = Edge []
graphToFri (Graph xs ys) = Edge (ys ++ zip g g)
   where
      g = filter (\x -> all (\(a, b) -> x /= a && x /= b) ys) xs

friToGraph :: (Eq a) => Friendly a -> Graph a
friToGraph (Edge []) = Graph [] []
friToGraph (Edge vs) = Graph xs ys
   where
      xs = foldr acc [] $ concat $ map (\(a, b) -> [a, b]) vs
      ys = filter (uncurry (/=)) vs
      acc x xs = if x `elem` xs then xs else x : xs

adjToFri :: (Eq a) => Adjacency a -> Friendly a
adjToFri = graphToFri . adjToGraph

friToAdj :: (Eq a) => Friendly a -> Adjacency a
friToAdj = graphToAdj . friToGraph