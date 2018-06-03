+++
title = "Monad"
description = "Monad"
chapter = true
weight = 14
pre = "<b>14. </b>"
+++

# Monad
## Graphic
{{<mermaid align="center">}}
graph LR;
    A[Functor] --> B[Apply]
    B --> D[Alternative]
    D --> C[Monad]

    Z[Chain] --> C[Monad]
    B --> Z[Chain]
{{</mermaid>}}
A Monad is a type that is both a Chain and an Applicative.

Monads: Maybe, Either, IO


---
#### Read More:
- http://www.tomharding.me/2017/06/05/fantas-eel-and-specification-15/
