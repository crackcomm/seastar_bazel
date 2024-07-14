load("@rules_foreign_cc//foreign_cc:configure.bzl", "configure_make")

licenses(["notice"])  # LGPL3

package(default_visibility = ["//visibility:public"])

exports_files(["COPYING.LESSERv3"])

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
        "--disable-shared",
    ],
    lib_source = ":all",
    out_lib_dir = "lib64",
    out_static_libs = [
        "libhogweed.a",
        "libnettle.a",
    ],
    visibility = ["//visibility:public"],
    deps = ["@gmp"],
)
