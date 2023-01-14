---
layout: default
title: Download
permalink: /download
nav_order: 4
has_children: false
---

# Download mmCEsim

## GitHub Releases

You van download mmCEsim at [GitHub Releases](https://github.com/mmcesim/mmcesim/releases).

Please [**STAR** the project on GitHub](https://github.com/mmcesim/mmcesim) (and maybe WATCH and FORK) to keep updated of
the application design.

## Build from Source
Requirements are listed below:

| Components | Version | Remarks |
| :-: | :-: | :-: |
| C++ | Standard 17 or higher | `std::filesystem` should be supported. |
| CMake | 3.8 or higher | |
| Boost Library | 1.70 or higher | Only for CLI app. | 
| Qt | 6.0 or higher | Only for GUI app. |


Compile with `cmake` as normal.
Add option `-DMMCESIM_BUILD_GUI` to `cmake` if you want to compile the GUI app as well.
