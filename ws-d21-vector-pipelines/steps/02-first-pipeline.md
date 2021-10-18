Now let's create and run a simple Vector pipeline with these components:

* A [`generator`][generator] source that generates

> The goal of this very basic pipeline is to 


Let's kick off the practical portion of this workshop by building our own very simple pipeline using
the [`generator`][generator] source, the [`remap`][remap] transform and [Vector Remap
Language][vrl], and the [`console`][console] sink.

First, let's make sure Vector is installed in our environment:

```
vector --version
```{{execute}}

You *should* see some version information pop up. If not, please do notify me in the chat and a TA
will assist you ASAP.

Without any further ado, let's start up Vector:

```
vector \
  --config-dir /etc/vector/first-pipeline \
  --watch-config vector.toml
```{{execute}}

This command will initially throw an error. But don't fret! We'll fix that by updating our Vector
configuration.

First, let's add a `generator` source:

<pre class="file" data-filename="first-pipeline/vector.toml" data-target="insert" data-marker="#generator-insert">[sources.random_json_logs]
type = "generator"
format = "json"
interval = 1
</pre>

[console]: https://vector.dev/docs/reference/configuration/sinks/console
[generator]: https://vector.dev/docs/reference/configuration/sources/generator
[kafka]: https://kafka.apache.org
[remap]: https://vector.dev/docs/reference/configuration/transforms/remap
[sinks]: https://vector.dev/docs/reference/configuration/sinks
[sources]: https://vector.dev/docs/reference/configuration/sources
[transforms]: https://vector.dev/docs/reference/configuration/transforms
[vrl]: https://vrl.dev