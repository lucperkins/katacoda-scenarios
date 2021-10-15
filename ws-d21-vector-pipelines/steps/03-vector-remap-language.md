Transforming observability data, also known as **remapping** data, is crucial in just about any
pipeline. And that transformation can come in many forms: adding tags, enriching with data from
external sources, removing unnecessary information, redacting sensitive info, and more.

In Vector, you'll primarily remap your logs and metrics using a DSL called **Vector Remap Language**
(VRL for short). VRL is a non-Turing-complete language that's built specifically for observability
use cases. It has a simple syntax reminiscent of [jq] and a broad [standard library][vrl_funcs] of
functions.

## Working with VRL in the REPL

First, let's experiment in the VRL REPL, which opens up if you run the Vector CLI's `vrl` command
with no arguments:

`vector vrl`{{execute interrupt}}

## Handling real events

Once we've gotten a taste of the language in the REPL, let's work with some real observability events:

```
vector vrl --input /etc/vector/vrl/events.jsonl
```{{execute interrupt}}

[jq]: https://stedolan.github.io/jq
[vrl_funcs]: https://vrl.dev/functions