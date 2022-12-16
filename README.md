# Seastar in Bazel

This repository was created as a means of building seastar applications using Bazel.

It can build hello world application but it's not yet ready for production.

## Plans for improvement

* Build and run seastar tests.
* Build seastar with DPDK support.
* Use [CMake default](https://github.com/scylladb/seastar/blob/784bfdd8f745f6b2ac260e0098c8685e33a34475/CMakeLists.txt#L804-L806) feature flags.
* Expose feature flags to users.

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

## Credits

This repo is based on [tensorflow networking](https://github.com/tensorflow/networking/) with build rules copied from other projects.

* [tensorflow](https://github.com/tensorflow/tensorflow/) bazel rules
* [tensorflow networking](https://github.com/tensorflow/networking/) bazel rules
* [fuhailin/rules_deps](https://github.com/fuhailin/rules_deps)
* [redpanda](https://github.com/redpanda-data/redpanda/blob/b5db3b3a96f04b0e17344ac23025377eeaeb374b/cmake/oss.cmake.in#L168)
