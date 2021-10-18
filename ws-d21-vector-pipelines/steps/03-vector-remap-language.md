It's important to familiarize ourselves with VRL because most non-trivial Vector use cases require
it.

Transforming observability data, also known as **remapping** data, is crucial in just about any
pipeline. And that transformation can come in many forms: adding tags, enriching with data from
external sources, removing unnecessary information, redacting sensitive info, and more.

In Vector, you'll primarily remap your logs and metrics using a DSL called **Vector Remap Language**
(VRL for short). VRL is a non-Turing-complete language that's built specifically for observability
use cases. It has a simple syntax reminiscent of [jq] and a broad [standard library][vrl_funcs] of
functions.

Here's what VRL looks like in a Vector configuration:

## Working with VRL in the REPL

First, let's experiment with VRL in its REPL. We can open that up using the Vector CLI's
[`vrl`][vrl_cmd] command with no arguments:

`vector vrl`{{execute interrupt}}

Some helpers while we're in the REPL:

* `help`{{execute}} for a help menu
* `help functions`{{execute}} to list available VRL functions
* `help docs <func>` to see info about a function, e.g. `help docs del`{{execute}}
* `next`{{execute}} and `prev`{{execute}} to navigate between events

## VRL programs




## The core of VRL

### Paths and assignment

In VRL, the dot (`.`) represents

### Data types

VRL has a handful of core data types:

* Strings: `"hello \"world\""`{{execute}} or `s'{"hello":"world"}'`{{execute}}
* Integers: `0`{{execute}}, `404`{{execute}}, `1_000_000`{{execute}}
* Floats: `2.5`{{execute}}, `0.0001`{{execute}}
* Booleans: `true`{{execute}} and `false`{{execute}}
* Null: `null`
* Objects: `{"code": 200}`{{execute}}, `{"user":{"username":"dash-workshop-1337"}}`{{execute}} (nested)
* Arrays: `[1, 2, 3]`{{execute}}, `[1, true, {}, [3, 2, 1]]`{{execute}}

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