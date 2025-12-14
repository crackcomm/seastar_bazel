load("@rules_foreign_cc//foreign_cc:defs.bzl", "cmake")

package(default_visibility = ["//visibility:public"])

filegroup(
    name = "srcs",
    srcs = glob(["**"]),
)

cmake(
    name = "cares",
    build_args = [
        "-j `nproc`",
    ],
    cache_entries = {
        "BUILD_SHARED_LIBS": "OFF",
        "CMAKE_BUILD_TYPE": "Release",
        "CARES_BUILD_TESTS": "off",
        "CARES_BUILD_TOOLS": "off",
        "CMAKE_INSTALL_LIBDIR": "lib",
        "CMAKE_INSTALL": "ON",
        "CARES_SHARED": "off",
        "CARES_STATIC": "on",
        "CARES_STATIC_PIC": "on",
    },
    generate_args = ["-GNinja"],
    lib_source = ":srcs",
    out_lib_dir = "lib",
    out_static_libs = select({
        "@platforms//os:windows": ["cares.lib"],
        "//conditions:default": ["libcares.a"],
    }),
)
