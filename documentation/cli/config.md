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

***

Configuration file is in YAML format.
For more information about why YAML,
please refer to [this blog](https://blog.mmcesim.org/2022/07/file-format-yaml/).

***

## `version`
This field (`version`) takes a string value representing the targeted mmCEsim version.
For compatibility convenience, this string can be used by the compiler
to decide the behavior.
The current default value is the same as the compiler version (`0.3.0`).

***

## `meta`
The `meta` is a map that provides metadata which can be used in the report.
The used fields now include: `title`, `description`, `author`.

***

## `physics`
The `physics` map contains physical system settings.

### `frequency`
The bandwidth is specified in `frequency` filed.
which can have value `narrow` for narrowband or `wide` for wideband.

### `off_grid`
This is actually about the model.
With the geometric channel model with grid,
there can be off-grid (or power leakage) problems.
Recently, there are also super resolution formulations to solve the problem.
But we still adopt the grid representation for its popularity and simplicity.
By setting `off_grid` field inside `physics` to `false`,
the off grid effect is discarded, i.e. all angles fall on the grid.
The default value is `true`.

### `carriers`
For a wideband system,
you may specify the number of carriers used in OFDM.
Its corresponding [macro](../alg/macro) in [CALC](../alg/calc) is
`` `CARRIERS_NUM` ``.

***

## `nodes`
A sequence (array) of nodes in the channel network.
Transmitter (Tx), Receiver (Rx), Reconfigurable Intelligent Surface (RIS)
are all considered node (channels are the connecting edges to these nodes).
For each of its elements, you need to specify the following fields.

### `id`
You need to specify a unique `id` for each node.
They are used in [`channels`](#channels) so that we know the direction of channel.

### `role`
The `role` field has valid values `transmitter` (`Tx`), `receiver` (`Rx`),
and `RIS` (`IRS`).

### `num`
The field `num` can be used to replicate several copies of the same node.
This is often used for multi-user scenarios.
Currently, this value is discarded, and the number is always 1.

### `size`
The `size` means the antenna/element number for a node.
For transmitters and receivers, it is the antenna number.
For RIS, it is the number of reflecting elements.
The value is a scalar for uniform linear array (ULA),
and is a 2-value array (for example `[8, 4]`) for uniform planar array (UPA).
For a 2-value array that has the second value set to 1,
it is still regarded as a ULA.

Its corresponding [macro](../alg/macro)s in [CALC](../alg/calc) are
`` `SIZE[<id>]` ``, `` `SIZE[<id>].x` ``, `` `SIZE[<id>].y` ``,
`` `SIZE.T.x` ``, `` `SIZE.T.y` ``, `` `SIZE.T` ``,
`` `SIZE.R.x` ``, `` `SIZE.R.y` ``, `` `SIZE.R` ``, `` `SIZE.*` ``.

### `beam`
The number of beams.
Dimensions similar to [Size](#size).

Its corresponding [macro](../alg/macro)s in [CALC](../alg/calc) are
`` `BEAM[<id>]` ``, `` `BEAM[<id>].x` ``, `` `BEAM[<id>].y` ``,
`` `BEAM.T.x` ``, `` `BEAM.T.y` ``, `` `BEAM.T` ``,
`` `BEAM.R.x` ``, `` `BEAM.R.y` ``, `` `BEAM.R` ``, `` `BEAM.*` ``.

### `grid`
The number of grids.
Dimensions similar to [Size](#size).
This is used in [CALC](../alg/calc) function [`\dictionary`](../alg/calc#dictionary)
and [macro](../alg/macro) [`` `DICTIONARY.T` ``](../alg/macro#dictionaryt) and [`` `DICTIONARY.R` ``](../alg/macro#dictionaryr).

Its corresponding [macro](../alg/macro)s in [CALC](../alg/calc) are
`` `GRID[<id>]` ``, `` `GRID[<id>].x` ``, `` `GRID[<id>].y` ``,
`` `GRID.T.x` ``, `` `GRID.T.y` ``, `` `GRID.T` ``,
`` `GRID.R.x` ``, `` `GRID.R.y` ``, `` `GRID.R` ``, `` `GRID.*` ``.

### `beamforming`
In the `beamforming` field, the variable name `variable` is set,
and the beamforming scheme `scheme` is defined.
The `scheme` supports `random` and `custom`.
For a custom beamforming scheme, you also need to set the `formula` field with ALG language.

The random active beamforming scheme (for Tx and Rx) is defined in
[`/include/mmcesim/sys/random_RIS_BF.alg`](https://github.com/mmcesim/mmcesim/blob/master/include/mmcesim/sys/random_RIS_BF.alg)
as
```alg
`VAR` = \randn(SIZE, TIMES) # generate random
`VAR` = `VAR` / \abs(Psi)   # normalize
```

***

## `macro`
User-defined macros are defined here.
Please refer to [documentation of macro](../alg/macro#user-defined-macros) for more information.

***

## `channels`
The configuration `channels` is a sequence (array) of channel links.
The settings for each channel link is shown below.

### `id`
Similar to [ID](#id) in [Nodes](#nodes),
each channel link has a unique identifier as in field `id`.

### `from`
The node which the link channel is transmitted from.
(`from`)

### `to`
The node which the link channel transmits to.
(`to`)

### `sparsity`
The `sparsity` (number of clusters) of the channel.

### `gains`
The channel `gains` consisting of pass loss.
There are two types of gains supported (`mode`):
`normal` and `uniform`.
For `normal` gains, `mean` and `variance` need to be specified.
For `uniform` gains, `min` and `max` need to be set.

***

## `sounding`
Information related to the sounding procedure is defined here.

### `variables`
Channel `variables` names are defined here.
- `received`: received signal vector
- `noise`: received noise vector
- `channel`: the cascaded channel

***

## `preamble`
The `preamble` is code part before main simulation
(including sounding, estimation and report generation).

{: .tip }
Custom functions can be defined here.

This part is specified using the [ALG language](../alg).

***

## `estimation`
The main code for `estimation`.
Function [`ESTIMATE`](../alg/function#estimate) is used here
to call the compressed sensing (CS) algorithms
either defined in the [standard ALG library](../alg/library)
or in the [preamble](#preamble).

{: .important-title }
> Basic MIMO Example
> 
> For a basic MIMO example,
> the estimation part is about converting the mmWave channel estimation
> to a compressed sensing problem before using [`ESTIMATE`](../alg/function#estimate),
> and recover the channel from the sparse result with [`RECOVER`](../alg/function#recover).

This part is specified using the [ALG language](../alg).

***

## `conclusion`
In `conclusion`,
additional code after each [simulation job](#jobs)
is added here.

This part is specified using the [ALG language](../alg).

***

## `appendix`
The code in `appendix` is added after all jobs are done.

This part is specified using the [ALG language](../alg).

***

## `simulation`

### `backend`
The `backend` includes `cpp` (C++ with Armadillo library),
`python` (Python with NumPy library)
and `matlab` or `octave`.
This sets the language it exports to and the backend simulation bases on.

### `jobs`

### `report`

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
