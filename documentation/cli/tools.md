---
layout: default
title: Tools
permalink: /doc/cli/tools
parent: CLI Application
grand_parent: Documentation
nav_order: 4
has_children: false
---

# Tools

Three tools ([`compose`](#compose), [`log`](#log), [`maintain`](#maintain))
are available to aid the CLI use of mmCEsim.

## Compose
Compose `.sim` configuration file from command line options.

{: .note }
This is still under development.

## Log
View or copy mmCEsim log file with `mmcesim-log`.

| CLI Options | Description |
| :-: | :-: |
| `-v` | print version string |
| `-h` | produce help message |
| `-p` | print mmCEsim log on terminal |
| `-c` | copy mmCEsim log to clipboard |
| `-f` | show mmCEsim log file location |

If no option is provided, it will use the `-p` option to print the log.
You can use several options together, such as `-cp` to print and copy.

{: .tip }
You can use `grep` to filter the log, for example use
```sh
mmcesim-log | grep "\[ERROR\]"
```
to get all error messages.

Use `mmcesim-log -h` for more information.

## Maintain
You can view the latest stable version available with `mmcesim-maintain -l`.
This internally invokes `curl https://mmcesim.org/VERSION`, so you need to have `curl` installed.
