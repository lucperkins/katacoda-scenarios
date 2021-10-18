It's important to familiarize ourselves with VRL because most non-trivial Vector use cases require
it.

Transforming observability data, also known as **remapping** data, is crucial in just about any
pipeline. And that transformation can come in many forms: adding tags, enriching with data from
external sources, removing unnecessary information, redacting sensitive info, and more.

In Vector, you'll primarily remap your logs and metrics using a DSL called **Vector Remap Language**
(VRL for short). VRL is a non-Turing-complete language that's built specifically for observability
use cases. It has a simple syntax reminiscent of [jq] and a broad [standard library][vrl_funcs] of
functions.

## Working with VRL in the REPL

First, let's experiment with VRL in its REPL. We can open that up using the Vector CLI's
[`vrl`][vrl_cmd] command with no arguments:

`vector vrl`{{execute interrupt}}

## VRL's core

### Paths and assignment

### Data types

VRL has a handful of core data types:

* Strings: `"hello \"world\""`{{copy}} or `s'{"hello":"world"}'`{{execute}}
* Integers: `0`, `404`, `1_000_000`
* Floats: `2.5`, `0.0001`
* Booleans: `true` and `false`
* Null: `null`
* Objects: `{"code": 200}` or `{"user":{"username":"dash-workshop-1337"}}`{{execute}}

### Functions

VRL has over 100 functions, which is more than we could hope to cover today. But we can see
representative functions from a few main categories:

* Parsing: `parse_json!(s'{"status":404}')`{{copy}}
* Encoding: `encode_json({"status": 404})`{{copy}}
* Timestamps: `format_timestamp!(now(), format: "%+")`

## Handling real events

Once we've gotten a taste of the language in the REPL, let's work with some real observability events:

```
vector vrl --input /etc/vector/vrl/events.jsonl
```{{execute interrupt}}

[jq]: https://stedolan.github.io/jq
[vrl_cmd]: https://vector.dev/docs/reference/cli/#vrl
[vrl_funcs]: https://vrl.dev/functions