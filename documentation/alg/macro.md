---
layout: default
title: Macro
permalink: /doc/alg/macro
parent: ALG Language
grand_parent: Documentation
nav_order: 4
has_children: false
---

# Macro in ALG Language

Coming soon
{: .label .label-yellow }

For simulation convenience,
there are macros defined above the level of ALG language.
That is, some configuration variables may be used in ALG.

There are two types of macros:
- **predefined macros**: They are defined by mmCEsim and can be used
  directly without declaring;
- **user defined macros**: They are placed in the `macros:` list,
  and should not have the same name as those in predefined macros.

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
| `` `NMSE` `` | NMSE Result Matrix | 123 |
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
| `` `VERSION` `` | mmCEsim Version | 123456 |

The supported scope is listed in
in the corresponding scope listed in the [Scope](#scope) section.

### Scope

In the table above, the scope of macro means where the macro can be used safely.

| Scope | Description |
| :-: | :-: |
| 1. Algorithm | Between `BRANCH` and `MERGE` in `estimation` |
| 2. Estimation | Other part of `estimation` |
| 3. Conclusion | `conclusion` part of configuration |
| 4. Appendix | `appendix` part of configuration |
| 5. Preamble | `preamble` part of configuration |
| 6. Others | Any other part where ALG language is used. |

### Additional Information


{: .note-title }
> Source
> 
> Macro replacing is defined in [`/src/export/macro.cpp`](https://github.com/mmcesim/mmcesim/blob/master/src/export/macro.cpp).

{: .tip }
It is advised not to use macros when you can get the value elsewhere easily
for example from the size of a matrix.
