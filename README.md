# Seastar in Bazel

This repository was created as a means of building seastar applications using Bazel.

## Tests

Tests and [demos](https://github.com/scylladb/seastar/tree/master/demos) can be run using following commands:

```sh
bazel run @seastar//:hello-world
bazel test @seastar//...
```

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

seastar_deps()

load("@seastar_bazel//:seastar.bzl", "seastar")

seastar()
```

See [BUILD](https://github.com/crackcomm/seastar_bazel/blob/main/examples/BUILD) file in examples.

To use local version of seastar use `new_local_repository` rule before `seastar` repository rule call.

```starlark
new_local_repository(
    name = "seastar",
    build_file = "@seastar_bazel//:third_party/seastar.BUILD",
    path = "my-seastar",
)
```

## Plans for improvement

- Build seastar with DPDK support.

---

If you have any questions or suggestions, feel free to open an issue.

---

Based on [tensorflow networking](https://github.com/tensorflow/networking/).
