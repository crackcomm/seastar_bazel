licenses(["notice"])  # MIT

exports_files(["LICENSE.rst"])

cc_library(
    name = "fmtlib",
    srcs = [
        #"src/fmt.cc",
        "src/format.cc",
    ],
    hdrs = glob(["include/fmt/*.h"]),
    defines = [
        "FMT_HEADER_ONLY",
        "FMT_VERSION",
    ],
    includes = [
        "include",
    ],
    visibility = ["//visibility:public"],
)
