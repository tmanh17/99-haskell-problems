Binary trees
A binary tree is either empty or it is composed of a root element and two successors, which are binary trees themselves. In Haskell, we can characterize binary trees with a datatype definition:

data Tree a = Empty | Branch a (Tree a) (Tree a)
              deriving (Show, Eq)
This says that a Tree of type a consists of either an Empty node, or a Branch containing one value of type a with exactly two subtrees of type a.

Given this definition, the tree in the diagram above would be represented as:

tree1 = Branch 'a' (Branch 'b' (Branch 'd' Empty Empty)
                               (Branch 'e' Empty Empty))
                   (Branch 'c' Empty
                               (Branch 'f' (Branch 'g' Empty Empty)
                                           Empty))
Since a "leaf" node is a branch with two empty subtrees, it can be useful to define a shorthand function:

leaf x = Branch x Empty Empty
Then the tree diagram above could be expressed more simply as:

tree1' = Branch 'a' (Branch 'b' (leaf 'd')
                                (leaf 'e'))
                    (Branch 'c' Empty
                                (Branch 'f' (leaf 'g')
                                            Empty)))
Other examples of binary trees:

-- A binary tree consisting of a root node only
tree2 = Branch 'a' Empty Empty

-- An empty binary tree
tree3 = Empty

-- A tree of integers
tree4 = Branch 1 (Branch 2 Empty (Branch 4 Empty Empty))
                 (Branch 2 Empty Empty)