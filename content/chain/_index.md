+++
title = "Chain"
description = "Chain"
chapter = true
weight = 12
pre = "<b>12. </b>"
+++

# Chain
---
## Graphic
{{<mermaid align="center">}}
graph LR;
    A[Functor] --> B[Apply]
    B --> D[Chain]
{{</mermaid>}}

Each time we **map** with a Maybe-returning function, we call **map** to flatten the two Maybe layers into one. **map, join, map, join**, and so on.

Back in the Traversable post, we saw that the map/sequence pattern was common enough that we gave it an alias: traverse.

Wouldn’t you know it, the same applies here: the **map/join** pattern is so common, we call it **chain**.

## Example:

### Before
```js
//+ join :: Maybe (Maybe a) ~> Maybe a
Maybe.prototype.join = function () {
  return this.cata({
    Just: x => x,
    Nothing: () => Nothing
  })
}

prop('a')(data) // Just({ b: { c: 2 } })
.map(prop('b')).join() // Just({ c: 2 })
.map(prop('c')).join() // Just(2)

prop('a')(data) // Just({ b: { c: 2 } })
.map(prop('badger')).join() // Nothing
.map(prop('c')).join() // Nothing
```

### After
```js
//+ chain :: Maybe a ~> (a -> Maybe b)
//+                  -> Maybe b
Maybe.prototype.chain = function (f) {
  return this.cata({
    Just: f,
    Nothing: () => this // Do nothing
  })
}

// Just like `sequence` is `traverse` with
// `id`,  `join` is `chain` with `id`!
//+ join :: Chain m => m (m a) ~> m a
const join = xs => xs.chain(x => x)

// Our example one more time...
prop('a')(data) // Just({ b: { c: 2 } })
.chain(prop('b')) // Just({ c: 2 })
.chain(prop('c')) // Just(2)
```

---
#### Read More:
- http://www.tomharding.me/2017/05/15/fantas-eel-and-specification-13/
