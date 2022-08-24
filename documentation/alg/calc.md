---
layout: default
title: Calculation (CALC)
permalink: /doc/alg/calc
parent: ALG Language
grand_parent: Documentation
nav_order: 3
has_children: false
mathjax: true
---

# Calculation (CALC) in ALG Language
{: .no_toc }

<details open markdown="block">
  <summary>
    Table of contents
  </summary>
  {: .text-delta }
- TOC
{:toc}
</details>

***

## Design Inspirations

Let's have a look at the example below.
```tex
\accu(\abs(A_{1,:,2:5} - B^{-1})) * c @ (D ./ E^T) + \sin(f_{2})
```
Well, that looks like $$\LaTeX$$, right?
The familiar `\` character starting a command (sorry, that's called macro in LaTeX),
and inverse as `^{-1}`, transpose `^T`, and subscript with `_{}`!

{: tip }
As a matter of fact, that can be even more like $$\LaTeX$$,
with all brackets can be converted to `{}`, though parameters are separated by `,` not another `{}`.

## Syntax Basics

## Operators

## Commands

## 
