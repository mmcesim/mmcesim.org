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
<details open markdown="block">
  <summary>
    Table of contents
  </summary>
  {: .text-delta }
- TOC
{:toc}
</details>

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
So the structure of ALG language is
[**prefix**](#prefix) + [**dimension**](#dimension) + [**suffix**](#suffix).
For example, `f2c` means a matrix (dimension is 2) with data type as float
and property as a constant.

To specify a variable,
add `::` between the variable and data type.

## Specifiers

### Prefix

### Dimension

### Suffix
