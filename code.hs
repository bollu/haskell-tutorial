-- {- #LANGUAGE ExplicitForall -#}

-- Lecture 1   [2016-08-17]

fact :: Int -> Int
-- fact :: Nat -> Nat
fact 0 = 1
fact n = n * (fact (n-1))

fact' :: Int -> Int
fact' x = if (x == 0) 
          then 1   
          else x * (fact' (x - 1))

-- merge [1,2,3,4] [8,9]  => [1, 8, 2, 9, 3, 4]

-- merge takes two lists and interleaves the elements. 

-- Problem: merge a of a list with another list

-- 1. merge of an empty list with any other list l is l.

-- 2. merge of a list l with an empty list is l.

-- 3. otherwise the first list is a pair a:as, 

--    the second list is b:bs.

-- The answer is a list whose first element is a, 
-- the second is b, and the rest of the list is the 
-- result of merging as with bs.

merge :: [a] -> [a] -> [a]
merge [] bs = bs
merge as []  = as
merge (a:as) (b:bs) = (a:b:(merge as bs))

-- Lecture 2  [2016-08-23]
-- tuples

-- how to build more complex structures using the basic building
-- blocks of haskell.
fst_of_3 :: (t1,t2,t3) -> t1
fst_of_3 (x,_,_) = x

snd_of_3 :: (t1, t2, t3) -> t2
snd_of_3 (_,y,_) = y

-- Types
-- values have types
-- Instantiating a type variable.
-- Subtypes and type hierarchies
-- Type class
-- Kind

-- Defining new (data) types from existing types

-- NumOrBool

data NumOrBool = Number (Int) | Boolean(Bool) | Empty deriving (Show)


workOnNumOrBool :: NumOrBool -> NumOrBool
workOnNumOrBool (Number i) = Number (i + 1)
workOnNumOrBool (Boolean b) = Boolean (not b)
workOnNumOrBool Empty = Boolean True



data OptionInt = SomeInt (Int) | NoneInt deriving (Show)
-- data OptionBool = Some (Bool) | None
-- data OptionChar = Some (Char) | None

add1ToNumOrBool' :: NumOrBool -> OptionInt
add1ToNumOrBool' (Number i) = SomeInt (i + 1)
add1ToNumOrBool' _ = NoneInt

data Option a = Some a | None deriving(Show)


add1ToNumOrBool :: NumOrBool -> Option Int
add1ToNumOrBool (Number i) = Some (i + 1)
add1ToNumOrBool _ = None

mult2ToOptionInt :: Option Int -> Option Int
mult2ToOptionInt (Some i) = Some (2 * i)
mult2ToOptionInt None = None

mult10ToOptionInt :: Option Int -> Option Int
mult10ToOptionInt (Some i) = Some (10 * i)
mult10ToOptionInt None = None


sub5ToOptionInt :: Option Int -> Option Int
sub5ToOptionInt (Some i) = Some (i - 5)
sub5ToOptionInt None = None


showOptionInt :: Option Int -> Option String
showOptionInt (Some i) = Some (show i)
showOptionInt None = None

liftToOption :: (a -> b) -> Option a -> Option b
liftToOption f None = None
liftToOption f (Some x) = Some (f x) -- x :: a 


data Repeated a = Zero | Once a | Twice a a
liftRepeated :: (a -> b) -> Repeated a -> Repeated b

Once 5
Twice 5 10
Twice 5 True
-- map :: (a -> b) -> [a] -> [b]


-- mapTuple :: (a -> b) -> (a, c) -> (b, c)

-- fmap :: Functor f => (a -> b) -> f a -> f b
-- if f = Option
-- fmap :: (a -> b) -> Option a -> Option b
--
-- if f = []
-- fmap :: (a -> b) -> [a] -> [b]
--
-- if f = (_, c)
-- fmap :: (a -> b) -> (a, c) -> (b, c)

-- data OptionOfThree a b c = AB a b | BC b c | AC a c deriving(Show)

-- Weekdays

data WeekDay = Mon | Tue | Wed | Thu | Fri | Sat deriving(Show)


nextWeekDay :: WeekDay -> WeekDay
nextWeekDay Mon = Tue
nextWeekDay Tue = Wed
nextWeekDay Wed = Thu
nextWeekDay Thu = Fri
nextWeekDay Fri = Sat
nextWeekDay Sat = Mon


-- Weekend

data WeekEnd = Sun


-- Todo
-- Nats

-- Positive integers

-- Defining type classes

-- Defining instances of type classes

