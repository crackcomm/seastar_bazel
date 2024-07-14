load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def seastar_archive():
    SEASTAR_COMMIT = "a3ccb7a218da37e3ca0874ea405be9e530d68d30"
    SEASTAR_SHA256 = "fe3189445c65982f4f72563bd1f5d12813e5d26efacf6a0e03816df9ecaa37e7"

    if not native.existing_rule("seastar"):
        http_archive(
            name = "seastar",
            build_file = "@seastar_bazel//:third_party/seastar.BUILD",
            sha256 = SEASTAR_SHA256,
            strip_prefix = "seastar-{commit}".format(commit = SEASTAR_COMMIT),
            url = "https://github.com/scylladb/seastar/archive/{commit}.tar.gz".format(commit = SEASTAR_COMMIT),
        )
