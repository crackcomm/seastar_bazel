load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def seastar_archive():
    SEASTAR_COMMIT = "be362915263d43caa094b69428d6584855bbe36e"
    SEASTAR_SHA256 = "4d17e4fa5ba166528fbff1b5a93e934f68248b3328a667344d589a95e5a3900a"

    if not native.existing_rule("seastar"):
        http_archive(
            name = "seastar",
            build_file = "@seastar_bazel//:third_party/seastar.BUILD",
            patch_args = ["-p1"],
            patches = ["@seastar_bazel//:third_party/seastar_no_tls.patch"],
            sha256 = SEASTAR_SHA256,
            strip_prefix = "seastar-{commit}".format(commit = SEASTAR_COMMIT),
            url = "https://github.com/scylladb/seastar/archive/{commit}.tar.gz".format(commit = SEASTAR_COMMIT),
        )
