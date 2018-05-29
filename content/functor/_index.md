+++
title = "Functor"
description = "Functional JavaScript: Functors"
chapter = true
weight = 1
pre = "<b>1. </b>"
+++

# Functor

![container](container.gif)

**So, What are Functors?**
Functors are the containers or type that can be used with ‘map’ function.

**Example:**
```js
Container.prototype.map = function (f) {
  return Container.of(f(this.$value));
};

Container.of(2).map(two => two + 2);
```

```js
[1, 2, 3].map((num) => num + 2);
```

Read more:
- https://hackernoon.com/functors-in-javascript-20a647b8f39f
