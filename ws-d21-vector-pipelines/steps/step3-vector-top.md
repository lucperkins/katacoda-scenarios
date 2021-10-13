# Viewing Vector metrics in real time using `vector top`

[`vector top`][top], not to be confused with `vector tap` from the last tutorial (!), is a command
of the `vector` CLI that enables you to view Vector's internal metrics in real time. It's inspired
by [htop] and, like `tap`, is a powerful way to eavesdrop on Vector's internal activity.

Run `vector --config-dir /etc/vector/vector-tap --watch-config vector.toml`{{execute}} to start up
Vector with the same configuration we had in the last tutorial.

In another window, run `vector top`{{execute}} to open the UI.

[htop]: https://htop.dev
[top]: https://vector.dev/docs/reference/cli/#top