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
misc/format
```
to format the code before committing.
Appropriate permission is needed.
On a Unix (Linux and macOS) system, you may use `chmod +x misc/format`.

***

## All Repositories

### CLI Application
[![mmcesim/mmcesim - GitHub](https://github-readme-stats.vercel.app/api/pin/?username=mmcesim&repo=mmcesim)](https://github.com/mmcesim/mmcesim)

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
- `tools`: Accompanying Tools (`log`, `compose` and `maintain`)
- `doc`: PDF Documentation (Written in LaTeX)
- `bin`: Generated Binary Executable
- `misc`: Miscellaneous Files

{: .tip }
For more information, please refer to the project [CONTRIBUTING](https://github.com/mmcesim/mmcesim/tree/master/CONTRIBUTING.md) and [Wiki](https://github.com/mmcesim/mmcesim/wiki). The [Doxygen documentation](https://dev.mmcesim.org) for C++ is also available.

### GUI Application
[![mmcesim/mmcesim-gui - GitHub](https://github-readme-stats.vercel.app/api/pin/?username=mmcesim&repo=mmcesim-gui)](https://github.com/mmcesim/mmcesim-gui)

### Web Application
[![mmcesim/mmcesim-web - GitHub](https://github-readme-stats.vercel.app/api/pin/?username=mmcesim&repo=mmcesim-web)](https://github.com/mmcesim/mmcesim-web)

### VS Code Extension
[![mmcesim/mmcesim-vscode - GitHub](https://github-readme-stats.vercel.app/api/pin/?username=mmcesim&repo=mmcesim-vscode)](https://github.com/mmcesim/mmcesim-vscode)

### Documentation Website
[![mmcesim/mmcesim.org - GitHub](https://github-readme-stats.vercel.app/api/pin/?username=mmcesim&repo=mmcesim.org)](https://github.com/mmcesim/mmcesim.org)

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
<!-- {% for contributor in site.github.contributors %}
  <li class="d-inline-block mr-1">
     <a href="{{ contributor.html_url }}"><img src="{{ contributor.avatar_url }}" width="32" height="32" alt="{{ contributor.login }}"></a>
  </li>
{% endfor %} -->
  <li class="d-inline-block mr-1">
    <a href="https://github.com/Teddy-van-Jerry"><img src="https://avatars.githubusercontent.com/u/70827985" width="32" height="32" alt="Teddy-van-Jerry"></a>
  </li>
  <li class="d-inline-block mr-1">
    <a href="https://github.com/apps/dependabot"><img src="https://avatars.githubusercontent.com/in/29110" width="32" height="32" alt="dependabot[bot]"></a>
  </li>
  <li class="d-inline-block mr-1">
    <a href="https://github.com/mmcesim-bot"><img src="https://avatars.githubusercontent.com/u/121534715" width="32" height="32" alt="mmcesim-bot"></a>
  </li>
</ul>
