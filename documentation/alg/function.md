---
layout: default
title: Function
permalink: /doc/alg/function
parent: ALG Language
grand_parent: Documentation
nav_order: 2
has_children: false
mathjax: true
---

# Function of ALG Language
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

## Syntax Basics

The initiative of proposing a new programming language for algorithm
implementation is based on the multi-backend design of mmCEsim.
The language is specially designed so that it can be exported to C++
(with Armadillo), Python (with NumPy) and Matlab/Octave easily.

Every line of ALG language calls a function.
Let's first have a look at its basic structure before we cover its details.

```ruby
ret1::type1 ret2 = FUNC param1 param2::type2 key1=value1 key2=value2::type3 # comments
```

It may look like an assembly language at the first glance,
due to all parameters are separated by space.
But it is actually much more convenient.
Here are some basic rules:
- All tokens are separated by space.
- Function names are in all upper cases, like `CALC`, `WHILE`.
- Indentation does not matter. Blocks are ended with [`END`](#end).
- The function line is mainly composed of three parts:
  **return values**, **function name** and **parameters**,
  in the left to right direction.
- Some functions may not have return values, and you may also omit the return values.
  If there are return values, there is a `=` between return values and function names.
- Function name is the first word on the right of `=` (if there are return values)
  or the first word of line (if there is no return value).
- Like Python, parameters can be passed in by two ways:
  1. **value in position**: Like `param1` and `param2` in the above example.
    Parameters in different positions correspond to different usages in the function.
    This is the only way in C++.
  2. **key and value**: Parameters can also be specified using key and its
    corresponding value. `value1` and `value2` are passed in using this method.
    It should be noted that there should be no space around the `=` between key and value.

  There are some special cases that parameters are viewed as a whole,
  for example [`COMMENT`](#comment) and [`CALC`](#calc).
- If a parameter contains space or special characters, you need to use the
  double quotes like `"param with space"` and escape special characters as in
  C++ and Python.
- You may optionally specify the type of return value and parameters with `::`
  after the value. For example, in the above example `dtype1`, `dtype2` and `dtype3`
  are type specifications for `ret1`, `param2` and `value2`, respectively.
  For more information about data type, please refer to
  [data type of ALG language](type).
- Like Python, the backslash (`\`) at the end of the line can be used for continuing
  the function on next line.
- Comments start with the hash (`#`) like Python.

{: .caution }
There should be no space around the `=` between key and value for parameters.
For example, `key=val` is valid while `key = val` is forbidden.

Special rules may be applied for different functions.
Please refer to the specific documentation for each function.

***

## BREAK
Break from a block (for [`FOR`](#for), [`FOREVER`](#forever), [`LOOP`](#loop), [`WHILE`](#while)).

### Explanations
{: .no_toc }

The same as `break` in C++, Python and Matlab/Octave.
This function takes no parameter.

### Example
{: .no_toc }

[Example with `FOREVER`](#forever).

***

## CALC
Make arithmetic calculations.

### Explanations
{: .no_toc }

There are two kinds of `CALC` usage: **inline** and **standalone**.
- **inline**: The contents to be calculated are placed in a set of dollar signs,
  like LaTeX syntax: `$some operations to be calculated$`.
- **standalone**: This is like a normal function, with function name as `CALC`.
  You may also omit the function name `CALC` since it is the default function name
  if nothing is specified.
  Therefore, `result = CALC your expression` is equivalent to `result = your expression`.

For more information about the `CALC` usage,
please refer to [CALC details](calc).

{: .note }
In the current version, all spaces inside `CALC` are eliminated,
so string operations should be avoided.

{: .warning }
For safety, you should not use anything other than ANSI characters in `CALC` functions.
Otherwise, there can be undefined behaviour.

### Example
{: .no_toc }

<div class="code-example" markdown="1">

C++
```cpp
a = arma::sin(b) * c;
a = b.t() + c.i();
c = b(2, 3);
c = arma::abs(b(arma::span::all, 3)) + arma::pow(b, 2);
arma::exp2(a + c % d) / e.st() - f(arma::span::all, 3, arma::span(1, index));
```

</div>
<!-- {% raw %} -->
```ruby
a = CALC b + 2 # explicit CALC function
a = \sin(b) @ c # implicit CALC function
a = b^H + c^{-1} # conjugate transpose and inverse
c = b_{2, 3} # get element of a matrix
c = \abs{b_{:, 3}} + \pow(b_{}, 2) # use : in subscript & use {} for function
\exp2(a + c .* d) ./ e^T -f_{:,3,1:index} # element-wise operator and subscript : range
```
<!-- {% endraw %} -->

***

## CALL
Call a custom function defined by [`FUNCTION`](#function).

***

## COMMENT
Place a line of comment in the exported code.

### Explanations
{: .no_toc }

All contents after the function keyword `COMMENT` are considered as comments.

{: .note }
In the current version,
all spaces in the comment between words will be changed into one whitespace.
In future releases, comment text will remain its original style.

### Example
{: .no_toc }

<div class="code-example" markdown="1">

C++
```cpp
// Hi, this is a comment!
```

Python
```py
# Hi, this is a comment!
```

Matlab/Octave
```matlab
% Hi, this is a comment!
```

</div>
```
COMMENT Hi, this is a comment!
```

***

## CPP
Write standard C++ contents.

### Explanations
{: .no_toc }

All contents after the `CPP` keywords are copied to exported codes.
For backend other than C++, this function is ignored.

### Example
{: .no_toc }

<div class="code-example" markdown="1">

C++
```cpp
std::cout << "Standard C++ Language!" << std::endl;
```

Python/Matlab/Octave
```
                                                      <--- (Nothing)
```

</div>
```ruby
CPP std::cout << "Standard C++ Language!" << std::endl;
```

***

## ELSE
Used in [`IF`](#if) block.

### Explanations
{: .no_toc }

This function implements as `else` in C++, Python and Matlab/Octave.
There is no parameter for `ELSE` function.

### Example
{: .no_toc }

Example with [`IF`](#if).

***

## ELIF
Alias for the continuous [`ELSE`](#else) and [`IF`](#if).

### Explanations
{: .no_toc }

The parameter is the same as [`IF`](#if).

### Example
{: .no_toc }

Example with [`IF`](#if).

***

## END

End of a block (for [`ELSE`](#else), [`ELIF`](#elif), [`FOR`](#for),
[`FOREVER`](#forever), [`IF`](#if), [`LOOP`](#loop), [`WHILE`](#while)).

### Explanations
{: .no_toc }

In C++, this functions as `}`,
in Python it is the indentation goes back for one block.
In Matlab/Octave, it is the `end` specification.

### Example
{: .no_toc }

Example with [`FOR`](#for), [`FOREVER`](#forever), [`IF`](#if),
[`LOOP`](#loop), [`WHILE`](#while).

***

## ESTIMATE
[CALL](#call) [standard ALG functions](library) to estimate the sparse channel
with compressed sensing (CS).

***

## Function
Start a function definition.

### Explanations
{: .no_toc }

The function requires an [`END`](#end) to mark the end of function.

***

## IF
Conditional statement.

### Explanations
{: .no_toc }

This works the same as `if` in C++, Python, Matlab/Octave.
All contents after the `IF` keyword are part of the condition.
If you insist using the key value style, the key is `cond`.

### Example
{: .no_toc }

<div class="code-example" markdown="1">

C++
```cpp
if (arma::accu(arma::pow(arma::abs(A), 2)) > 0.1 * threshold) {
    if (b < 0) {
        b = 0;
    } else if (b > 100) {
        b = 100;
    } else {
        b = -b;
    }
} else {
    if (c == d) {
        A = A * 0.1;
    }
}
```

</div>
```ruby
IF \accu(\pow(\abs(A), 2)) > 0.1 * threshold
  IF b < 0
    b = 0
  ELIF b > 100
    b = 100
  ELSE
    b = -b
  END
ELSE
  IF cond="c == d" # use key value style if you insist
    A = A * 0.1
  END
END
```

***

## INIT
Initialize a variable.

### Explanations
{: .no_toc }

This function can initialize a **scalar**, a **vector**, a **matrix** and a **tensor**.
The initialization target can be specified in two ways:
- **return value type specification**: You can specify the type of the variable to be
  initialized by `::`.
- **parameters**: Parameter `dtype` is used for element type,
  and `dim1`, `dim2`, `dim3` are used for dimension specification.

{: .warning }
> Please be **consistent**!
> The current implementation of the function is fragile and can be fooled by
> any inconsistent actions. While we are trying to enhance the error detection,
> you are advised to use the correct dimension.
>
> However, there are also a few exceptions for user's convenience.
> Though row vector (`r`) is regarded as a matrix,
> you can still specify its dimension with only one parameter on `dim1`.
> For a scalar initialization, the value can directly follow `=`.

| Position | Parameter Key | Descriptions |
| :-: | :-: | :- |
| 1 | `dim1` | Size of the first dimension (for vector). | 
| 2 | `dim2` | Size of the second dimension (for vector and matrix). | 
| 3 | `dim3` | Size of the third dimension (for vector, matrix and tensor). |
| 4 | `fill` | Element filling mode. `randn` for standard normal distribution $$\mathcal{N}(0, 1)$$, `randu` for standard uniform distribution $$\mathcal{U}(0, 1)$$, `zeros` for filling as 0, `ones` for filling as 1. Default option is `zeros`. |
| 5 | `scale` | Scale of the value. This works like multiplying a value after the initialization by `fill`. |
| 6 | `dtype` | Element data type. This is the one character [prefix](type#basic-type-prefix) like `c`, `i`. The default value is complex (`c`). |

For initialization of a row vector (`r`), you may just use one dimension.
For initialization of a scalar (dimension as 0), you can specify the value directly after `=`,
but if you want to use `fill` and `scale`, you must specify the parameter key.

{: .tip }
Since the development of ALG concentrates on matrix operations,
the initialization also performs in a matrix-oriented way.
Please refer to [data type of ALG language](type) is you are not sure
how the data type works.

### Example
{: .no_toc }

<div class="code-example" markdown="1">

C++
```cpp
cx_mat a = (4) * arma::ones<cx_mat>(4, 3);
cx_mat b = (-1 + i) * arma::zeros<cx_mat>(1, 10);
const double pi = 3.1415926;
std::complex<double> random_number = (-2) * arma::randn<std::complex<double>>();
```

</div>
```ruby
a = INIT 4 3 fill=ones scale=4 dtype=c # a matrix
b::r = INIT 10 scale="-1+i" # row vector (viewed as a matrix)
pi::f0c = INIT 3.1415926 # a const float
random_number = INIT fill=randn scale=-2
```

***

## FOR
Start a `for` loop.

### Explanations
{: .no_toc }

The parameters are similar to C++.

| Position | Parameter Key | Descriptions |
| :-: | :-: | :- |
| 1 | `init` | Initialization before entering the loop. | 
| 2 | `cond` | Condition to continue into the loop. | 
| 3 | `oper` | Operation after each iteration. |

{: .note }
If there is `=` or other special characters inside your parameter or there exists space,
do remember to place them inside double quotes (`"`).

### Example
{: .no_toc }

<div class="code-example" markdown="1">

C++
```cpp
for (uword i = 0; i != 10; i = i + 2) {
    // Do something here in the for loop.
}
```

</div>
```ruby
FOR "i::u0 = INIT 0" "i != 10" "i=i+2" # a for loop taking three parameters
  COMMENT "Do something here in the for loop."
END
```

***

## FOREVER
Repeat in the block until [`BREAK`](#break).

### Example
{: .no_toc }

<div class="code-example" markdown="1">

C++
```cpp
while (1) {
    break;
} 
```

</div>
```ruby
FOREVER # takes no param
  BREAK # Wow, nothing is done when I just break here [Lol]
END
```

***

## LOOP
Loop with iteration counter.

### Descriptions
{: .no_toc }

The `LOOP` function uses an iteration counter to control the loop.
The parameters are shown as below.

| Position | Parameter Key | Descriptions |
| :-: | :-: | :- |
| 1 | `begin` | The starting iteration counter. | 
| 2 | `end` | The end iteration counter (not included). | 
| 3 | `step` | Iteration counter step. |
| 4 | `from` | The starting iteration counter. |
| 5 | `to` | The last interaction counter (included if step walks into it). |

{: .tip }
Normally, we use the `begin` + `end` format.
You may also use `from` + `to` format,
but the two formats cannot be used together.

The return value is the iteration counter.
If it is not specified, the default one is `i`.
You may also use `::` to specify the iteration counter type.

### Example
{: .no_toc }

<div class="code-example" markdown="1">

C++
```cpp
for (auto i = 0; i < 10; ++i) {
    // 0, 1, 2, ..., 9
    for (auto j = 10; j >= 0; --j) {
        // 10, 9, 8, ..., 0
    }
    for (uword k = 0; k < 10; k += 2) {
        // 0, 2, 4, 6, 8
    }
}
```

</div>
```ruby
LOOP 0 10 # implicit counter name as 'i'
  COMMENT 0, 1, 2, ..., 9
  j = LOOP from=10 to=0 step=-1
    COMMENT 10, 9, 8, ..., 0
  END
  k::u0 = LOOP begin=0 end=10 step=2 # specify counter type
    COMMENT 0, 2, 4, 6, 8
  END
END
```

***

## PRINT
Print the contents.

***

## WHILE
Repeat while the condition satisfies.

### Explanations
{: .no_toc }

This is the same as C++, Python and Matlab/Octave.
The function takes only one parameter.
(If you do need a key value style, it has key `cond`.)

{: .tip }
Since only one parameter is needed,
all contents after the `WHILE` keyword is viewed as the stop condition.
So there is no need to quote the condition which is required in [`FOR`](#for).

### Example
{: .no_toc }

<div class="code-example" markdown="1">

C++
```cpp
while (i != 100 && result == false) {
    // Do something in the while loop.
}
```

</div>
```ruby
WHILE i != 100 && result == false # no quote is needed because there will be only one param
  COMMENT "Do something in the while loop."
END
```
