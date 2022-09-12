---
layout: default
title: Data Type
permalink: /doc/alg/type
nav_order: 1
parent: ALG Language
grand_parent: Documentation
has_children: false
---

# Data Type of ALG Language
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

## Why Need Data Type
Languages Python and Matlab/Octave are weakly typed
which can be convenient for writing the code.
However, that is problematic for implementation.
The efficiency is not satisfactory compared to C++,
and sometimes you may encounter ambiguous error information in Matlab.
Therefore, for the sake of efficiency and generality,
ALG language is designed to be **strongly typed**.

## Structure
The type specification is very simple,
because ALG language concentrates on matrices.
Basically, the structure of ALG language is
[**prefix**](#prefix) + [**dimension**](#dimension) + [**suffix**](#suffix).
For example, `f2c` means a matrix (dimension is 2) with data type as float
and property as a constant.

To specify a variable,
add `::` between the variable and data type.
For example, `a::f0` has type `f0` (a float scalar).

## Specifiers

### Prefix

#### Basic Type Prefix

Basic type just names the element type.

| Prefix | Type | C++ Type | Python Type | Matlab/Octave Type |
| :-: | :-: | :-: | :-: | :-: |
| `c` | Complex | [`cx_double`](http://arma.sourceforge.net/docs.html#cx_double) | `complex` | [`complex`](https://www.mathworks.com/help/matlab/ref/complex.html) |
| `f` | Float | `double` | `double` | [`double`](https://www.mathworks.com/help/matlab/ref/double.html) |
| `i` | Integer | `int` | `int` | [`int64`](https://www.mathworks.com/help/matlab/ref/int64.html) |
| `u` | Unsigned Integer | [`uword`](http://arma.sourceforge.net/docs.html#uword) | `uint` | [`uint64`](https://www.mathworks.com/help/matlab/ref/uint64.html) |
| `b` | Boolean | `bool` | `bool` | [`logical`](https://www.mathworks.com/help/matlab/ref/logical.html) |
| `s` | String | [`std::string`](https://en.cppreference.com/w/cpp/string/basic_string) | `str` | [`string`](https://www.mathworks.com/help/matlab/ref/string.html) |
| `h` | Character | `char` | `char` | [`char`](https://www.mathworks.com/help/matlab/ref/char.html) |

#### Alias Prefix

Alias prefixes not only set the element type,
but also the dimension.
They are the one character alias for a two-character type.

| Alias Prefix | Type | Equivalent Two-character Type |
| :-: | :-: | :-: |
| `v` | (Column) Vector | `c1` |
| `r` | Row Vector | `c2` |
| `m` | Matrix | `c2` |
| `t` | Tensor | `c3` |
| `d` | Double | `f0` |

{: .important }
> `v`, `r`, `m` and `t` are all for **complex** types.
> For a non-complex type, you need to use the normal two-character way.
>
> Row vector (`r`) is actually regarded as a matrix for simplicity,
> so its dimension is still 2.
> Only column vector (`c`) is the real vector.
> But there can be differences in terms of [`INIT`](function#init),
> so it should not be confused with `m`.

### Dimension

Dimensions range from 0 to 3.

| Dimension | Type | C++ Type |
| :-: | :-: | :-: |
| 0 | Scalar | -- |
| 1 | Vector | [`Col`](http://arma.sourceforge.net/docs.html#Col) |
| 2 | Matrix | [`Mat`](http://arma.sourceforge.net/docs.html#Mat) |
| 3 | Tensor | [`Cube`](http://arma.sourceforge.net/docs.html#Cube) |

{: .warning }
Dimension for a scalar can not be omitted.

Please note that matrices are stored in **column major** order,
which is the default order in C++ (Armadillo) and Matlab/Octave.
In Python (NumPy), it is equivalent to the option `order='F'`.

{: .attention }
You should always remember the column **major order**,
especially if you use are accustomed to Python.
The order will make a big difference to matrix reshape and vectorization.

### Suffix

| Suffix | Meaning | C++ | Python | Matlab/Octave |
| :-: | :-: | :-: | :-: | :-: |
| `c` | Constant | [`const`](https://en.cppreference.com/w/cpp/language/cv) | (None) | [`persistent`](https://www.mathworks.com/help/matlab/ref/persistent.html) |
| `r` | Reference | [`reference`](https://en.cppreference.com/w/cpp/language/cv) | (None) | (None) |

{: .note }
Two suffixes cannot be used together and there is also no need to do so.
The use of `r` is mainly in [`FUNCTION`](function#function),
allowing a parameter to be changed inside the function body.
