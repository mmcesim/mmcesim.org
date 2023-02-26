---
layout: default
title: Contributing
permalink: /contribute
nav_order: 5
has_children: false
---

# Contributing to mmCEsim

Contributing to mmCEsim is welcome!
You may check out the [project](https://github.com/orgs/mmcesim/projects/1)
for remaining issues.
You may pick up one and comment below the issue if you want to work on that.

***

## C++ Code Style
The C++ code style is based on LLVM,
with additional configuration listed in [`.clang-format`](https://github.com/mmcesim/mmcesim/blob/master/.clang-format).
Please run
```
.misc/format
```
to format the code before committing.
Appropriate permission is needed.
On a Unix (Linux and macOS) system, you may use `chmod +x ./misc/format`.

***

## All Repositories

### CLI Application
[![mmcesim/mmcesim - GitHub](https://gh-card.dev/repos/mmcesim/mmcesim.svg)](https://github.com/mmcesim/mmcesim)

The project is configured with CMake, and the role of each folder is listed below.
- `include`: C++ Header Files (`.h`)
  - `export`: Header Files Concerning ALG Export
  - `mmcesim`: Files Needed by mmCEsim Binary
    - `copy`: Contents Directly Copied to Form Generated C++/Python/Matlab Code
    - `tex`: LaTeX Files for Report Generation
- `src`: C++ Source Files (`.cpp`)
  - `export`: Class Implementations Corresponding to Those in `include/export`
- `ext`: 3rd Party Resources
  - `astyle`: Format Generated C++ Code
  - `fmt`: C++ String Format (Like That in C++20)
  - `yaml-cpp`: Parse YAML Configuration (`.sim`)
- `test`: Test Files Including `CTest` Configuration
- `doc`: Documentation (*Currently Empty*)
- `bin`: Generated Binary Executable
- `misc`: Miscellaneous Files

{: .tip }
For more information, please refer to the project [CONTRIBUTING](https://github.com/mmcesim/mmcesim/tree/master/CONTRIBUTING.md) and [Wiki](https://github.com/mmcesim/mmcesim/wiki). The [Doxygen documentation](https://dev.mmcesim.org) for C++ is also available.

### GUI Application
[![mmcesim/mmcesim-gui - GitHub](https://gh-card.dev/repos/mmcesim/mmcesim-gui.svg)](https://github.com/mmcesim/mmcesim-gui)

### Web Application
[![mmcesim/mmcesim-web - GitHub](https://gh-card.dev/repos/mmcesim/mmcesim-web.svg)](https://github.com/mmcesim/mmcesim-web)

### VS Code Extension
[![mmcesim/mmcesim-vscode - GitHub](https://gh-card.dev/repos/mmcesim/mmcesim-vscode.svg)](https://github.com/mmcesim/mmcesim-vscode)

### Documentation Website
[![mmcesim/mmcesim.github.io - GitHub](https://gh-card.dev/repos/mmcesim/mmcesim.github.io.svg)](https://github.com/mmcesim/mmcesim.github.io)

***

## Other Ways You can Contribute to mmCEsim
### Open Issues
You may freely [open an issue](https://github.com/mmcesim/mmcesim/issues) for bug reports.

### Join Discussions
You can also [join discussions](https://github.com/mmcesim/mmcesim/discussions)
if you have questions about the use of mmCEsim
or about the task-oriented mmWave channel estimation techniques.

### Cite Our Works
Please cite our work if you use mmCEsim in your research and/or software.
Citations are useful for the continued development and maintenance of this project.

You may view [Citation](cite) for more information.

## Contributors
<ul class="list-style-none">
{% for contributor in site.github.contributors %}
  <li class="d-inline-block mr-1">
     <a href="{{ contributor.html_url }}"><img src="{{ contributor.avatar_url }}" width="32" height="32" alt="{{ contributor.login }}"></a>
  </li>
{% endfor %}
</ul>
