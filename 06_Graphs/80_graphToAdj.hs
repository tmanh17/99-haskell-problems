{-
(***) Conversions

Write predicates to convert between the different graph representations. With these predicates, all representations are equivalent; i.e. for the following problems you can always pick freely the most convenient form. The reason this problem is rated (***) is not because it's particularly difficult, but because it's a lot of work to deal with all the special cases.

Example in Haskell:

λ> graphToAdj (Graph ['b','c','d','f','g','h','k'] [('b','c'),('b','f'),('c','f'),('f','k'),('g','h')])
Adj [('b', "cf"), ('c', "bf"), ('d', ""), ('f', "bck"), ('g', "h"), ('h', "g"), ('k', "f")]

> adjToGraph (Adj [('b', "cf"), ('c', "bf"), ('d', ""), ('f', "bck"), ('g', "h"), ('h', "g"), ('k', "f")])

> graphToFri (Graph ['b','c','d','f','g','h','k'] [('b','c'),('b','f'),('c','f'),('f','k'),('g','h')])

-}

import Graph

graphToAdj :: (Eq a) => (Graph a) -> (Adjacency a)
graphToAdj (Graph [] _) = Adj []
graphToAdj (Graph (x:xs) adj)  = Adj ((findListOfX x adj):rest)
    where 
        Adj rest = graphToAdj (Graph xs adj)
        findListOfX x adj = (x, map (diffX x) (filter (\a -> fst a == x || snd a == x) adj))
        diffX x (a,b) = if x == a then b else a
        

adjToGraph :: (Eq a) => Adjacency a -> Graph a
adjToGraph (Adj []) = Graph [] []
adjToGraph (Adj ((x, ys):xs)) = Graph (x:v) ([(x, y) | y <- ys, not ((x,y) `elem` e) && (not $ elem (y,x) e)] ++ e)
    where
        Graph v e = adjToGraph (Adj xs)


adjToGraph' :: (Eq a) => Adjacency a -> Graph a
adjToGraph' (Adj [])          = Graph [] []
adjToGraph' (Adj ((v, a):vs)) = Graph (v : xs) ((a >>= f) ++ ys)
   where
      f x = if (v, x) `elem` ys || (x, v) `elem` ys
            then []
            else [(v, x)]
      Graph xs ys = adjToGraph' (Adj vs)



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