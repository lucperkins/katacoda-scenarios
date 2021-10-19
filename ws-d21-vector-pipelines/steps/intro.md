Now that we've learned a bit about [Vector] and observability data pipelines in the intro, we can
kick off the hands-on portion of the workshop.

Our workshop environment has two core elements:

* A Linux terminal environment where we'll work with a pre-installed Vector executable (and later
  with some other tools)
* An in-browser version of [Visual Studio Code][vscode] where we'll view and edit configuration and
  other files.

First, let's explore our terminal by making sure that Vector is installed in our environment:

```
vector --version
```{{execute}}

If you *don't* see version information pop up, please do notify a TA in the chat and they'll help
you out ASAP.

**Exercise**: Run `vector --help` to familiarize yourself with Vector's CLI.

[vector]: https://vector.dev
[vscode]: https://code.visualstudio.com