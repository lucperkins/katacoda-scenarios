Vector thinks about observability data in terms of **pipelines**. Pipelines take in data using
[sources], handle data using [transforms], and then send data off to [sinks].

Let's kick off the practical portion of this workshop by building our own very simple pipeline using
the [`generator`][generator] source, the [`remap`][remap] transform and [Vector Remap
Language][vrl], and the [`console`][console] sink.

First, let's make sure Vector is installed in our environment:

```
vector --version
```{{execute}}

Without any further ado, let's start up Vector:

```
vector \
  --config-dir /etc/vector/first-pipeline \
  --watch-config vector.toml
```{{execute}}

**Spoiler alert**: this will initially throw an error that we need to update our Vector
configuration to fix.

[console]: https://vector.dev/docs/reference/configuration/sinks/console
[generator]: https://vector.dev/docs/reference/configuration/sources/generator
[remap]: https://vector.dev/docs/reference/configuration/transforms/remap
[sinks]: https://vector.dev/docs/reference/configuration/sinks
[sources]: https://vector.dev/docs/reference/configuration/sources
[transforms]: https://vector.dev/docs/reference/configuration/transforms
[vrl]: https://vrl.dev