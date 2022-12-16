workspace(name = "seastar_bazel")

local_repository(
    name = "seastar_bazel_examples",
    path = "examples",
)

load("//:seastar_deps.bzl", "seastar_deps")

seastar_deps()

load("//:seastar.bzl", "seastar")

seastar()
