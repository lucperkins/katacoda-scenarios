Let's kick off the practical portion of this workshop by building a simple pipeline that pipes
randomly generated logs into our console. Once we learn how to configure Vector we can move on to
some more advanced use cases.

Without any further ado, let's start up Vector:

```
vector \
  --config-dir /etc/vector/first-pipeline \
  --watch-config vector.toml
```{{execute}}

This command will initially throw an error telling us that we need to have a source and a sink
specified. No source and no sink means no pipeline. But don't fret! We'll fix that by updating our
Vector configuration.

First, let's hop over into our IDE and then add a [`generator`][generator] source:

<pre class="file" data-filename="first-pipeline/vector.toml" data-target="insert" data-marker="#insert-source">[sources.random_json_logs]
type = "generator" # Use Vector's internal generator
format = "json"    # Emit random JSON logs (other options: "syslog", "apache_common", etc.)
interval = 1       # Emit 1 log message per second
</pre>

Then we can add a [`remap`][remap] transform for handling those generated log messages:

<pre class="file" data-filename="first-pipeline/vector.toml" data-target="insert" data-marker="#insert-transform">[transforms.handle]
type = "remap"                # This transform lets us use Vector Remap Language
inputs = ["random_json_logs"] # Tells our transform where to listen for input

# Our first VRL program
source = '''
.
'''</pre>

And finally we can add a [`console`][console] sink that outputs the results of the `random_json_logs`
source piped through the `handle` source:

<pre class="file" data-filename="first-pipeline/vector.toml" data-target="insert" data-marker="#insert-sink">[sinks.cli_out]
type = "console"              # Send output to our console
inputs = ["handle"]           # Listen for events on the `handle` component
target = "stdout"             # Versus stderr
encoding = { codec = "json" } # Output to the console as JSON</pre>

Now let's go back to our terminal to see the log output.

## Log schema

As we can see from the log output, the default log schema in Vector looks like this:

```json
{
  "message": "<string>",
  "timestamp": "<rfc3339 timestamp>"
}
```

The `message` field in our messages is a JSON-encoded string, which we can't really *do* much with.
Let's use VRL's [`parse_json`][parse_json] function to convert that into an object and make some
modifications to our object.

**Success**! We just built a Vector pipeline. Along the way, we got a small taste of [Vector Remap
Language][vrl] (VRL). We'll dive more deeply into VRL in the next section.

[console]: https://vector.dev/docs/reference/configuration/sinks/console
[generator]: https://vector.dev/docs/reference/configuration/sources/generator
[parse_json]: https://vrl.dev/functions/#parse_json
[remap]: https://vector.dev/docs/reference/configuration/transforms/remap
[sinks]: https://vector.dev/docs/reference/configuration/sinks
[sources]: https://vector.dev/docs/reference/configuration/sources
[transforms]: https://vector.dev/docs/reference/configuration/transforms
[vrl]: https://vrl.dev