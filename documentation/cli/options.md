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
mmCEsim 0.1.0    (C) Wuqiong Zhao
Millimeter Wave Channel Estimation Simulation
=============================================

Usage: ./mmcesim <command> <input> [options]

Commands:
  sim [simulate]         run simulation
  dbg [debug]            debug simulation settings
  exp [export]           export code
  fmt [format]           format .sim configuration file
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
  -f [ --force ]         force writing mode
```

{: .note }
The Application is currently under active development.
