# Seastar in Bazel

This repository was created as a means of building seastar applications using Bazel.

It can build hello world application but it's not yet ready for production.

## Tests

Tests and [demos](https://github.com/scylladb/seastar/tree/master/demos) can be run using following commands:

```sh
bazel run @seastar//:hello-world
bazel test @seastar//...
```

NOTE: Tests currently don't fully work because of a linker [issue](https://github.com/crackcomm/seastar_bazel/issues/2).

## Plans for improvement

* Release and feature flags.
* Build and run seastar tests.
* Build seastar with DPDK support.

## Usage

In your `WORKSPACE` file add:

```starlark
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "seastar_bazel",
    # TODO: Get the latest sha256 value from a bazel debug message.
    # sha256 = "...",
    strip_prefix = "seastar_bazel-8327c59",
    # Replace 8327c59 with the latest commit.
    url = "https://github.com/crackcomm/seastar_bazel/archive/8327c59.tar.gz",
)

load("@seastar_bazel//:seastar_deps.bzl", "seastar_deps")
load("@seastar_bazel//:seastar.bzl", "seastar")

seastar_deps()
seastar()
```

See [BUILD](https://github.com/crackcomm/seastar_bazel/blob/main/examples/BUILD) file in examples.

To use local version of seastar use `new_local_repository` rule before `seastar` repository rule call.

```starlark
new_local_repository(
    name = "seastar",
    path = "my-seastar",
    build_file = "@seastar_bazel//:third_party/seastar.BUILD",
)
```

---

Based on [tensorflow networking](https://github.com/tensorflow/networking/) and some other projects:

* [tensorflow](https://github.com/tensorflow/tensorflow/) bazel rules
* [fuhailin/rules_deps](https://github.com/fuhailin/rules_deps)
* [redpanda](https://github.com/redpanda-data/redpanda/blob/b5db3b3a96f04b0e17344ac23025377eeaeb374b/cmake/oss.cmake.in#L168)
* [tensorflow networking](https://github.com/tensorflow/networking/) bazel rules
