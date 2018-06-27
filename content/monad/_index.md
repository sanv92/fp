+++
title = "Monad"
description = "Monad"
chapter = true
weight = 14
pre = "<b>14. </b>"
+++

# Monad (Maybe, Either, IO)
---
**"Monads"** apply a function that returns a wrapped value.
![recap](recap.png)

- **functors:** you apply a function to a wrapped value using **fmap** or **<$>**
- **applicatives:** you apply a wrapped function to a wrapped value using **<*>**
- **monads:** you apply a function that returns a wrapped value, to a wrapped value using **>>=**

## Graphic
{{<mermaid align="center">}}
graph LR;
    A[Functor] --> B[Apply]
    B --> D[Applicative]
    D --> C[Monad]

    Z[Chain] --> C[Monad]
    B --> Z[Chain]
{{</mermaid>}}


### Maybe
**"Maybe"** is a Functor, an Applicative, and a Monad.
![applicative](maybe.png)

Suppose **"half"** is a function that only works on even numbers:

##### Example (JavaScript):
```js
const { Option, Some, None, Result } = require('@es2/result-option') // 0.2.0


const half = (num) => (num % 2 === 0)
  ? Some(num / 2)
  : None()

const test1 = Some(100).chain(half).extractOr(0)
console.log('test1: ', test1) // 50

const test1_1 = Some(2).chain(half).extractOr(0)
console.log('test1_1: ', test1_1) // 1

const test2 = Some(3).chain(half).extractOr(0)
console.log('test2: ', test2) // 0

const test3 = Some(4).chain(half).extractOr(0)
console.log('test3: ', test3) // 2

const test4 = Some(None).chain(half).extractOr(0)
console.log('test4: ', test4) // 0

const test5 = Some(20).chain(half).chain(half).chain(half).extractOr(0)
console.log('test5: ', test5) // 0

const test6 = Some(20).chain(half).chain(half).extractOr(0)
console.log('test6: ', test6) // 5
```


##### Example (Haskell):
{{< highlight hs >}}
class Monad m where
    (>>=) :: m a -> (a -> m b) -> m b

instance Monad Maybe where
    Nothing >>= func = Nothing
    Just val >>= func  = func val
{{< /highlight >}}

{{< highlight hs >}}
half x = if even x
    then Just (x `div` 2)
    else Nothing

> Just 2 >>= half
-- Just 1

> Just 3 >>= half
-- Nothing

> Just 4 >>= half
-- Just 2

> Nothing >>= half
-- Nothing

> Just 20 >>= half >>= half >>= half
-- Nothing

> Just 20 >>= half >>= half
-- Just 5
{{< /highlight >}}

{{< highlight hs >}}
-- If we have a Just value, we can extract the underlying value it contains through pattern matching.
half x = if even x
    then Just (x `div` 2)
    else Nothing

zeroAsDefault :: Maybe Int -> Int
zeroAsDefault mx = case mx of
    Nothing -> 0
    Just x -> x

calc1 = Just 2 >>= half
calc2 = Just 3 >>= half
calc3 = Just 4 >>= half
calc4 = Just 5 >>= half
calc5 = Just 6 >>= half

main = do
    (\x -> putStrLn ("just 2: " ++ show x )) ( zeroAsDefault calc1 ) -- 1
    (\x -> putStrLn ("just 3: " ++ show x )) ( zeroAsDefault calc2 ) -- 0
    (\x -> putStrLn ("just 4: " ++ show x )) ( zeroAsDefault calc3 ) -- 2
    (\x -> putStrLn ("just 5: " ++ show x )) ( zeroAsDefault calc4 ) -- 0
    (\x -> putStrLn ("just 6: " ++ show x )) ( zeroAsDefault calc5 ) -- 3
{{< /highlight >}}

---


### Either
The Either monad is sometimes used to represent a value which is either correct or an error,
the **Left** constructor is used to hold an error value and the **Right** constructor is used to hold a correct value.

##### Example (JavaScript):
```js
-
```

##### Example (Haskell):
{{< highlight hs >}}
import Text.Read


validateAge :: String -> Either String Int
validateAge input =
    case readMaybe input of
    Nothing  -> Left "Invalid input. Not a number"
    Just age -> case age of
                _ | age < 0    -> Left "Error: Invalid age. It must be greater than zero."
                _ | age <= 18  -> Left "Error: Below legal age to sign the contract."
                _ | age > 200  -> Left "Error: Invalid age. Impossible age."
                _              -> Right age

main :: IO ()
main = do
    (\x -> putStrLn ("-100: " ++ show x )) ( validateAge "-100" )
    (\x -> putStrLn ("16: " ++ show x )) ( validateAge "16" )
{{< /highlight >}}


---

### IO
The IO monad wraps computations in the following context: “This computation can read information from or write information to the terminal, file system, operating system, and/or network”.

If you want to get user input, print a message to the user, read information from a file, or make a network call, you’ll need to do so within the IO Monad.

Function called main, has type IO (), every program starts in the IO monad.

![recap](monad_io.png)

##### Example (JavaScript):
```js
-
```

##### Example (Haskell):
{{< highlight hs >}}
toList :: String -> [Integer]
toList input = read ("[" ++ input ++ "]")

main :: IO ()
main = do
    putStrLn "What is your name?" >> getLine
    >>= \name -> putStrLn ("Hello, " ++ name ++ "!")
{{< /highlight >}}

{{< highlight hs >}}
type Login = String
type Password = String

users :: [(Login, Password)]
users =
    [ ("admin", "1234")
    , ("begemot", "0000")
    ]

askPassword :: IO Bool
askPassword = do
    putStr "Enter Login: "
    login <- getLine
    putStr "Enter password: "
    password <- getLine
    return $ maybe False (\p -> p == password) $ lookup login users

main :: IO ()
main = do
    passwordIsCorrect <- askPassword
    putStrLn $ if passwordIsCorrect
        then "Welcome!"
        else "Incorrect password"
{{< /highlight >}}

---
#### Read More:
- http://www.tomharding.me/2017/06/05/fantas-eel-and-specification-15/
- http://adit.io/posts/2013-04-17-functors,_applicatives,_and_monads_in_pictures.html
- https://habr.com/post/183150/
- https://github.com/SanderV1992/Haskell-learn-functional-programming/blob/master/app/monads/maybe/2.hs
- https://github.com/SanderV1992/Haskell-learn-functional-programming/blob/master/app/monads/either/5.hs
