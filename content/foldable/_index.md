+++
title = "Foldable"
description = "Foldable"
chapter = true
weight = 6
pre = "<b>6. </b>"
+++

# Foldable
A value which has a Foldable must provide a reduce method. The reduce method takes two arguments:

`u.reduce(f, x)`

## Graphic
{{<mermaid align="center">}}
graph LR;
    A[Foldable]
{{</mermaid>}}

## Example:

### Ramda:
```js
const toArray xs => xs.reduce(
  (acc, x) => acc.concat([x]), []
)

u.reduce(f) === toArray(u).reduce(f)
```

---
#### Read More:
- http://www.tomharding.me/2017/05/01/fantas-eel-and-specification-11/
