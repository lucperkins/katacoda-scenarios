Now that we've learned some basics of building Vector pipelines, it's time to configure a Vector
Aggregator. Remembering back to the intro, using an Aggregator has one major benefit:

* You can distribute observability data processing across multiple nodes in your pipeline, rather
  than making your agent the sole locus of work.

If you open up the
`/etc/vector/aggregator/vector/aggregator/vector.toml`{{open}} file, you'll see
a (mostly) empty configuration file for our Aggregator. In the next few sections, we'll set up our
Aggregator to collect data from multiple observability Agents and perform some processing work akin
to what you'd find in the wild.