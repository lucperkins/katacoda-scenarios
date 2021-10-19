Now that our Vector Aggregator is processing data from a variety of different observability agents,
let's shift gears a bit and explore some tools that can be of great use when working with Vector,
especially in production environments: `vector tap`, `vector top`, and unit testing.

Vector is built to enable you to monitor your Vector instances easily. Two of the best interfaces
for that are `vector tap` and `vector top`, both of which are commands in the `vector` CLI. Both
commands use Vector's [GraphQL] API and can be run remotely, that is, they can "eavesdrop" on
Vector's internal activity. Both can provide powerful insight and debugging potential.

## Configuration

<pre class="file" data-filename="aggregator/vector/aggregator/vector.toml" data-target="insert" data-marker="#api-config-insert">[api]
enabled = true
address = "0.0.0.0:8686"
'''</pre>

Let's restart Vector

```
docker-compose restart 
```{{execute interrupt}}

## vector tap

[`vector tap`][tap] enables you to pipe logs from a Vector instance into your local environment. It
communicates with Vector's [GraphQL] API (which we previously enabled in our configuration)

In order to see `vector tap` in action, we first need to start up Vector using the same
configuration we ended up with in the first tutorial:

```
vector \
  --config-dir /etc/vector/monitoring-vector \
  --watch-config vector.toml
```{{execute interrupt}}

Run `vector tap`{{execute T2}} to open the gates to your internal log stream.

## vector top

[`vector top`][top], not to be confused with `vector tap` from above, enables you to view Vector's
internal metrics in real time. It's inspired by a systems monitoring tool called [htop].

Run `vector top`{{execute T3}} to take a look at Vector's internal metrics.

[graphql]: https://graphql.org
[htop]: https://htop.dev
[tap]: https://vector.dev/docs/reference/cli/#tap
[top]: https://vector.dev/docs/reference/cli/#top