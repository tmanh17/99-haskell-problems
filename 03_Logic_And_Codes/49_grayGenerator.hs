{-
(**) Gray codes.

An n-bit Gray code is a sequence of n-bit strings constructed according to certain rules. For example,

n = 1: C(1) = ['0','1'].
n = 2: C(2) = ['00','01','11','10'].
n = 3: C(3) = ['000','001','011','010',´110´,´111´,´101´,´100´].
Find out the construction rules and write a predicate with the following specification:

% gray(N,C) :- C is the N-bit Gray code
Can you apply the method of "result caching" in order to make the predicate more efficient, when it is to be used repeatedly?

Example in Haskell:

λ> gray 3
["000","001","011","010","110","111","101","100"]
-}
import Control.Monad (replicateM)

gray :: Int -> [String]
gray n = replicateM n ['0','1']

gray' :: Int -> [String]
gray' 0 = [""]
gray' n = let xs = gray' (n-1) in map ('0':) xs ++ map ('1':) xs

