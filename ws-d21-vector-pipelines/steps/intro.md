Hello, everyone, and welcome to Highly Scalable Observability Data Pipelines with Vector!

Just in case you're not yet familiar with Vector, some core facts:

* [Vector] is an infrastructure tool for constructing **pipelines** for observability data. Pipelines take in data
  from **sources**, potentially change that data (using **transforms**), and then send it off to **sinks**. In Vector,
  pipelines can live on a single Vector instance *or* they can span several Vector instances.
* You can run Vector in two different deployment [roles]—the [Agent] and [Aggregator] roles—which enables you to build
  pipelines that distribute work across Vector instances.
* Vector currently supports logs and metrics and we're working on support for traces.

## Vector versus observability agents

You may have come across observability agents like the [Datadog Agent][datadog], [Fluent Bit][fluent], and [Logstash].
One key benefit of agents is that developers don't need to think all that much about where their observability data ends
up. They just insturment their applications to emit logs and metrics and the rest is handled by [SRE]s and others.

You **can** use Vector as an [Agent]—and a lean and powerful one at that—but what makes Vector different is that you can
also use it as an **Aggregator** that, well, aggregates data from Agents and *even other Aggregators*. The two models
are illustrated below.

### The "forwarder" model

```
(source(s)) -> (agent) -> (sink)
```

### The Vector Aggregator model

```
(source(s)) -> (agent) --
                         \
(source(s)) -> (agent) - - - > (aggregator) [--> (aggregator(s))]
                         /
(source(s)) -> (agent) --
```

In the [Aggregator] role, Vector collects data from Agents and/or other Aggregators and can then do a wide variety of
things with that data:

* Enrich with GeoIP or other data
* Apply tags and other metadata
* Parse, decode, encode
* Filter out data you don't want
* Route to different sinks based on some criteria

The goal: **flexible deployment topologies**. You can run Vector Aggregators in different data centers, different
regions, handling different types of data—you can chain together Agents and Aggregators however you need. Your Agents
can live close to your log and metric sources with your Aggregators more centralized.

## What we'll cover in this workshop

* How to configure Vector pipelines using [TOML]
* Monitoring Vector
* [Vector Remap Language][vrl] (VRL)

## What we won't cover in this workshop

* Deploying Vector
* Most Vector components. But please do [browse the components][components] to see what's available.
* Most Vector Remap Language functions. But make sure to [browse those][vrl_funcs] too.

And without further ado, let's get started!

[agent]: https://vector.dev/docs/setup/deployment/roles/#agent
[aggregator]: https://vector.dev/docs/setup/deployment/roles/#aggregator
[components]: https://vector.dev/components
[datadog]: https://docs.datadoghq.com/agent
[logstash]: https://www.elastic.co/logstash
[roles]: https://vector.dev/docs/setup/deployment/roles
[sre]: https://en.wikipedia.org/wiki/Site_reliability_engineering
[toml]: https://toml.io
[vector]: https://vector.dev
[vrl]: https://vrl.dev
[vrl_funcs]: https://vrl.dev/functions