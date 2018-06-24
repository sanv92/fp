+++
title = "Functor"
description = "Functional JavaScript: Functors"
chapter = true
weight = 1
pre = "<b>1. </b>"
+++

# Functor
---
![container](container.gif)

**So, What are Functors? (JavaScript)**

"Functors" are the containers or type that can be used with **"map"** function.


## Graphic
{{<mermaid align="center">}}
graph LR;
    A[Functor]
{{</mermaid>}}

## Example:
```js
Container.prototype.map = (f) => {
  return Container.of(f(this.$value));
};

Container.of(2).map(two => two + 2);
```

```js
[1, 2, 3].map((num) => num + 2);
```

---

**Just what is a Functor, really? (Haskell)**

Functor is "typeclass" (A lot of people coming from OOP get confused by typeclasses because they think they are like classes in object oriented languages).

A Functor is any data type that defines how **"fmap"** applies to it. Here's how **"fmap"** works:
{{< highlight hs >}}
class Functor f where
    fmap :: (a -> b) -> f a -> f b
{{< /highlight >}}

{{< highlight hs >}}
> fmap (+3) (Just 2)
-- Just 5
{{< /highlight >}}

![fmap](fmap_just.png)

---
#### Read More:
- https://hackernoon.com/functors-in-javascript-20a647b8f39f
- https://en.wikibooks.org/wiki/Haskell/The_Functor_class
- http://learnyouahaskell.com/types-and-typeclasses
