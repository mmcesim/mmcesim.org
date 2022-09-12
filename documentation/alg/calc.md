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
\sqrt(\accu(\pow(\abs(A_{1,:,2:5} - B^{-1}), 2))) * c * A @ (D ./ E^T) + \sin(f_{2})
```
Well, that looks like $$\rm\LaTeX$$, right?
The familiar `\` character starting a command (sorry, that's called macro in LaTeX),
and inverse as `^{-1}`, transpose `^T`, and subscript with `_{}`!

Well, let's write the above example in LaTeX (tough some informal Matlab style subscript)
<div class="code-example" markdown="1">

<!-- {% raw %} -->

$$
\begin{equation}
  \left\|\mathbf{A}_{1,:,2:5}-\mathbf{B}^{-1}\right\|_2\cdot c\mathbf{A}\cdot\left(\mathbf{D}\oslash\mathbf{E}^\mathsf{T}+\mathrm{ones}(\sin(\mathbf{f}_2))\right),
\end{equation}
$$

<!-- {% endraw %} -->
where $$\mathbf{A},\mathbf{B},\mathbf{D},\mathbf{E}$$ are matrices, $$c$$ is a scalar, $$\mathbf{f}$$ is a vector, $$\oslash$$ represents the element-wise division,
and $$\mathrm{ones}$$ represent a matrix with all elements as $$1$$.

</div>
<!-- {% raw %} -->
```tex
\left\|\mathbf{A}_{1,:,2:5}-\mathbf{B}^{-1}\right\|_2\cdot c\mathbf{A}\cdot\left(\mathbf{D}\oslash\mathbf{E}^\mathsf{T}+\mathrm{ones}(\sin(\mathbf{f}_2))\right)
```
<!-- {% endraw %} -->

{: .tip }
As a matter of fact, that can be even more like $$\rm\LaTeX$$,
with all brackets can be converted to `{}`, though parameters are separated by `,` not another `{}`.
For LaTeX fans, you may even use `^\star` or `^\ast` for conjugate in addition to the normal `^*`. Happy TeXing :-)

To make the language simple and efficiently convertible to C++, Python and Matlab/Octave,
some syntaxes from Python and Matlab are adopted in addition to The LaTeX look.

***

## Syntax Basics
There are [commands](#commands) starting with backslash (`\`),
[operators](#operators) and [superscript](#superscripts), [subscripts](#subscripts).

{: .warning-title }
> Variable Naming
>
> - Variable names should not contain reserved characters `` !@#$%^&*()[]{}\|/-+=~,.<>?:;"'` ``.
> - Variable name should also end with underscore (`_`).
> - Number can not be the first character of variable name.
> - Variable name should not clash with reserved keywords.

***

## Operators

### Operator List

| Operators | Description |
| :-: | :-: |
| `+`, `-` | (Unary/Binary) plus/minus |
| `*` | Scalar and scalar multiplication, Scalar and matrix multiplication |
| `@` | Matrix and matrix multiplication |
| `.*`, `./` | Element-wise multiplication, division |
| `!` | Logical NOT |
| `()`, `{}` | Command call |
| `<`, `<=`, `>`, `>=` | Relational operator $$<, \leq, >, \geq$$ |
| `==`, `!=` | Relational $$=$$ and $$\neq$$ |
| `&&` | Logical AND |
| `||` | Logical OR |
| `=` | Assign |

{: .important }
> Matrix and matrix multiplication is different from matrix scalar and scalar scalar multiplication.
> You should distinguish the use of `*` and `@`.
> (This is like the Python syntax.)
> 
> Element-wise multiplication `.*` is different from matrix multiplication `@`.
> (This is like the Matlab syntax.)

### Operator Precedence
The following table lists the precedence and associativity of ALG CALC operators.
Operators are listed top to bottom, in descending precedence.

| Precedence | Operator | Description | Associativity |
| :-: | :-: | :-: | :-: |
| 1 | `()`, `{}` | Command call | Left-to-right |
| 2 | `^T`, `^H`, `^t`, `^i`, `^*`, `^{-1}` | Matrix superscript | Left-to-right |
| 3 | `_{}` | Matrix subscript | Left-to-right |
| 4 | `!`, `+`, `-` | Logical NOT, unary plus/minus | Right-to-left |
| 5 | `*`, `@`, `.*`, `./` | Matrix (and element-wise) multiplication, division | Left-to-right |
| 6 | `+`, `-` | Addition and subtraction | Left-to-right |
| 7 | `<`, `<=`, `>`, `>=` | Relational operator $$<, \leq, >, \geq$$ | Left-to-right |
| 8 | `==`, `!=` | Relational $$=$$ and $$\neq$$ | Left-to-right |
| 9 | `&&` | Logical AND | Left-to-right |
| 10 | `||` | Logical OR | Left-to-right |
| 11 | `=` | Assign | Right-to-left |

{: .note }
The above table is so similar to that of C++.
Well, indeed, and it is adapted from [C++ Reference](https://en.cppreference.com/w/c/language/operator_precedence).

***

## Commands

### Command Usage Basics
Here are the basic rules for command usage:
- Commands start with character `\`;
- Command call has parameter list inside brackets `()`,
  and you may optionally use `{}` if you want the syntax more like $$\rm\LaTeX$$;
- Parameters are separated by comma (`,`).



***

## Subscripts

***

## Superscripts
