package(default_visibility = ["//visibility:public"])

exports_files(["LICENSE"])

COMMON_COPTS = [
    "-DFMT_HEADER_ONLY",
    "-DNO_EXCEPTION_HACK",
    "-DNO_EXCEPTION_INTERCEPT",
    "-DHAVE_LZ4_COMPRESS_DEFAULT",
]

cc_binary(
    name = "hello-world",
    srcs = [
        "hello-world.cc",
    ],
    copts = COMMON_COPTS,
    visibility = ["//visibility:public"],
    deps = [
        "@seastar",
    ],
)
