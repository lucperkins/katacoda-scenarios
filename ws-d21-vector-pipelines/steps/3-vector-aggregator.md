Now that we've learned some basics of building Vector pipelines, it's time to configure a Vector
Aggregator. Remembering back to the intro, using an Aggregator enables you to have a division of
labor in your pipelines. Your Agents can collect and forward data while your Aggregator can process
that data (transform, enrich, redact, route, etc.).

If we open up the `aggregator/vector/aggregator/vector.toml` file in the IDE, we can see
a (mostly) empty configuration file for a Vector Aggregator. In the next few sections, we'll set up
our Aggregator to collect data from multiple sources, perform some processing work, and then ship
the resulting data off to multiple sinks.