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
