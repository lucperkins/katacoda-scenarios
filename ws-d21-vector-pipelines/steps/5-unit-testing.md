Vector enables you to [unit test][test] the transforms in your observability data pipelines. The goal of unit testing
in Vector is exactly the same as in programming languages: you want to ensure that transforms produce the outcome you
expect from known inputs that you provide. You can test just a single transform or a series of transforms chained
together (which is a bit like testing a single transform if you think about it). The more complex your pipelines, the
more crucial unit testing becomes in eliminating

To run unit tests, you need to specify a few things:

* The transform(s) in question
* The input events
* The expected output events
* Vector Remap Language **conditions** that indicate

## Assertions

VRL has two testing-friendly functions, [`assert`][assert] and [`assert_eq`][assert_eq] that are direct analogues to
what you'd find in most programming languages. With both functions, you can supply an optional log message if the
condition fails.

## Shortcomings

Unit tests in Vector have the same shortcomings as unit tests in programming languages: you're responsible for providing
test inputs, and those inputs may end up not being fully representative of the events that enter the transform for
processing. But they can still be a great way to eliminate sources of failure—even cascading failure.

## How to configure and run tests

You can run unit tests using Vector's `test` command. Let's run a test suite right now:

```
vector test \
--config-dir /etc/vector/unit-testing
```{{execute interrupt}}

Welp. That didn't go well. Let's go through and turn this ship around, starting with our Vector config in
`/etc/vector/unit-testing/vector.toml`{{open}}.

[assert]: https://vrl.dev/functions/#assert
[assert_eq]: https://vrl.dev/functions/#assert_eq
[test]: https://vector.dev/docs/reference/configuration/unit-tests