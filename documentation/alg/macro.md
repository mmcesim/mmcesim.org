---
layout: default
title: Macro
permalink: /doc/alg/macro
parent: ALG Language
grand_parent: Documentation
nav_order: 4
has_children: false
mathjax: true
---

# Macro in ALG Language
{: .no_toc }

<details open markdown="block">
  <summary>
    Table of contents
  </summary>
  {: .text-delta }
- TOC
{:toc}
</details>

For simulation convenience,
there are macros defined above the level of ALG language.
That is, some configuration variables may be used in ALG.

There are two types of macros:
- **predefined macros**: They are defined by mmCEsim and can be used
  directly without declaring;
- **user defined macros**: They are placed in the `macros:` list,
  and should not have the same name as those in predefined macros.
  They may appear in the top level of `.sim` file,
  or under each job algorithm.

## Macro Usage
Macro is wrapped within the character backtick(`` ` ``),
for example `` `PILOT` ``.

## Predefined Macros

| Macro | Descriptions | Scope |
| :-: | :-: | :-: |
| `` `ALG_NAME` `` | Algorithm Name | 1 |
| `` `ALG_PARAMS` `` | Algorithm Parameters | 1 |
| `` `ALG_NUM` `` | Number of Algorithms in One Job | 12 |
| `` `BEAM.R.x` `` | Receiver Beam in $$x$$ Dimension | 12345 |
| `` `BEAM.R.y` `` | Receiver Beam in $$y$$ Dimension | 12345 |
| `` `BEAM.R` `` | Receiver Beam (Antenna Number) | 12345 |
| `` `BEAM.T.x` `` | Transmitter Beam in $$x$$ Dimension | 12345 |
| `` `BEAM.T.y` `` | Transmitter Beam in $$y$$ Dimension | 12345 |
| `` `BEAM.T` `` | Transmitter Beam (Antenna Number) | 12345 |
| `` `BEAM.*` `` | Multiplication of Tx and Rx Beam  | 12345 |
| [`` `BF[<id>]` ``](#bfid) | Beamforming Matrix of Node `<id>` | 12345 |
| `` `CARRIERS_NUM` `` | Number of OFDM Carriers | 1234 |
| `` `CAS_CH` `` | Cascaded Channel | 12345 |
| [`` `DICTIONARY.R` ``](#dictionaryr) | Receiver Dictionary Matrix | 12345 |
| [`` `DICTIONARY.T` ``](#dictionaryt) | Transmitter Dictionary Matrix | 12345 |
| `` `GRID.R.x` `` | Receiver Grid in $$x$$ Dimension | 12345 |
| `` `GRID.R.y` `` | Receiver Grid in $$y$$ Dimension | 12345 |
| `` `GRID.R` `` | Receiver Grid (Antenna Number) | 12345 |
| `` `GRID.T.x` `` | Transmitter Grid in $$x$$ Dimension | 12345 |
| `` `GRID.T.y` `` | Transmitter Grid in $$y$$ Dimension | 12345 |
| `` `GRID.T` `` | Transmitter Grid (Antenna Number) | 12345 |
| `` `GRID.*` `` | Multiplication of Tx and Rx Grid  | 12345 |
| `` `JOB_NUM` `` | Number of Estimation Jobs | 1234 |
| `` `JOB_CNT` `` | The Current Job Count (From 0) | 123 |
| `` `MEASUREMENT` `` | Number of Measurements | 12 |
| [`` `NMSE` ``](#nmse) | NMSE Result Matrix | 123 |
| `` `PILOT` `` | Pilot Overhead Number | 12 |
| `` `SIZE.R.x` `` | Receiver Size in $$x$$ Dimension | 12345 |
| `` `SIZE.R.y` `` | Receiver Size in $$y$$ Dimension | 12345 |
| `` `SIZE.R` `` | Receiver Size (Antenna Number) | 12345 |
| `` `SIZE.T.x` `` | Transmitter Size in $$x$$ Dimension | 12345 |
| `` `SIZE.T.y` `` | Transmitter Size in $$y$$ Dimension | 12345 |
| `` `SIZE.T` `` | Transmitter Size (Antenna Number) | 12345 |
| `` `SIZE.*` `` | Multiplication of Tx and Rx Size | 12345 |
| `` `SNR_dB` `` | Signal-to-Noise Ratio (SNR) in dB | 12 |
| `` `SNR_LINEAR` `` | Signal-to-Noise Ratio (SNR) | 12 |
| `` `VAR` `` | Variable Name in Beamforming Design | [*temp*](#temporary-macro) |
| `` `VERSION` `` | mmCEsim Version | 123456 |

The supported scope is listed in
in the corresponding scope listed in the [Scope](#scope) section.

### Scope

In the table above, the scope of macro means where the macro can be used safely.
Those marked as *temp* are [temporary macros](#temporary-macro).

| Scope | Description |
| :-: | :-: |
| 1. Algorithm | Between [`BRANCH`](function#branch) and [`MERGE`](function#merge) in `estimation` |
| 2. Estimation | Other part of `estimation` |
| 3. Conclusion | `conclusion` part of configuration |
| 4. Appendix | `appendix` part of configuration |
| 5. Preamble | `preamble` part of configuration |
| 6. Others | Any other part where ALG language is used. |

### Temporary Macro
Temporary macros are also valid in a small scope that can not be listed in 1-6 scopes.
For example, the macro [`` `VAR` ``](#var) is only valid for beamforming design custom scheme.

### `` `BF[<id>]` ``
Get the `beamforming` matrix/cube `variable` name.
For RIS, it is the reflection matrix.
For Tx and Rx, it is the beamforming cube.

### `` `DICTIONARY.R` ``
Receiver dictionary matrix.
Return a `c2c` (const complex matrix).
This macro actually expands to CALC function [`\dictionary`](calc#dictionary).

### `` `DICTIONARY.T` ``
Transmitter dictionary matrix.
Return a `c2c` (const complex matrix).
This macro actually expands to CALC function [`\dictionary`](calc#dictionary).

### `` `NMSE` ``
Normalized mean square error result is stored as a matrix
with dimension of {Test Number of SNR/Pilot} $$\times$$ {Algorithm Number}.

### `` `VAR` ``
This macro returns the `variable` field of `beamforming` of a channel node.
This is only valid in `nodes/<>/beamforming/formula` for the `custom` scheme.

### Additional Information

{: .note-title }
> Source
> 
> Macro replacing is defined in [`/src/export/macro.cpp`](https://github.com/mmcesim/mmcesim/blob/master/src/export/macro.cpp).

{: .tip }
It is advised not to use macros when you can get the value elsewhere easily
for example from the size of a matrix.

## User Defined Macros
### Top-Level Macros
Top-level macros defined in the top-level [`macro`](../cli/config#macro) field.
They are specified as a sequence (array).
For each macro, you need to define
- `name`: The name for the macro without the wrapping `` ` ``;
- `value`: The value for the macro;
- `in_alg`: (Optional) Whether the macro is used in job algorithms. Default as `false`.

{: .tip-title }
> Example
> 
> You may define the macro `` `SPARSITY_EST` `` of value `6`
> which is used inside job algorithms with the following code:
> ```yml
> macro:
>   - name: SPARSITY_EST
>     value: 6
>     in_alg: true
> ```

If `in_alg` is set to `true`,
the macro can only be used in scope 1 and 2.
But this allows the macro able to be overwritten by [algorithm macros](#algorithm-macros).

### Algorithm Macros
Algorithm macros are defined similar to [top-level macros](#top-level-macros),
except for algorithm macros are defined inside the job algorithm,
on the same level as `alg` and `label`.
This will overwrite top-level macros which has `in_alg` as `true`.
