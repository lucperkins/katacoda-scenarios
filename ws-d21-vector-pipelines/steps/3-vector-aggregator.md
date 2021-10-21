Now that we've learned some basics of working with Vector, it's time to work with a Vector Aggregator. In
this scenario, we'll have multiple observability agents that send data to our Aggregator:

* Vector Agents collecting HTTP server logs
* [Datadog Agents][datadog] collecting HTTP server logs
* [Fluent Bit][fluent] agents collecting logs

These agents will all be sending logs. Our Aggregator will also be handling metrics emitted by
[Prometheus][prometheus] [Node Exporters][node_exporter].

If you open up the `/etc/vector/aggregator/vector/aggregator/vector.toml`{{open}} file, you'll see
an empty configuration file for our Aggregator.

## Sources

With our agents already configured to send data to our Aggregator, we need to configure the
Aggregator to use those agents as sources. We can start with our Vector Agent:

<pre class="file" data-filename="first-pipeline/vector.toml" data-target="insert" data-marker="#insert-vector-agents">[sources.vector_agents]
type = "vector"
address = "0.0.0.0:9000"
version = "2"
'''</pre>

Let's start up this scenario right now:

```
docker-compose \
--file /etc/vector/topologies/docker-compose.yml \
up \
--detach
```{{execute interrupt}}

And then let's navigate to `/etc/vector/topologies/docker-compose.yml`{{open}} in our editor to get a sense of the
structure of this Agent/Aggregator topology.

## Monitoring Aggregators

Aggregators are just plain Vector instances used in a certain way (this is the heart of the "role" concept). That means
that we can observe Aggregators using `vector tap`{{execute T2}} and `vector top`{{execute T3}}, so don't forget to
explore.

[datadog]: https://docs.datadoghq.com/agent
[fluent]: https://fluentbit.io
[node_exporter]: https://github.com/prometheus/node_exporter
[prometheus]: https://prometheus.io