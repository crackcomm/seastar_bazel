load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def seastar_archive():
    SEASTAR_COMMIT = "4dc3871ed9f32816e7a03895e98c86a5502d980f"
    SEASTAR_SHA256 = "15c1ce5986ddd66939009116f2ecfc1e61f57e11640a34f0840f8a43bb12c477"

    if not native.existing_rule("seastar"):
        http_archive(
            name = "seastar",
            build_file = "@seastar_bazel//:third_party/seastar.BUILD",
            sha256 = SEASTAR_SHA256,
            strip_prefix = "seastar-{commit}".format(commit = SEASTAR_COMMIT),
            url = "https://github.com/scylladb/seastar/archive/{commit}.tar.gz".format(commit = SEASTAR_COMMIT),
        )
