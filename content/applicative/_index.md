+++
title = "Applicative"
description = "Applicative"
chapter = true
weight = 10
pre = "<b>10. </b>"
+++

# Applicative
**Applicative** types are **Apply** types with one extra function, which we define in Fantasy Land as "**of**":

With of, we can take a value, and lift it into the given Applicative. That’s it! In the wild, most Apply types you practically use will also be Applicative.

## Graphic
{{<mermaid align="center">}}
graph LR;
    A[Functor] --> B[Apply]
    B --> C[Applicative]
{{</mermaid>}}

## Example:
```js
const Container = function(x) {
    this.__value = x
}

Container.of = x => new Container(x)

Container.prototype.map = function(f) {
    return Container.of(f(this.__value))
}


Container.of(2).map((two) => two + 2); // Container {__value: 4}
```

---
#### Read More:
- http://www.tomharding.me/2017/04/17/fantas-eel-and-specification-9/
