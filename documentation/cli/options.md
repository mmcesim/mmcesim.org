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

With `mmcesim -h`, you can view all supported commands and options.
```
mmCEsim 0.2.1  (C) 2022-2023 Wuqiong Zhao
Millimeter Wave Channel Estimation Simulation
=============================================

Usage: ./mmcesim <command> <input> [options]

Commands:
  sim [ simulate ]       run simulation
  dbg [ debug ]          debug simulation settings
  exp [ export ]         export code
  config                 configure mmCEsim options
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

## exp
Command `exp` exports the `.sim` configuration and corresponding
`.alg` algorithms to a selected language.
Currently, only export to C++ with Armadillo is supported.

## sim
Command `sim` simulates the exported code with the selected backend.
Currently, only C++ with Armadillo is supported.

So far, only C++ compiler `g++` (default) and `clang++` are supported
which can be configured with option [`config`](#config).
You may also need to configure additional C++ flags with `config cppflags`
if by default the compiler cannot find [`armadillo`](https://arma.sourceforge.net) library.

## config
Configure settings.
