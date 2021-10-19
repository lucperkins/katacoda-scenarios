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

This command will initially throw an error. Vector can't really operate without a source and a sink.
But don't fret! We'll fix that by updating our Vector configuration.

First, let's add a `generator` source:

<pre class="file" data-filename="first-pipeline/vector.toml" data-target="insert" data-marker="#source-insert">[sources.random_json_logs]
type = "generator" # Use Vector's internal generator
format = "json"    # Emit random JSON logs (other options: "syslog", "apache_common", etc.)
interval = 1       # Emit 1 log message per second
</pre>

Then we can add a [`remap`][remap] transform for handling those generated log messages:

<pre class="file" data-filename="first-pipeline/vector.toml" data-target="insert" data-marker="#transform-insert">[transforms.handle]
type = "remap"                # This transform lets us use Vector Remap Language
inputs = ["random_json_logs"] # Tells our transform where to listen for input
source = '''
.
'''
</pre>

And finally we can add a [`console`][console] sink that outputs the results of the `random_json_logs`
source piped through the `handle` source:

<pre class="file" data-filename="first-pipeline/vector.toml" data-target="insert" data-marker="#sink-insert">[sinks.cli_out]
type = "console"              # Send output to our console
inputs = ["handle"]           # Listen for events on the `handle` component
target = "stdout"             # Versus stderr
encoding = { codec = "json" } # Output to the console as JSON
</pre>

Now let's go back to our terminal to see the log output.

**Success**! We just built a Vector pipeline. The log messages are currently

[console]: https://vector.dev/docs/reference/configuration/sinks/console
[generator]: https://vector.dev/docs/reference/configuration/sources/generator
[kafka]: https://kafka.apache.org
[remap]: https://vector.dev/docs/reference/configuration/transforms/remap
[sinks]: https://vector.dev/docs/reference/configuration/sinks
[sources]: https://vector.dev/docs/reference/configuration/sources
[transforms]: https://vector.dev/docs/reference/configuration/transforms
[vrl]: https://vrl.dev