---
layout: default
title: ALG Library
permalink: /doc/alg/library
parent: ALG Language
grand_parent: Documentation
nav_order: 5
has_children: false
mathjax: true
---

# ALG Library
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

## Basics

ALG Library is a collection of standard ALG functions
that can be safely [`CALL`](function#call)ed.
Moreover, in function [`ESTIMATE`](function#estimate),
predefined compressed sensing algorithms are called which
are also in the ALG library.

Like MATLAB, the inside function name should be the same as the file name
except for the `.alg` file extension.
For example, `OMP` function is defined in file `/include/mmcesim/OMP.alg`.

***

## Algorithms

### OMP
Orthogonal matching pursuit.

{: .note-title }
> Source
>
> Defined in [`/include/mmcesim/OMP.alg`](https://github.com/mmcesim/mmcesim/blob/master/include/mmcesim/OMP.alg).

### LS
Least square (LS).

{: .note-title }
> Source
>
> Defined in [`/include/mmcesim/LS.alg`](https://github.com/mmcesim/mmcesim/blob/master/include/mmcesim/LS.alg).

### Oracle LS
Oracle least square (LS).

{: .note-title }
> Source
>
> Defined in [`/include/mmcesim/Oracle_LS.alg`](https://github.com/mmcesim/mmcesim/blob/master/include/mmcesim/Oracle_LS.alg).

### LS Support
Least square (LS) with specified support.

{: .note-title }
> Source
>
> Defined in [`/include/mmcesim/LS_support.alg`](https://github.com/mmcesim/mmcesim/blob/master/include/mmcesim/LS_support.alg).

## Other Utilities
