{-
(**) Syntax checker

In a certain programming language (Ada) identifiers are defined by the syntax diagram below.

Transform the syntax diagram into a system of syntax diagrams which do not contain loops; i.e. which are purely recursive. Using these modified diagrams, write a predicate identifier/1 that can check whether or not a given string is a legal identifier.

Example in Prolog:

% identifier(Str) :- Str is a legal identifier 
Example in Haskell:

λ> identifier "this-is-a-long-identifier"
True
λ> identifier "this-ends-in-"            
False
λ> identifier "two--hyphens" 
False
-}

import Data.Char

identifier :: [Char] -> Bool
identifier (x:xs) = isLetter x &&  loop xs
    where
        loop [] = True 
        loop (y:ys)
            | y == '-' = (not . null) ys && isAlphaNum (head ys) && loop (tail ys)
            | isAlphaNum y = loop (ys)
            | otherwise = False