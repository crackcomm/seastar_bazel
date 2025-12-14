# Seastar in Bazel

This repository was created as a means of building seastar applications using Bazel.

## Tests

Tests and [demos](https://github.com/scylladb/seastar/tree/master/demos) can be run using following commands:

```sh
bazel run @seastar//:hello-world
bazel test @seastar//...
```

---

If you have any questions or suggestions, feel free to open an issue.

---

Based on [tensorflow networking](https://github.com/tensorflow/networking/).
