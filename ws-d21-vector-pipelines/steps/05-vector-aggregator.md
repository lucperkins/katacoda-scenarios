And now we get to the centerpiece of this workshop, which is working with a Vector Aggregator. We're going to do a lot
of heavy lifting in this Aggregator. We'll take in data from multiple sources:

* Vector Agents collecting HTTP server logs
* Vector Agents collecting Syslog logs
* [Datadog Agents][datadog] collecting HTTP server logs
* [Fluent Bit][fluent] agents collecting logs
* [Prometheus] [Node Exporters][node_exporter] emitting host metrics

```
docker-compose \
--file /etc/vector/topologies/docker-compose.yml \
up \
--detach
```{{execute interrupt}}

## Monitoring Aggregators

Aggregators are just plain Vector instances used in a certain way (this is the heart of the "role" concept). That means
that we can observe Aggregators using `vector tap`{{execute T2}} and `vector top`{{execute T3}}, so don't forget to
explore.

[datadog]: https://docs.datadoghq.com/agent
[fluent]: https://fluentbit.io
[prometheus]: https://prometheus.io