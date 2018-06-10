+++
title = "Ord"
description = "Ord"
chapter = true
weight = 3
pre = "<b>3. </b>"
+++

# Ord
- Ord type contains types, the values of which can be ordered.

- Ord contain functions **(>) - gt, (<) - lt, (>=) - gte, (<=) - lte**,
given any two values of a given Ord type,
you can determine whether one be greater than the other.

- Ord is almost identical to Setoid’s equals,
the only difference is that, this time, we return a boolean to indicate whether `this <= that`,
rather than `this == that`. Using only **gt, lt, gte, lte** and **equals** (because every Ord is a Setoid),
we can derive all the things we might want:

## Graphic
{{<mermaid align="center">}}
graph LR;
    A[Setoid] --> B(Ord)
{{</mermaid>}}

## Example
```js
import { equals } from 'ramda'

// Greater than. The OPPOSITE of lte.
// gt :: Ord a => a -> a -> Boolean
const gt = (x, y) => {
  return !lte(x, y)
}

// Greater than or equal.
// gte :: Ord a => a -> a -> Boolean
const gte = (x, y) => {
  return gt(x, y) || equals(x)(y)
}

// Less than. The OPPOSITE of gt!
// lt :: Ord a => a -> a -> Boolean
const lt = (x, y) => {
  return !gte(x, y)
}

// Less than or equal. The OPPOSITE of gte!
// lte :: Ord a => a -> a -> Boolean
const lte = (x, y) => {
  return x <= y
}
```

Read more:
- http://www.tomharding.me/2017/04/09/fantas-eel-and-specification-3.5/
