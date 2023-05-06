---
layout: default
title: CLI Options
permalink: /doc/cli/options
parent: CLI Application
grand_parent: Documentation
nav_order: 1
has_children: false
---

# CLI Commands and Options
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

## Help Yourself

With `mmcesim -h`, you can view all supported commands and options.
```
mmCEsim 0.2.1  (C) 2022-2023 Wuqiong Zhao
Millimeter Wave Channel Estimation Simulation
=============================================

Usage: mmcesim <command> <input> [options]

Commands:
  sim [ simulate ]       run simulation
  dbg [ debug ]          debug simulation settings
  exp [ export ]         export code
  cfg [ config ]         configure mmCEsim options
  (Leave empty)          generic use

Allowed options:

Generic options:
  -v [ --version ]       print version string
  -h [ --help ]          produce help message
  --gui                  open the GUI app

Configuration:
  -o [ --output ] arg    output file name
  -s [ --style ] arg     style options (C++ only, with astyle)
  -l [ --lang ] arg      export language or simulation backend
  --value arg            value for configuration option
  -f [ --force ]         force writing mode
  -V [ --verbose ]       print additional information
  --no-error-compile     do not raise error if simulation compiling fails
  --no-term-color        disable colorful terminal contents
```

{: .note }
The Application is currently under active development.

## Commands

### exp
Command `exp` exports the `.sim` configuration and corresponding
`.alg` algorithms to a selected language.
Currently, only export to C++ with Armadillo is supported.

### dbg
Debug the simulation.
This is different from [`sim`](#sim) in that the generated C++ code is compiled with `-g3` instead of `-O3`.
Therefore, debug information is retained.

### sim
Command `sim` simulates the exported code with the selected backend.
Currently, only C++ with Armadillo is supported.

So far, only C++ compiler `g++` (default) and `clang++` are supported
which can be configured with command [`cfg`](#cfg).
You may also need to configure additional C++ flags with `cfg cppflags`
if by default the compiler cannot find [`armadillo`](https://arma.sourceforge.net) library.

### cfg
Configure settings.

- Use `mmcesim cfg <name>` to show the value of `<name>`.
- Use `mmcesim cfg <name> --value=<value>` to set the value of `<name>` as `<value>`.

*Example* ([`mac_config_cppflags_tvj.sh`](https://github.com/mmcesim/mmcesim/blob/master/scripts/mac_config_cppflags_tvj.sh)):
```sh
mmcesim cfg cpp --value="clang++"
mmcesim cfg cppflags --value="-I/opt/local/include -L/opt/local/lib"
```


## Options

### `-v` (`--help`)
Print the version string of mmCEsim.

### `-h` (`--help`)
See [Help Yourself](#help-yourself).

### `--gui`
Open the GUI application.

### `-o` (`--output`)
Set the output file name. No extension name is required, and is added automatically according to your backend settings.
`.cpp` for C++, `.py` for Python, `.ipynb` for Jupyter, and `.m` for Matlab or GNU Octave.

### `-s` (`--style`)
Set C++ [Astyle](https://astyle.sourceforge.net/astyle.html) (code formatting) options.

### `-l` (`--lang`)
Set the export language or simulation backend.

### `--value`
The value for configuration options.

### `-f`
Enable the force writing mode.
This will overwrite existent output files.

### `-V` (`--verbose`)
Print additional information.

### `--no-error-complete`
Do not raise error if compiling fails.
This is useful in the [`dbg`](#dbg) and [`sim`](#sim) command.

### `--no-term-color`
Disable colorful terminal contents.

{: .tip }
> mmCEsim also supports the [`NO_COLOR`](https://no-color.org) standard.
> > Command-line software which adds ANSI color to its output by default should check for a `NO_COLOR` environment variable that,
> > when present and not an empty string (regardless of its value), prevents the addition of ANSI color.

When you have a non-empty `NO_COLOR` environmental variable,
the color output is disabled, and you no longer need the `--no-term-color` option.
