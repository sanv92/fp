+++
title = "Semigroup"
description = "Semigroup"
chapter = true
weight = 4
pre = "<b>4. </b>"
+++

# Semigroup

## Graphic
{{<mermaid align="center">}}
graph LR;
    A[Semigroup]
{{</mermaid>}}

Semigroup must have a concat method. The concat method takes one argument:
`s.concat(b)`


A Semigroup’s concat method must take another value of the same type, and return a third value of the same type.

## Examples
### JavaScript’s "String" type is already semigroup:
```js
// 'hello, world!'
'hello'.concat(', world!')

// This operation is associative, too!
'hello'.concat(', ').concat('world!')
'hello'.concat(', '.concat('world!'))
```

### JavaScript’s "Arrays" are already valid semigroups, too:
```js
[1, 2].concat([3, 4]) // [1, 2, 3, 4]

// Aaand it's associative!
[1].concat([2, 3]).concat([4])
[1].concat([2, 3].concat([4]))
```

### Concat with custom type:
```js
const Sum = (value) => ({
  value,
  concat: (y) => Sum(value + y.value),
  empty: () => Sum.empty()
})

Sum.empty = () => Sum(0)

Sum.prototype.concat = function (that) {
  return Sum(this.val + that.val)
}

Sum(2).concat(Sum(3)).value // 5
```

---
#### Read More:
- http://www.tomharding.me/2017/03/13/fantas-eel-and-specification-4/
