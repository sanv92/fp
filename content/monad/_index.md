+++
title = "Monad"
description = "Monad"
chapter = true
weight = 14
pre = "<b>14. </b>"
+++

# Monad (Maybe, Either, IO)
---
**"Maybe"** is a Functor, an Applicative, and a Monad,
"Monads" apply a function that returns a wrapped value.


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
![applicative](maybe.png)

Suppose **"half"** is a function that only works on even numbers:

##### Example (JavaScript):
```js
const { Option, Some, None, Result } = require('@es2/result-option')


const half = (num) => (num % 2 === 0)
  ? Some(num / 2)
  : None()

const test1 = Some(100).chain(half).unwrapOr(0)
console.log('test1: ', test1) // 50

const test1_1 = Some(2).chain(half).unwrapOr(0)
console.log('test1_1: ', test1_1) // 1

const test2 = Some(3).chain(half).unwrapOr(0)
console.log('test2: ', test2) // 0

const test3 = Some(4).chain(half).unwrapOr(0)
console.log('test3: ', test3) // 2

const test4 = Some(None).chain(half).unwrapOr(0)
console.log('test4: ', test4) // 0

const test5 = Some(20).chain(half).chain(half).chain(half).unwrapOr(0)
console.log('test5: ', test5) // 0

const test6 = Some(20).chain(half).chain(half).unwrapOr(0)
console.log('test6: ', test6) // 5
```


##### Example (Haskell):
```js
class Monad m where
    (>>=) :: m a -> (a -> m b) -> m b

instance Monad Maybe where
    Nothing >>= func = Nothing
    Just val >>= func  = func val
```

```js
half x = if even x
    then Just (x `div` 2)
    else Nothing

> Just 2 >>= half
Just 1

> Just 3 >>= half
Nothing

> Just 4 >>= half
Just 2

> Nothing >>= half
Nothing

> Just 20 >>= half >>= half >>= half
Nothing

> Just 20 >>= half >>= half
Just 5

```
---


### Either
text text text text ...


##### Example (JavaScript):
```js
-
```

##### Example (Haskell):
```js
-
```

---

### IO
text text text text ...


##### Example (JavaScript):
```js
-
```

##### Example (Haskell):
```js
-
```

---
#### Read More:
- http://www.tomharding.me/2017/06/05/fantas-eel-and-specification-15/
- http://adit.io/posts/2013-04-17-functors,_applicatives,_and_monads_in_pictures.html
- https://habr.com/post/183150/
