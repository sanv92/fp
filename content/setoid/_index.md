+++
title = "Setoid"
description = "Setoid"
chapter = true
weight = 2
pre = "<b>2. </b>"
+++

# Setoid
A value which has a Setoid must provide an equals method. The equals method takes one argument:

Make array to Setoid:
```js
Array.prototype.equals = (arr) => {
  const len = this.length

  if (len !== arr.length) {
    return false
  }

  for (let i = 0; i < len; i++) {
    if (this[i] !== arr[i]) {
      return false
    }
  }

  return true
}

;[1, 2].equals([1, 2]) // true
;[1, 2].equals([0]) // false
```

---
#### Read More:
- https://medium.com/devschacht/tom-harding-fantas-eel-and-specification-3-setoid-78c2a0e8cc07
- http://www.tomharding.me/2017/03/09/fantas-eel-and-specification-3/
