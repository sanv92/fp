+++
title = "Setoid"
description = "Setoid"
chapter = true
weight = 2
pre = "<b>2. </b>"
+++

# Setoid
---
A value which has a Setoid must provide an equals method. The equals method takes one argument:

## Graphic
{{<mermaid align="center">}}
graph LR;
    A[Setoid]
{{</mermaid>}}

## Example:

### Ramda:
```js
import { equals } from 'ramda'

equals([1, 2], [1, 2]) // true
equals([1, 2], [0]) // false
```

### Ramda (currying):
```js
import { equals } from 'ramda'

equals([1, 2])([1, 2]) // true
equals([1, 2])([0]) // false
```

---
#### Read More:
- https://medium.com/devschacht/tom-harding-fantas-eel-and-specification-3-setoid-78c2a0e8cc07
- http://www.tomharding.me/2017/03/09/fantas-eel-and-specification-3/
