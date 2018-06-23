+++
title = "Monoid"
description = "Monoid"
chapter = true
weight = 5
pre = "<b>5. </b>"
+++

# Monoid
## Graphic
{{<mermaid align="center">}}
graph LR;
    A[Semigroup] --> B(Monoid)
{{</mermaid>}}


### Binary operation
*"This is not binary data "101010", as you thought at first time*.

This means, that both inner data will have the same type, and when we return result, it will have also the same type
and this types will be equal.

### Identity
Empty value
```
// ''.concat('hello')
//   === 'hello'.concat('')
//   === 'hello'
String.empty  = () => ''

// [].concat([1, 2, 3])
//   === [1, 2, 3].concat([])
//   === [1, 2, 3]
Array.empty   = () => []
```

### Associative operation
It just means that the order in which you perform the addition or multiplication of a series of numbers doesn’t matter:
```
(0 + 1) + 2 = 0 + (1 + 2)
(1 * 2) * 3 = 1 * (2 * 3)
```

---

With a Semigroup type, you can combine one or more values to make another, right?

All a monoid does is let us upgrade that to zero or more.


As a surprisingly good intuition, monoids encapsulate the logic of Array.reduce. That’s what they do. That’s what they’re for. That’s it right there. If you know how to reduce lists, then congratulations, you’re now a monoid warrior:

## Example:
### Reduce list
<p data-height="500" data-theme-id="0" data-slug-hash="ERPmpE" data-default-tab="js,result" data-user="sanderv1992" data-embed-version="2" data-pen-title="Monoid" class="codepen">See the Pen <a href="https://codepen.io/sanderv1992/pen/ERPmpE/">Monoid</a> by SanderV1992 (<a href="https://codepen.io/sanderv1992">@sanderv1992</a>) on <a href="https://codepen.io">CodePen</a>.</p>
<script async src="https://static.codepen.io/assets/embed/ei.js"></script>

### Parallel
```js
// In practice, you'd want a generator here...
// Non-tail-recursion is expensive in JS!
const chunk = xs => xs.length < 5000
  ? [xs] : [ xs.slice(0, 5000)
           , ... chunk(xs.slice(5000)) ]

// ... You get the idea.
const parallelMap = f => xs => xs.map(x =>
  RunThisThingOnANewThread(f, x))

// Chunk, fold in parallel, fold the result.
// In practice, this would probably be async.
const foldP = M => xs =>
  parallelMap(fold(M))(chunk(xs))
  .reduce(
    (xs, ys) => xs.concat(ys),
    M.empty())

// With all that in place...

// Numbers from 0 to 999,999...
const bigList = [... Array(1e6)].map((_, i) => i)

// ... Ta-da! 499999500000
// Parallel-ready map/reduce; isn't it *neat*?
foldP(Sum)(bigList).val
```
---

So, monoids let us write easily-optimised and expressive reduce operations.

---
#### Read More:
- http://www.tomharding.me/2017/03/21/fantas-eel-and-specification-5/
- https://marmelab.com/blog/2018/04/18/functional-programming-2-monoid.html
- https://wiki.haskell.org/Monoid
