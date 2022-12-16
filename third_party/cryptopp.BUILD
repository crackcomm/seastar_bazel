licenses(["notice"])  # Boost

exports_files(["License.txt"])

COPTS = [
    "-fopenmp",
    "-msha",
    "-maes",
    # TODO: Issue #1
    #"-mavx2",
    "-mpclmul",
    "-Wno-deprecated-enum-enum-conversion",
]

cc_library(
    name = "cryptopp_internal",
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
    copts = COPTS,
    defines = [
        "CRYPTOPP_DISABLE_SSE4",
    ],
    textual_hdrs = [
        "algebra.cpp",
        "strciphr.cpp",
        "eprecomp.cpp",
        "polynomi.cpp",
        "eccrypto.cpp",
    ],
)

cc_library(
    name = "cryptopp",
    hdrs = glob(["*.h"]),
    copts = COPTS,
    include_prefix = "cryptopp",
    visibility = ["//visibility:public"],
    deps = [":cryptopp_internal"],
)

filegroup(
    name = "testdata",
    srcs = glob(["TestData/*.dat"]),
    visibility = ["//visibility:public"],
)
