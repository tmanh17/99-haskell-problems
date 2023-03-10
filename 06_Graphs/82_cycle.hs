{-
(*) Cycle from a given node

Write a predicate cycle(G,A,P) to find a closed path (cycle) P starting at a given node A in the graph G. The predicate should return all cycles via backtracking.

Example in Haskell:

λ> cycle 2 [(1,2),(2,3),(1,3),(3,4),(4,2),(5,6)]
[[2,3,4,2]]
λ> cycle 1 [(1,2),(2,3),(1,3),(3,4),(4,2),(5,6)]
[]
-}


-- remove edge


import Graph


myCycle :: Int -> [(Int, Int)] -> [[Int]]
myCycle s edges = cycle' s s edges 0
    where 
        cycle' s t edges visits
            | length edges == 0  = []
            | s == t && visits /= 0 = [[t]] 
            | otherwise = [s:path | edge <- edges, path <- (cycle' (snd edge) t [e|e <- edges, e /= edge] (visits+1)), (fst edge) == s, s /= t || visits == 0]
                


--  import Data.List (partition)
--  cycle' :: Int -> [(Int, Int)] -> [ [Int] ]
--  cycle' n g = search [[n]] []
--    where search [] result = result
--          search cur result = search (go active) (arrive ++ result)
--            where split = partition end cur
--                  end s = (last s == n) && (length s /= 1)
--                  active = snd split
--                  arrive = fst split
--                  go ls = [ x ++ [snd y] | x <- ls, y <- g, last x == fst y, not (snd y `elem` tail x)]