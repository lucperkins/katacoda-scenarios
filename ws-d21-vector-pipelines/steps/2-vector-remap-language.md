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

```toml
[transforms.modify_data]
type = "remap"
inputs = ["my_logs"]
source = '''
. = parse_key_value!(.message)

.tags.environment = "staging"
'''
```

Alternatively, you can write VRL in separate files:

```toml
[transforms.modify_data]
type = "remap"
inputs = ["my_logs"]
file = "/etc/vector/vrl/modify.vrl"
```

[jq]: https://stedolan.github.io/jq
[vrl_cmd]: https://vector.dev/docs/reference/cli/#vrl
[vrl_funcs]: https://vrl.dev/functions