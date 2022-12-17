load("@rules_foreign_cc//foreign_cc:defs.bzl", "cmake")

package(default_visibility = ["//visibility:public"])

filegroup(
    name = "all_srcs",
    srcs = glob(["**"]),
)

cmake(
    name = "cares",
    build_args = [
        "-j `nproc`",
    ],
    cache_entries = {
        "CMAKE_BUILD_TYPE": "Release",
        "CARES_BUILD_TESTS": "off",
        "CARES_BUILD_TOOLS": "off",
        "CARES_SHARED": "off",
        "CARES_STATIC": "on",
        "CARES_STATIC_PIC": "on",
    },
    generate_args = ["-GNinja"],
    lib_source = ":all_srcs",
    out_static_libs = select({
        "@platforms//os:windows": ["cares.lib"],
        "//conditions:default": ["libcares.a"],
    }),
)
