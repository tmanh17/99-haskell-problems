module Graph where

data Graph a = Graph [a] [(a, a)]
               deriving (Show, Eq)
			  
data Adjacency a = Adj [(a, [a])]
		   deriving (Show, Eq)

data Friendly a = Edge [(a, a)]
		  deriving (Show, Eq)