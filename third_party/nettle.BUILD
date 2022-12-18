licenses(["notice"])  # LGPL3

exports_files(["COPYING.LESSERv3"])

load("@rules_foreign_cc//foreign_cc:configure.bzl", "configure_make")

package(default_visibility = ["//visibility:public"])

filegroup(
    name = "all",
    srcs = glob([
        "*.h",
        "*.c",
    ]),
)

configure_make(
    name = "nettle",
    args = [
        "-j`nproc`",
        "-l`nproc`",
    ],
    autogen = True,
    autogen_command = ".bootstrap",
    build_data = glob(["**/*"]),
    configure_in_place = True,
    configure_options = [
        "--disable-doc",
    ],
    lib_source = ":all",
    out_lib_dir = "lib64",
    out_shared_libs = ["libnettle.so"],
    out_static_libs = ["libnettle.a"],
    visibility = ["//visibility:public"],
    deps = [
        "@gmp",
    ],
)
