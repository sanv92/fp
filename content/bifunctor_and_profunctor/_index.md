+++
title = "Bifunctor and Profunctor"
description = "Bifunctor and Profunctor"
chapter = true
weight = 17
pre = "<b>17. </b>"
+++

# Bifunctor and Profunctor
---
## Graphic
{{<mermaid align="center">}}
graph LR;
    A[Functor] --> B[Bifunctor]
{{</mermaid>}}

**Bifunctor** (Either, Pair, Task) - class allows us to deal with two inner types (left and right!).
## Example:

### Either
```js
const { Left, Right } = require('fantasy-eithers')

Function.prototype.map = function (f) {
    return x => f(this(x))
}

//- Where everything changes...
const login = user =>
  user.name == 'Tom'
  ? Right(user)
  : Left('Boo')

//- Function map === "piping".
//+ failureStream :: String
//+               -> HTML
const failureStream =
  (x => x.toUpperCase())
  .map(x => x + '!')
  .map(x => '<em>' + x + '</em>')

//+ successStream :: User
//+               -> HTML
const successStream =
  (x => x.name)
  .map(x => 'Hey, ' + x + '!')
  .map(x => '<h1>' + x + '</h1>')

const user = { name: 'Tom' }

console.log(
  //- We can now pass in our two
  //- possible application flows
  //- using `bimap`!
  login(user).bimap(
    failureStream,
    successStream)
)
```

### Pair
```js
?
```

### Task
```js
?
```

**Profunctor** - ?
{{<mermaid align="center">}}
graph LR;
    A[Functor] --> B[Profunctor]
{{</mermaid>}}

---
#### Read More:
- http://www.tomharding.me/2017/06/26/fantas-eel-and-specification-18/
