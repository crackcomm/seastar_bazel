load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def seastar_archive():
    if not native.existing_rule("seastar"):
        http_archive(
            name = "seastar",
            build_file = "@seastar_bazel//:third_party/seastar.BUILD",
            patch_args = ["-p1"],
            patches = ["@seastar_bazel//:third_party/seastar_no_tls.patch"],
            sha256 = "3ef1e4591a55a4eea2b7d950a7d7c8c64722c6e7ce9b066ecfd43c51b5a3911a",
            strip_prefix = "seastar-ca586cfb8d9d9869ac61c84cbe32692e7eb82e4a",
            urls = [
                "https://github.com/scylladb/seastar/archive/ca586cfb8d9d9869ac61c84cbe32692e7eb82e4a.tar.gz",
            ],
        )
