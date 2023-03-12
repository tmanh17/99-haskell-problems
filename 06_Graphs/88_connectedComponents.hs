{-
(**) Connected components (alternative solution)

Write a predicate that splits a graph into its connected components.

Example in Haskell:

λ> connectedComponents ([1,2,3,4,5,6,7], [(1,2),(2,3),(1,4),(3,4),(5,2),(5,4),(6,7)])
[[1,2,3,4,5][6,7]]
-}


import Data.List

type Node = Int
type Edge = (Node,Node)
type Graph = ([Node],[Edge])

dfs :: Graph -> Node -> [Node]
dfs (nodes, edges) c = dfs' (nodes, edges) [c]
    where 
        dfs' ([],_) _ = []
        dfs' (_,_) [] = []
        dfs' (nodes, edges) (top:stack)
            | [x|x<-nodes, x==top] == [] = dfs' (newNodes, edges) stack
            | otherwise = top : dfs' (newNodes, edges) (adjacent ++ stack)
                where
                    adjacent = [x | (x,y)<-edges,y==top] ++ [x | (y,x)<-edges,y==top]
                    newNodes = [x|x<-nodes, x/=top]

connectedComponents :: Graph -> [[Node]]
connectedComponents ([],_) = []
connectedComponents (x:nodes, edges) = connected : (connectedComponents (newNodes, edges))
    where 
        connected = dfs (x:nodes, edges) x
        newNodes = filter (\a -> not $ a `elem` connected) nodes

connectedcomponents' :: Graph -> [[Node]]
connectedcomponents' ([],_) = []
connectedcomponents' (top:v,e) 
    | remaining == [] = [connected]
    | otherwise = connected : connectedcomponents' (remaining, e)
        where
            connected = dfs (top:v,e) top
            remaining = (top:v) \\ connected



            