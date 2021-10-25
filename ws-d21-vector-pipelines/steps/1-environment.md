Our workshop environment has two core elements:

- The `Terminal` window is a Linux terminal environment where we'll work with a
  pre-installed Vector executable and some other tools
- The `IDE` window is an in-browser version of [Visual Studio Code][vscode]
  where we'll view and edit configuration and other files.

First, let's explore our terminal by making sure that Vector is installed in our
environment:

```
vector --version
```{{execute}}

If you *don't* see version information pop up, please do notify a TA in the chat
and they'll help you out ASAP.

## Core goals of this workshop

* Learn the basics of [Vector Remap Language][vrl] (VRL), Vector's built-in DSL
  for observability data
* How to build configure observability pipelines with Vector
* How to monitor Vector itself using a variety of tools
* How to unit test Vector transforms to ensure that they behave as we'd expect
  inside of our pipelines

[vector]: https://vector.dev
[vrl]: https://vrl.dev
[vscode]: https://code.visualstudio.com
