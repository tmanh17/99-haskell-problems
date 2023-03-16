{-
(**) Knight's tour

Another famous problem is this one: How can a knight jump on an NxN chessboard in such a way that it visits every square exactly once? A set of solutions is given on the The_Knights_Tour page.

Hints: Represent the squares by pairs of their coordinates of the form X/Y, where both X and Y are integers between 1 and N. (Note that '/' is just a convenient functor, not division!) Define the relation jump(N,X/Y,U/V) to express the fact that a knight can jump from X/Y to U/V on a NxN chessboard. And finally, represent the solution of our problem as a list of N*N knight positions (the knight's tour).

There are two variants of this problem:

find a tour ending at a particular square
find a circular tour, ending a knight's jump from the start (clearly it doesn't matter where you start, so choose (1,1))
Example in Haskell:

λ> head $ knightsTo 8 (1,1)
[(2,7),(3,5),(5,6),(4,8),(3,6),(4,4),(6,5),(4,6),
(5,4),(7,5),(6,3),(5,5),(4,3),(2,4),(1,6),(2,8),
(4,7),(6,8),(8,7),(6,6),(4,5),(6,4),(5,2),(7,1),
(8,3),(6,2),(8,1),(7,3),(8,5),(7,7),(5,8),(3,7),
(1,8),(2,6),(3,4),(1,5),(2,3),(3,1),(1,2),(3,3),
(1,4),(2,2),(4,1),(5,3),(7,4),(8,2),(6,1),(4,2),
(2,1),(1,3),(2,5),(1,7),(3,8),(5,7),(7,8),(8,6),
(6,7),(8,8),(7,6),(8,4),(7,2),(5,1),(3,2),(1,1)]
λ> head $ closedKnights 8  
[(1,1),(3,2),(1,3),(2,1),(3,3),(5,4),(6,6),(4,5),
(2,6),(1,8),(3,7),(5,8),(4,6),(2,5),(4,4),(5,6),
(6,4),(8,5),(7,7),(6,5),(5,3),(6,1),(4,2),(6,3),
(8,2),(7,4),(5,5),(3,4),(1,5),(2,7),(4,8),(3,6),
(1,7),(3,8),(5,7),(7,8),(8,6),(6,7),(8,8),(7,6),
(8,4),(7,2),(5,1),(4,3),(3,5),(1,4),(2,2),(4,1),
(6,2),(8,1),(7,3),(5,2),(7,1),(8,3),(7,5),(8,7),
(6,8),(4,7),(2,8),(1,6),(2,4),(1,2),(3,1),(2,3)]
-}



type Square = (Int, Int)

add :: Square -> (Int, Int) -> Square
add a (x,y) = (fst a + x, snd a + y)

nextMoves :: Square -> [Square]
nextMoves (x,y) = [(x+a, y+b) | (a,b) <- [(-2,-1),(-1,-2),(1,-2),(2,-1),(2,1),(1,2),(-1,2),(-2,1)]]

onBoard :: Int -> Square -> Bool
onBoard n (x,y) = x >= 1 && x <= n && y >= 1 && y <= n

-- knightsTo :: Int -> Square -> [[Square]]
-- knightsTo n s = knightsTo' n s s []
--     where 
--         knightsTo' n s c visited 
--             | length visited == n*n-1 = [[]]
--             | otherwise = [c:rest | adj <- (nextMoves c), rest <- knightsTo' n s adj (c:visited), (isSafe n adj visited)]
--                 where 
--                     isSafe n (x,y) visits = (onBoard n (x,y)) && (x,y) `notElem` visits


-- module Knights where

-- import Data.List
-- import Data.Ord (comparing)

-- type Square = (Int, Int)

-- -- Possible knight moves from a given square on an nxn board
-- knightMoves :: Int -> Square -> [Square]
-- knightMoves n (x, y) = filter (onBoard n)
--         [(x+2, y+1), (x+2, y-1), (x+1, y+2), (x+1, y-2),
--          (x-1, y+2), (x-1, y-2), (x-2, y+1), (x-2, y-1)]

-- -- Is the square within an nxn board?
-- onBoard :: Int -> Square -> Bool
-- onBoard n (x, y) = 1 <= x && x <= n && 1 <= y && y <= n

-- -- Knight's tours on an nxn board ending at the given square
-- knightsTo :: Int -> Square -> [[Square]]
-- knightsTo n finish = [pos:path | (pos, path) <- tour (n*n)]
--   where tour 1 = [(finish, [])]
--         tour k = [(pos', pos:path) |
--                 (pos, path) <- tour (k-1),
--                 pos' <- sortImage (entrances path)
--                         (filter (`notElem` path) (knightMoves n pos))]
--         entrances path pos =
--                 length (filter (`notElem` path) (knightMoves n pos))

-- -- Closed knight's tours on an nxn board
-- closedKnights :: Int -> [[Square]]
-- closedKnights n = [pos:path | (pos, path) <- tour (n*n), pos == start]
--   where tour 1 = [(finish, [])]
--         tour k = [(pos', pos:path) |
--                 (pos, path) <- tour (k-1),
--                 pos' <- sortImage (entrances path)
--                         (filter (`notElem` path) (knightMoves n pos))]
--         entrances path pos
--           | pos == start = 100  -- don't visit start until there are no others
--           | otherwise = length (filter (`notElem` path) (knightMoves n pos))
--         start = (1,1)
--         finish = (2,3)

-- -- Sort by comparing the image of list elements under a function f.
-- -- These images are saved to avoid recomputation.
-- sortImage :: Ord b => (a -> b) -> [a] -> [a]
-- sortImage f xs = map snd (sortBy cmpFst [(f x, x) | x <- xs])
--   where cmpFst = comparing fst



knights' :: Int -> [[(Int,Int)]]
knights' n = loop (n*n) [[(1,1)]]
    where loop 1 = map reverse . id
          loop i = loop (i-1) . concatMap nextMoves

          nextMoves already@(x:xs) = [next:already | next <- possible]
              where possible = filter (\x -> on_board x && (x `notElem` already)) $ jumps x

          jumps (x,y)    = [(x+a, y+b) | (a,b) <- [(1,2), (2,1), (2,-1), (1,-2), (-1,-2), (-2,-1), (-2,1), (-1,2)]]
          on_board (x,y) = (x >= 1) && (x <= n) && (y >= 1) && (y <= n)