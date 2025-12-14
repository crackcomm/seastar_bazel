load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def seastar_archive():
    SEASTAR_COMMIT = "0c3cd0cd39a40cb93d98efb1e01a8bc00f7be20b"
    SEASTAR_SHA256 = "4c900c09313dc7c3bfb52587caab5f9424a9855f3c3bfcd88483d25da6790a99"

    if not native.existing_rule("seastar"):
        http_archive(
            name = "seastar",
            build_file = "@seastar_bazel//seastar:seastar.BUILD",
            sha256 = SEASTAR_SHA256,
            strip_prefix = "seastar-{commit}".format(commit = SEASTAR_COMMIT),
            url = "https://github.com/scylladb/seastar/archive/{commit}.tar.gz".format(commit = SEASTAR_COMMIT),
        )
