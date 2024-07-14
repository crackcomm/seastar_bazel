load("@rules_foreign_cc//foreign_cc:configure.bzl", "configure_make")

licenses(["notice"])  # LGPL3

package(default_visibility = ["//visibility:public"])

exports_files(["COPYING.LESSERv3"])

filegroup(
    name = "all",
    srcs = glob(
        [
            "*.h",
            "*.c",
        ],
        exclude = [
            "demos/**",
            "tests/**",
        ],
    ),
)

configure_make(
    name = "gmp",
    args = [
        "-j`nproc`",
        "-l`nproc`",
    ],
    build_data = glob(["**/*"]),
    configure_in_place = True,
    lib_source = ":all",
    out_static_libs = ["libgmp.a"],
    visibility = ["//visibility:public"],
)
