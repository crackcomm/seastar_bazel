load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def seastar_archive():
    SEASTAR_COMMIT = "cd8877bd20e094227b63cec11dde88a86bb957f1"
    SEASTAR_SHA256 = "23bdde80f945d760b4ca929b9b56359049fa86f547754747508396c924f903af"

    if not native.existing_rule("seastar"):
        http_archive(
            name = "seastar",
            build_file = "@seastar_bazel//third_party:seastar.BUILD",
            sha256 = SEASTAR_SHA256,
            strip_prefix = "seastar-{commit}".format(commit = SEASTAR_COMMIT),
            url = "https://github.com/scylladb/seastar/archive/{commit}.tar.gz".format(commit = SEASTAR_COMMIT),
        )
