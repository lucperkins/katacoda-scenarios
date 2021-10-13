Vector thinks about observability data in terms of **pipelines**. Pipelines involve three different
types of **components**. [Sources] take in data, [transforms] handle that data (modify it, filter
it, route it, and more), and [sinks] send that data off somewhere else, such as to a database like
Clickhouse, a cloud storage system like AWS S3, a [Kafka] topic, a file in the filesystem, a
service like Datadog, etc.

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

This command will initially throw an error. But don't fret! We'll fix that by updating our Vector
configuration.

[console]: https://vector.dev/docs/reference/configuration/sinks/console
[generator]: https://vector.dev/docs/reference/configuration/sources/generator
[kafka]: https://kafka.apache.org
[remap]: https://vector.dev/docs/reference/configuration/transforms/remap
[sinks]: https://vector.dev/docs/reference/configuration/sinks
[sources]: https://vector.dev/docs/reference/configuration/sources
[transforms]: https://vector.dev/docs/reference/configuration/transforms
[vrl]: https://vrl.dev