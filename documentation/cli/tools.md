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
Compose `.sim` configure from command line options.

{: .note }
This is still under development.

## Log
View or copy mmCEsim the log file with `mmcesim-log`.

| CLI Options | Description |
| :-: | :-: |
| `-v` | print version string |
| `-h` | produce help message |
| `-p` | print mmCEsim log on terminal |
| `-c` | copy mmCEsim log to clipboard |
| `-f` | show mmCEsim log file location |


Use `mmcesim-log -h` for more information.

## Maintain
You can view the latest stable version available with `mmcesim-maintain -l`.
This internally invokes `curl https://mmcesim.org/VERSION`, so you need to have `curl` installed.
