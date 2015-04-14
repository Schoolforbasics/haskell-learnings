-- Lesson one, using http://learnyouahaskell.com/starting-out
-- Started with this tutorial:
-- https://www.fpcomplete.com/school/starting-with-haskell/introduction-to-haskell/1-haskell-basics
-- but it didn't keep my attention, somehow, whereas LYAH has.. YMMV
--
-- Goals:
--   Explore the basics of Haskell, write something that does something
--   Make better sense of syntax, figure out how to express myself in this new world
--   Complete a single/whole section/chapter of a beginner's tutorial
--
-- License: MIT, 2015
--
-- Updates: 4/10-12, 2015

-- note: the `Prelude` module is imported by default, for us, and which provides the
-- building blocks available to us

-- the `digitToInt` function is in this module
import Data.Char

-- define a function, `doubleMe`, which accepts `x` and returns `x * 2`,
-- where x is of type `Float`
doubleMe x = x * 2 :: Float

-- define `doubleUs` as a function which accepts Floats `a` and `b`,
-- returning "the sum of their double" - reuse the `doubleMe` function
doubleUs a b = doubleMe a + doubleMe b :: Float

-- Return `x` if `x` is greater than 100, else return `x * 2`
doubleSmallerNumber x = do
    if x <= 100
        then x*2
        else x :: Float

-- from http://stackoverflow.com/a/8588602
toFloat x = fromRational x :: Float

-- list comprehensions: [a | a <- s, odd a]
boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]

-- define data objects to play with
i = 300 :: Int
n = 10 :: Integer
f = 20.0 :: Float
d = doubleUs f 4.22 :: Float

-- lists to play with
lostNumbers = [ 4,8,15,16,23,42 ]
nums = 5:[10,15] ++ 20:15:[1,2,3,4,5] ++ [67,89]
msg = "Love is all that exists, all is Love"
empty = []

-- use `Data.Char` to do something
a = digitToInt('A')

main = do
    -- convert `n` from `Integer` to `Int` (I forget the difference, but not the same type)
    print (i + fromIntegral(n))
    -- use the functions we've defined above
    print (doubleMe 4.2)
    print (doubleMe d)
    print (doubleSmallerNumber (doubleMe 100))
    -- play with arrays
    print nums
    print msg
    print lostNumbers
    -- adding arrays
    print ("hello" ++ " " ++ "world")
    -- `:` will add an object to the array
    print ('H':"ello")
    print ('A':' ':"small cat."++" Says 'meow!'")
    print 'A'
    print a
    print (nums ++ [a])
    print (nums ++ lostNumbers)
    -- `!!` retrieves the nth element in an array, 0 is the first index
    -- if `n` is too large for the array provided, we will see:
    -- `The code threw an exception : ErrorCall: Prelude.(!!): index too large`
    print (lostNumbers !! 2)
    -- list of lists, with a list generator as the last list
    print [lostNumbers, [a], [0,0], nums, [(x*2) | x <- nums]]
    -- I could not get this to work without spending more time in another tutorial
    --print [lostNumbers, nums, [a], [fromRational (doubleMe (toFloat x)) | x <- nums]]
    -- I'm getting tried of () around prints to make them happy, switch to $
    -- lists can be compared
    print $ [0] == [0]
    print $ [0, 1] < [1,2]
    print $ [0,1] <= [1,1]
    -- interesting.. this evaluates as True b/c the third elements are not evaluated
    print $ [0,1,100] < [1,3]
    -- use head/tail & last/init
    print $ head nums
    print $ head [nums, lostNumbers]
    print $ head [[head nums], lostNumbers]
    print $ head [tail nums, lostNumbers]
    -- empty lists fail
    -- print $ head empty 
    -- these next two are the same
    print nums
    print $ take (length nums) nums
    --
    print lostNumbers
    -- last element
    print $ last lostNumbers
    -- everything by the last element
    print $ init lostNumbers
    -- there has got to be a better way to do this..
    print $ doubleMe $ toFloat $ fromIntegral $ last lostNumbers
    -- take returns a _new_ list
    print $ take 0 nums
    -- use `null` to check if a list has no elements
    if null empty
       then print "NULL!"
       else print "the `empty` array is not empty!"
    -- reverse a list
    print nums
    print $ reverse nums
    print $ drop 2 nums
    print $ nums
    print $ drop 5 nums
    print $ drop 20 nums
    print $ maximum nums
    print $ maximum(  drop 3 ( init nums))
    print $ maximum $ drop 3 $ init nums
    print $ sum $ lostNumbers ++ nums
    print $ sum lostNumbers
    print $ product $ drop 5 nums
    print $ product nums
    print $ product $ 0:nums
    -- `elem` will tell us if an object is an element of a list
    print $ 'L' `elem` msg
    -- notice how 0 must be provided as a Char, b/c `msg` is a list of Chars
    print $ '0' `elem` msg
    -- the following fails the type check
    -- print $ n `elem` msg
    print $ [11..22]
    print $ ['C'..'L']
    print "cycle takes a list and cycles it into an infinite list"
    print $ take 20 $ cycle [1,3,9,27]
    print "Repeat is similar, but different"
    print "be careful, set a limit on what you ask for"
    print $ take 27 $ repeat 13
    print "`replicate` makes a lot of sense in these cases.."
    print $ replicate 3 9
    print $ "let us do some list comprehension"
    print $ [a^2 | a <- [1,3..27]]
    print $ "now with a conditional"
    print $ [a^3 | a <- [1,3..27], a^2 > 127 ]
    print $ boomBangs [7..27]
    print $ "list comprehensions can have multiple conditionals (predicates)"

