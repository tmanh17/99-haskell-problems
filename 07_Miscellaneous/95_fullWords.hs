{-
(**) English number words

On financial documents, like cheques, numbers must sometimes be written in full words. Example: 175 must be written as one-seven-five. Write a predicate full-words/1 to print (non-negative) integer numbers in full words.

Example in Haskell:

λ> fullWords 175
one-seven-five
-}

import Data.Char
import Data.List

fullWords :: Int -> String
fullWords n = concat $ intersperse "-" [digits!!(digitToInt d) | d <- show n]
    where digits = ["zero", "one", "two", "three", "four",
                    "five", "six", "seven", "eight", "nine"]
