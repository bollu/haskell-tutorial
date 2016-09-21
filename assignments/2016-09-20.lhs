How to run
==========
this file can be directly compiled / interpreted, since it is a 
literate haskell file. Simply load the file normally like so:

$ ghci
*Main>:l 2016-09-20.lhs


Then run main like so:

*Main> main

One should get all the outputs as "true"

Refreshing our memory
=====================

Remember that we had created the Option datatype

> data Option a = Some a | None deriving(Show, Eq)

and we had a lift function

> liftOpt :: (a -> b) -> Option a -> Option b
> liftOpt f (Some a) = Some (f a)
> liftOpt _ None = None


and the apply function

> apOpt :: Option(a -> b) -> Option a -> Option b
> apOpt (Some f) (Some a) = Some (f a)
> apOpt _ _ = None


We used these to implement


> liftOpt2 :: (a -> b -> c) -> Option a -> Option b -> Option c
> liftOpt2 f oa ob = apOpt (liftOpt f oa) ob


1. Using operators for apply / lift on Option
=============================================

Consider the two operators <$> and <*> which are aliases for
liftOpt and ap respectively.


> (<$>) :: (a -> b) -> Option a -> Option b 
> (<$>) = liftOpt

> (<*>) :: Option (a -> b) -> Option a -> Option b
> (<*>) = apOpt

Note that

1. liftOpt f oa == f <$> oa
2. apOpt of ob = of <*> ob

how can I implement

> liftOpt2' :: (a -> b -> c) -> Option a -> Option b -> Option c
> liftOpt2' f oa ob = undefined
> -- make this test case pass
> liftOpt2Test = (liftOpt2 (+) (Some 1) (Some 2) == (Some 3)) &&
>                 (liftOpt2 (+) (Some 2) (None) == None)

what about

> liftOpt3 :: (a -> b -> c -> d) -> Option a -> Option b -> Option c -> Option d
> liftOpt3 f oa ob oc = undefined

(fill undefined so the program typechecks, using <$> and <*>)

2. Exercise on ap for Lists
===========================

> apList :: [a -> b] -> [a] -> [b]
> apList lf la = undefined
> -- make this test case pass
> apListTest = apList [(\x -> 1 + x), (\x -> x - 2), (\x -> x + 3)] [1, 2, 3] == ([2, 0, 6] :: [Int])

with the behaviour that this takes the nth function of the list [a -> b] and runs
it on the nth value in [a]


Execution Part (do not touch)
=============================

Do not touch this, this will print "True" or "False". Make all of these true

> main :: IO ()
> main = do
> print ("liftOpt2: " ++ (show liftOpt2Test))
> print ("apList test:" ++ (show apListTest))
