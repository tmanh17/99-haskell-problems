{-
(**) Path from one node to another one

Write a function that, given two nodes a and b in a graph, returns all the acyclic paths from a to b.

Example in Haskell:

λ> paths 1 4 [(1,2),(2,3),(1,3),(3,4),(4,2),(5,6)]
[[1,2,3,4],[1,3,4]]
λ> paths 2 6 [(1,2),(2,3),(1,3),(3,4),(4,2),(5,6)]
[]
-}

import Graph
paths :: Int -> Int -> [(Int, Int)] -> [[Int]]
paths s t edges 
    | length (adj s) == 0  = []
    | s == t = [[t]] 
    | otherwise = [s:path | v <- adj s, path <- (paths v t edges), s /= t ]
        where 
            adj x = map snd (filter (\(a,b) -> a == x) edges)



-- import Data.List (partition)

-- pathsImpl :: Eq a => [a] -> a -> a -> [(a, a)] -> [[a]]
-- pathsImpl trail src dest clauses
--     | src == dest = [src:trail]
--     | otherwise = do
--         let (nexts, rest) = partition ((==src) . fst) clauses
--         next <- nexts
--         pathsImpl (src:trail) (snd next) dest rest

-- paths :: Eq a => a -> a -> [(a, a)] -> [[a]]
-- paths src dest clauses = map reverse (pathsImpl [] src dest clauses)


-- paths :: (Eq a) => a -> a -> [Arc a] -> [[a]]
-- paths source sink arcs 
--     | source == sink = [[source]]
--     | otherwise      = map (map fst) $ aux source []
--         where 
--             aux current pathSoFar = 
--                 let nextEdges = filter ((== current) . fst) arcs 
--                     notCyclic = not . (\(_,t) -> (t == source) || (elem t $ map snd pathSoFar)) 
--                     noCycles  = filter notCyclic nextEdges
--                 in  noCycles >>= \(f,t) -> do 
--                                               if (t == sink) then return $ pathSoFar ++ (f,t):[(t,t)]
--                                                              else aux t (pathSoFar ++ [(f,t)])