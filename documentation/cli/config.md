---
layout: default
title: Configuration
permalink: /doc/cli/config
parent: CLI Application
grand_parent: Documentation
nav_order: 2
has_children: false
---

# Configuration
{: .no_toc }

<details open markdown="block">
  <summary>
    Table of contents
  </summary>
  {: .text-delta }
- TOC
{:toc}
</details>

Configuration file is in YAML format.
For more information about why YAML,
please refer to [this blog](https://blog.mmcesim.org/2022/07/file-format-yaml/).

## Version
This field (`version`) takes a string value representing the targeted mmCEsim version.
For compatibility convenience, this string can be used by the compiler
to decide the behaviour.
The current default value is the same as the compiler version (`0.1.0`).

## Meta
The `meta` is a map that provides metadata which can be used in report.
The used fields now include: `title`, `description`, `author`.

## Physics
The `physics` map contains physical system settings.

### Frequency
The bandwidth is specified in `frequency` filed.
Currently, this field does not do anything,
which is always assumed to be `narrow` (narrow band) now.

### Off Grid
This is actually about the model.
With the geometric channel model with grid,
there can be off-grid (or power leakage) problems.
Recently, there are also super resolution formulations to solve the problem.
But we still adopt the grid representation for its popularity and simplicity.
By setting `off_grid` field inside `physics` to `false`,
you may not consider the off grid effect.
The default value is `true`.

## Simulation

### Report

#### Text Report

The simulation report can be exported as plain text report, for example
<script src="https://gist.github.com/Teddy-van-Jerry/0e181131baf2d60047b7ce6d24ee6422.js"></script>

#### LaTeX and PDF Report

LaTeX and its generated PDF report is also supported in addition to the
plain text `.rpt` report.

{: .hint-title }
> Example
> 
> [PDF Report Example](https://pub.mmcesim.org/mmCEsim_Example_Report.pdf)
> with [configuration example](https://pub.mmcesim.org/mmCEsim_Example_Config.pdf).
