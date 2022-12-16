licenses(["notice"])  # Boost

exports_files(["License.txt"])

CRYPTOPP_COPTS = [
    "-Wno-deprecated-enum-enum-conversion",
]

cc_library(
    name = "cryptopp_internal",
    srcs = glob(["*.cpp"]) + glob(["*.h"]),
    copts = [
        "-fopenmp",
        "-msha",
        "-maes",
        "-mavx2",
        "-mpclmul",
    ] + CRYPTOPP_COPTS,
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
    copts = CRYPTOPP_COPTS,
    include_prefix = "cryptopp",
    visibility = ["//visibility:public"],
    deps = [":cryptopp_internal"],
)
