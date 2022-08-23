---
layout: default
title: Web Application
permalink: /doc/web
nav_order: 3
parent: Documentation
has_children: false
---

# Web Application

mmCEsim Web app allows auto code generation with mouse clicks on the browser
without downloading the whole mmCEsim app.
Web app is available at [app.mmcesim.org](https://app.mmcesim.org).
You may easily host the web app as it is built on docker.

{: .note }
The web app is currently under development.

## Pros and Cons

### Pros
- No need to download the app which can be large is you want a GUI
  or TeX Engine or a C++ compiler.
- Very portable, accessible everywhere with Internet connection.

### Cons
- The safety of your design and the generated code is not guaranteed
  due to my limited web knowledge.
  So for original contents that are highly confidential,
  you may consider using the desktop app or host the docker yourself.
- Due to resource limits, the functions are limited to code generation.
  So far you cannot use the web app to simulate automatically.

## Docker Image
The web app is written using basic JavaScript (with jQuery) together with Node (with Express)
calling the CLI app backend.
It has been packaged into a Docker container,
available on [GitHub Packages](https://github.com/mmcesim/mmcesim-web/pkgs/container/mmcesim-web)
and [Docker Hub](https://hub.docker.com/r/mmcesim/mmcesim-web).

To use the GitHub package, you can use the command
```sh
docker pull ghcr.io/mmcesim/mmcesim-web:latest
```

To use the image from Docker Hub, you can use the command
```sh
docker pull mmcesim/mmcesim-web
```

## License
Like [mmCEsim](https://github.com/mmcesim/mmcesim), the web app is also
licensed under the [MIT License](https://github.com/mmcesim/mmcesim-web/blob/master/LICENSE).
