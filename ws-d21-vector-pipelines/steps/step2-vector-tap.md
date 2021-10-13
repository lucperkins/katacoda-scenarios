# Reading Vector log output using `vector tap`

[`vector tap`][tap] is a command of the `vector` CLI that enables you to pipe logs from a Vector
pipeline to your local environment.

Run `vector --config-dir /etc/vector/vector-tap --watch-config vector.toml`{{execute}} to start up
Vector with the same configuration we ended up with in the last tutorial.

Then, in another window, run `vector top`{{execute}} to open the gates to your internal log stream.

[tap]: https://vector.dev/docs/reference/cli/#tap