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

Note that **whitespace does not matter** and are actually removed before parsing.

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

The function naming convention mainly follows that of [Armadillo](https://arma.sourceforge.net/docs.html) which is also similar to MATLAB.

### \dictionary
Generate a dictionary matrix.

#### Maths Representation
{: .no_toc }

The complex dictionary matrix is used in compressed sensing (CS).
For a uniform linear array (ULA) with size $$M$$ and grid size $$M^G$$,
the dictionary $$\mathbf{V}\in\mathbb{C}^{M\times M^G}$$
is defined as
<!-- {% raw %} -->

$$
\begin{equation}\label{eq:dictionary}
  \frac1{\sqrt{M}}\exp\left(-2\pi i\cdot d\cdot\mathbf{x}_M\mathbf{u}_{M^G}^\mathsf{H}\right),
\end{equation}
$$

<!-- {% endraw %} -->
where $$\mathbf{x}_M=[0,1,2,\cdots,M-1]^\mathsf{T}$$, $$\mathbf{u}_{M^G}=[-1,-1+\frac2{M^G},-1+\frac4{M^G},\cdots,1-\frac2{M^G}]^\mathsf{T}$$
and $$d$$ is the antenna spacing which is assumed to be $$1/2$$ in the current version.

For a uniform planar array (UPA) with size $$M=M_xM_y$$,
the dictionary is defined as
<!-- {% raw %} -->

$$
\begin{equation}
  \mathbf{V}_M=\mathbf{V}_{M_x}\otimes\mathbf{V}_{M_y},
\end{equation}
$$

<!-- {% endraw %} -->
where $$\otimes$$ denotes the Kronecker product,
and $$\mathbf{V}_{M_x}$$ and $$\mathbf{V}_{M_y}$$ can both be calculated with $$\eqref{eq:dictionary}$$.

#### ALG Implementation
{: .no_toc }

The return value is the generated dictionary matrix which has type `c2c` (const complex matrix).

| Position | Meaning | Descriptions |
| :-: | :-: | :- |
| 1 | `Mx` | ULA size or UPA $$x$$ dimension size. | 
| 2 | `My` | $$1$$ for ULA and $$y$$ dimension size for UPA. | 
| 3 | `GMx` | ULA grid size or UPA $$x$$ dimension grid size. |
| 4 | `GMy` | $$1$$ for ULA and $$y$$ dimension grid size for UPA. |

#### Example
{: .no_toc }

```alg
# UPA Antenna size: 16x6, Grid size: 16x16
D = \dictionary(16, 8, 16, 16)
# This creates a new instance of dictionary matrix
D::mc = NEW \dictionary(16, 8, 16, 16)
# Use macro to create a dictionary at the transmitter side
D::mc = NEW `DICTIONARY.T`
```

{: .tip }
For simplicity, you may use [macros](macro)
to simplicity the `\dictionary` function.
The `` `DICTIONARY.T` `` and `` `DICTIONARY.R` `` macros
can be used to represent the dictionary at the transmitter side and receiver side
without specifying the parameters as long as they are specified in the `nodes`
section of `.sim` configuration.


***

## Subscripts
Subscripts take the subview of vector/matrix/tensor.
The syntax is `_{<sub>}` (a leading underscore `_` as in LaTeX),
where the brackets cannot be omitted
even if `sub` contains only one character.

{: .warning }
> The subscript syntax imposes a requirement for variables:
> variables cannot be ended with character underscore (`_`).
>
> Due to internal underscore is allowed for variable names,
> the subscript is only recognized when brackets `{}` exists.

### Foo Subscripts
Well, some subscripts just do nothing, so they are removed.
They are `_{}`, `_{:}`, `_{:,:}`, `_{:,:,:}`.

### Valid Subscripts
The contents inside `_{}` of valid subscripts are similar
to MATLAB syntax except for indices start from 0.
I do not want to elaborate the rule here
but only give several examples,
and you can find the pattern easily.

```alg
# x is a vector (dim = 1)
# A is a matrix (dim = 2)
# Z is a tensor (dim = 3)
x_{2} # [scalar] the 2-nd element of vector
x_{1:4} # [vector] elements 1,2,3,4 of vectors
x_{index} # [scalar] (index of type u0) the index-element of vector
x_{indices} # [vector] (indices of type u1) elements of indices in vector
A_{3,2} # [scalar] the element at position (3,2)
A_{2,index} # [scalar] (index of type u0)
A_{2,:} # [rowvec] the 2-nd row
A_{:,3} # [vector] the 3-nd column
A_{1,3:5} # [vector] elements (1,3),(1,4),(1,5)
A_{2:4,indices} # [matrix] (indices of type u1)
A_{15} # [scalar] the 15-th element in the flattened matrix as vector
A^T_{1,2} # [scalar] element (1,2) of A^T, i.e. element (2,1) of A
A_{1:3,:}^H # [scalar] the conjugate transpose of sub matrix (Mind the sequence!)
Z_{0,0,0} # [scalar] element (0,0,0) of tensor
Z_{:,:,2} # [matrix] the 2-nd slice of tensor
Z_{:,:,indices} # [tensor] (indices of type u1) slices of tensor
```

{: .warning }
Using indices vector of type `u1` for a tensor is only supported
for the last dimension (i.e. the slice).

***

## Superscripts

Supper scripts are led by caret (`^`) as in LaTeX.

### Transpose and Conjugate Transpose

#### Real Matrices
{: .no_toc }

The transpose for a real matrix is `^t` or `^{t}`.

#### Complex Matrices
{: .no_toc }

The transpose for a complex matrix is `^T` or `^{T}`,
and the conjugate transpose for a complex matrix is `^H` or `^{H}`.

{: .warning }
> There can be compiling error if `^T` and `^t` are misused!

### Conjugate

The conjugate of a complex number/vector/matrix/tensor is
`^*`, `^{*}`, `^\star`, `^{\star}`, `^\ast` or `^{\ast}`.
(Wow, so LaTeX!!!)

{: .warning }
> You should not calculate the conjugate for a real number/vector/matrix/tensor.

### Inverse

The inverse of a square matrix is `^{-1}`, `^i` or `^I`.

For a non-square matrix, you may use `\pinv` (pseudo-inverse) function.
