licenses(["notice"])  # BSD-3-Clause

package(default_visibility = ["//visibility:public"])

exports_files(["LICENSE"])

cc_library(
    name = "zstd",
    srcs = glob([
        "common/*.c",
        "common/*.h",
        "compress/*.c",
        "compress/*.h",
        "decompress/*.c",
        "decompress/*.h",
        "decompress/*.S",
    ]),
    hdrs = [
        "zdict.h",
        "zstd.h",
        "zstd_errors.h",
    ],
    includes = [
      ".",
      "common",
      "compress",
      "decompress",
    ],
)
