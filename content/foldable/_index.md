+++
title = "Foldable"
description = "Foldable"
chapter = true
weight = 6
pre = "<b>6. </b>"
+++

# Foldable
---
A value which has a Foldable must provide a reduce method. The reduce method takes two arguments:

`xs.reduce(f, m)`

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
- https://ru.wikipedia.org/wiki/%D0%A1%D0%B2%D1%91%D1%80%D1%82%D0%BA%D0%B0_%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D0%B0
