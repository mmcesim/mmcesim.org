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
Well, that looks like $$\rm\LaTeX$$, right?
The familiar `\` character starting a command (sorry, that's called macro in LaTeX),
and inverse as `^{-1}`, transpose `^T`, and subscript with `_{}`!

{: .tip }
As a matter of fact, that can be even more like $$\rm\LaTeX$$,
with all brackets can be converted to `{}`, though parameters are separated by `,` not another `{}`.
For LaTeX fans, you may even use `^\star` or `^\ast` for conjugate in addition to the normal `^*`. Happy TeXing :-)

***

## Syntax Basics

***

## Operators

| Precedence | Operator | Description | Associativity |
| :-: | :-: | :-: | :-: |
| 1 | `()`, `{}` | Function call | Left-to-right |
| 2 | `^T`, `^H`, `^t`, `^i`, `^*`, `^{-1}` | Matrix superscript | Left-to-right |
| 3 | `!`, `+`, `-` | Logical NOT | Right-to-left | 
|^  | `+`, `-`  | a | b |

<table>
    <thead>
        <tr>
            <th>Experiment</th>
            <th>TestType</th>
            <th>Value</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td rowspan=2>Experiment 1</td>
            <td>TestType1</td>
            <td>98</td>
        </tr>
        <tr>
            <td>TestType2</td>
            <td>73</td>
        </tr>
        <tr>
            <td>Experiment 2</td>
            <td>TestType1</td>
            <td>93</td>
        </tr>
        <tr>
            <td>Experiment 3</td>
            <td>TestType2</td>
            <td>79</td>
        </tr>
    </tbody>
</table>

***

## Commands

***

## Subscripts

***

## Superscripts
