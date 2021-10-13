# Our first processing pipeline with Vector

Vector thinks about observability data in terms of **pipelines**. Pipelines take in data using
[sources], handle data using [transforms], and then send data off to [sinks].

Let's kick off the practical portion of this workshop by building our own very simple pipeline using
the [`generator`][generator] source, the [`remap`][remap] transform and [Vector Remap
Language][vrl], and the [`console`][console] sink.

Run `vector --config-dir /etc/vector/first-graph --watch-config vector.toml`{{execute}} to start up
Vector.

**Spoiler alert**: this will initially throw an error that we need to update our Vector
configuration to fix.

[console]: https://vector.dev/docs/reference/configuration/sinks/console
[generator]: https://vector.dev/docs/reference/configuration/sources/generator
[remap]: https://vector.dev/docs/reference/configuration/transforms/remap
[sinks]: https://vector.dev/docs/reference/configuration/sinks
[sources]: https://vector.dev/docs/reference/configuration/sources
[transforms]: https://vector.dev/docs/reference/configuration/transforms
[vrl]: https://vrl.dev