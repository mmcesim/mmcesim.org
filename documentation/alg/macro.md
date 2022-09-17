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
Macro starts and end with the character backtick(`` ` ``),
for example `` `PILOT` ``.

## Predefined Macros

| Macro | Descriptions |
| :-: | :-: |
| `` `PILOT` `` | Pilot Overhead Number |
| `` `MEASUREMENT` `` | Number of Measurements |
| `` `SNR_dB` `` | Signal-to-Noise Ratio (SNR) in dB |
| `` `SNR_LINEAR` `` | Signal-to-Noise Ratio (SNR) |

{: .note }
It is advised not to use macros when you can get the value elsewhere
for example from the size of a matrix.
