Vector is built to enable you to monitor your Vector instances easily. Two of the best interfaces
for that are `vector tap` and `vector top`, both of which are commands in the `vector` CLI. Both
commands use Vector's [GraphQL] API and can be run remotely, that is, they can "eavesdrop" on
Vector's internal activity. Both can provide powerful insight and debugging potential.

## vector tap

[`vector tap`][tap] enables you to pipe logs from a Vector instance into your local environment.

In order to see `vector tap` in action, we first need to start up Vector using the same
configuration we ended up with in the first tutorial:

```
vector \
  --config-dir /etc/vector/monitoring-vector \
  --watch-config vector.toml
```{{execute}}

Run `vector tap`{{execute T1}} to open the gates to your internal log stream.

## vector top

[`vector top`][top], not to be confused with `vector tap` from above, enables you to view Vector's
internal metrics in real time. It's inspired by a systems monitoring tool called [htop].

Run `vector top`{{execute T2}} to take a look at Vector's internal metrics.

[graphql]: https://graphql.org
[htop]: https://htop.dev
[tap]: https://vector.dev/docs/reference/cli/#tap
[top]: https://vector.dev/docs/reference/cli/#top