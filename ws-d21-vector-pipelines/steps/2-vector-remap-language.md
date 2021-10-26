Transforming observability data, also known as **remapping** data, is an important part of most
complex pipelines. That transformation can come in many forms: adding tags, enriching with data from
external sources, removing unnecessary information, redacting sensitive info, and more.

In Vector, you'll primarily remap your logs and metrics using a DSL called **Vector Remap Language**
(VRL for short). VRL is a stripped-down, "just enough" language that's built specifically for
observability use cases. It has a simple syntax reminiscent of [jq] and a broad [standard
library][vrl_funcs] of functions.

> Why a DSL? Originally, Vector enabled you to remap data using configuration. But that proved to
> be quite unwieldy for all but the most trivial use cases.

Here's what VRL looks like inside a Vector configuration:

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

## Not just remapping

VRL can also be used for supplying **conditions** for things like routing and filtering. Here's an
example:

```toml
[transforms.remove_info_logs]
type = "filter"
inputs = ["my_logs"]
condition = '''
.level != "debug"
'''
```

We'll go over this in more depth in an upcoming scenario.

[jq]: https://stedolan.github.io/jq
[vrl_funcs]: https://vrl.dev/functions