{-
(**) Depth-first order graph traversal (alternative solution)

Write a predicate that generates a depth-first order graph traversal sequence. The starting point should be specified, and the output should be a list of nodes that are reachable from this starting point (in depth-first order).

Example in Haskell:

λ> depthFirst ([1,2,3,4,5,6,7], [(1,2),(2,3),(1,4),(3,4),(5,2),(5,4),(6,7)]) 1
[1,2,3,4,5]
-}

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

