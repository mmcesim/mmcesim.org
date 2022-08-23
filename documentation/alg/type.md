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
For example, `a::f0` has type 

## Specifiers

### Prefix

#### Basic Type Prefix

Basic type just names the element type.

| Character | Type | C++ Type | Python Type | Matlab/Octave Type |
| :-: | :-: | :-: | :-: | :-: |
| `c` | Complex | [`cx_double`](http://arma.sourceforge.net/docs.html#cx_double) | `complex` | [`complex`](https://www.mathworks.com/help/matlab/ref/complex.html) |
| `f` | Float | `double` | `double` | [`double`](https://www.mathworks.com/help/matlab/ref/double.html) |
| `i` | Integer | `int` | `int` | [`int64`](https://www.mathworks.com/help/matlab/ref/int64.html) |
| `u` | Unsigned Integer | [`uword`](http://arma.sourceforge.net/docs.html#uword) | `uint` | [`uint64`](https://www.mathworks.com/help/matlab/ref/uint64.html) |
| `b` | Boolean | `bool` | `bool` | [`logical`](https://www.mathworks.com/help/matlab/ref/logical.html) |
| `s` | String | [`std::string`](https://en.cppreference.com/w/cpp/string/basic_string) | `str` | [`string`](https://www.mathworks.com/help/matlab/ref/string.html) |
| `h` | Character | `char` | `char` | [`char`](https://www.mathworks.com/help/matlab/ref/char.html) |

#### Alias Prefix

### Dimension

### Suffix
