licenses(["notice"])

load("@rules_foreign_cc//foreign_cc:defs.bzl", "cmake")

exports_files(["License.txt"])

package(default_visibility = ["//visibility:public"])

filegroup(
    name = "srcs",
    srcs = glob(
        ["*.cpp"],
        exclude = [
            "test.cpp",
            "datatest.cpp",
            "dlltest.cpp",
            "fipstest.cpp",
            "regtest*.cpp",
        ],
    ) + glob(["*.h"]),
)

cmake(
    name = "cryptopp",
    build_args = ["-j `nproc`"],
    build_data = glob(
        [
            "CMakeLists.txt",
            "*.cmake",
            "TestPrograms/*.cxx",
        ],
    ),
    cache_entries = {
        "CMAKE_CXX_FLAGS": "-std=c++14",
        "BUILD_TESTING": "OFF",
    },
    generate_args = ["-GNinja"],
    lib_source = ":srcs",
    out_static_libs = select({
        "@platforms//os:windows": ["cryptopp.lib"],
        "//conditions:default": ["libcryptopp.a"],
    }),
)
