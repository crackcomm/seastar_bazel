load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def seastar_archive():
    if not native.existing_rule("seastar"):
        http_archive(
            name = "seastar",
            build_file = "@seastar_bazel//:third_party/seastar.BUILD",
            patch_args = ["-p1"],
            patches = ["@seastar_bazel//:third_party/seastar_no_tls.patch"],
            sha256 = "a72e3e65562f06551be62c42a79cafd0adbe8f3d1960b4973091661d218e60ee",
            strip_prefix = "seastar-a4ecf99f17049df85736ff8974c2bc4549288588",
            urls = [
                "https://github.com/scylladb/seastar/archive/a4ecf99.tar.gz",
            ],
        )
