Now that we've learned some basics of building Vector pipelines, it's time to
work with a Vector Aggregator. In this scenario, we'll have multiple
observability agents that send data to our Aggregator:

* Vector Agents collecting HTTP server logs
* [Datadog Agents][datadog] collecting HTTP server logs

These agents will all be sending logs. Our Aggregator will also be handling metrics emitted by
[Prometheus][prometheus] [Node Exporters][node_exporter].

If you open up the `/etc/vector/aggregator/vector/aggregator/vector.toml`{{open}} file, you'll see
an empty configuration file for our Aggregator.

And then let's navigate to `/etc/vector/topologies/docker-compose.yml`{{open}} in our editor to get a sense of the
structure of this Agent/Aggregator topology.

## Monitoring Aggregators

Aggregators are just plain Vector instances used in a certain way (this is the heart of the "role" concept). That means
that we can observe Aggregators using `vector tap`{{execute T2}} and `vector top`{{execute T3}}, so don't forget to
explore.

[compose]:
[datadog]: https://docs.datadoghq.com/agent
[node_exporter]: https://github.com/prometheus/node_exporter
[prometheus]: https://prometheus.io