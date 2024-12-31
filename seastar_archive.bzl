load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def seastar_archive():
    SEASTAR_COMMIT = "0739dc83f4ff6d5611d65581620a2172641b971d"
    SEASTAR_SHA256 = "4846fe7e3a8aa0a36b5d1c59df7979e2d12f56005675612631741f31365abdcc"

    if not native.existing_rule("seastar"):
        http_archive(
            name = "seastar",
            build_file = "@seastar_bazel//third_party:seastar.BUILD",
            sha256 = SEASTAR_SHA256,
            strip_prefix = "seastar-{commit}".format(commit = SEASTAR_COMMIT),
            url = "https://github.com/scylladb/seastar/archive/{commit}.tar.gz".format(commit = SEASTAR_COMMIT),
        )
