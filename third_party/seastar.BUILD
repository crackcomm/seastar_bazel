licenses(["notice"])  # Apache 2.0

exports_files(["LICENSE"])

package(default_visibility = ["//visibility:public"])

config_setting(
    name = "debug",
    values = {
        "compilation_mode": "dbg",
    },
)

#proto_library(
#    name = "metrics2_proto",
#    srcs = ["src/proto/metrics2.proto"],
#)
#
#cc_proto_library(
#    name = "metrics2_cc_proto",
#    deps = [":metrics2_proto"],
#)

COPTS = ["-std=c++20"]

DEFAULT_DEFINES = [
    "SEASTAR_HAVE_NUMA",
    "SEASTAR_SCHEDULING_GROUPS_COUNT=24",  # TODO: option
    "SEASTAR_API_LEVEL=7",  # TODO: option
    "SEASTAR_SSTRING",  # TODO: option
    "SEASTAR_HAVE_LZ4_COMPRESS_DEFAULT",
    "SEASTAR_STRERROR_R_CHAR_P",
    # TODO:
    # "SEASTAR_HAVE_DPDK",
]

DEBUG_FLAGS = [
    "SEASTAR_DEBUG",
    "SEASTAR_DEBUG_ALLOCATIONS",
    "SEASTAR_DEBUG_SHARED_PTR",
    "SEASTAR_DEFAULT_ALLOCATOR",
    "SEASTAR_SHUFFLE_TASK_QUEUE",
    "SEASTAR_TYPE_ERASE_MORE",
]

LINKOPTS = [
    "-lnuma",
    "-ldl",
    "-lm",
    "-lrt",
    "-lstdc++fs",
]

cc_library(
    name = "seastar",
    srcs = glob(
        [
            "src/**/*.cc",
            "src/**/*.hh",
        ],
        exclude = [
            "src/seastar.cc",
            "src/testing/*.cc",
        ],
    ),
    hdrs = glob(
        ["include/seastar/**/*.hh"],
        exclude = [
            "include/seastar/testing/*.hh",
            "include/seastar/testing/*.hh",
        ],
    ) + [
        "include/seastar/http/chunk_parsers.hh",
        "include/seastar/http/request_parser.hh",
        "include/seastar/http/response_parser.hh",
    ],
    copts = COPTS,
    defines = DEFAULT_DEFINES + select({
        ":debug": DEBUG_FLAGS,
        "//conditions:default": [],
    }),
    includes = ["src"],
    linkopts = LINKOPTS,
    strip_include_prefix = "include",
    deps = [
        #":metrics2_cc_proto",
        "@boost//:asio",
        "@boost//:endian",
        "@boost//:filesystem",
        "@boost//:fusion",
        "@boost//:lockfree",
        "@boost//:program_options",
        "@boost//:system",
        "@boost//:thread",
        "@boost//:variant",
        "@cares_cares//:cares",
        "@cryptopp",
        "@fmtlib",
        "@lz4",
        "@org_lzma_lzma//:lzma",
        "@readerwriterqueue",
        "@sctp",
        "@systemtap-sdt",
        "@xfs",
        "@yaml-cpp",
        "@com_google_protobuf//:protobuf",
        "@nettle",
        "@gnutls",
    ],
)

cc_library(
    name = "testing",
    srcs = glob(
        ["src/testing/*.cc"],
    ),
    hdrs = glob(
        ["include/seastar/testing/*.hh"],
    ),
    copts = COPTS,
    defines = [
        "BOOST_TEST_ALTERNATIVE_INIT_API",
    ],
    strip_include_prefix = "include",
    deps = [
        ":seastar",
        "@boost//:test.so",
    ],
)

genrule(
    name = "generate_http_chunk_parsers",
    srcs = ["src/http/chunk_parsers.rl"],
    outs = ["include/seastar/http/chunk_parsers.hh"],
    cmd = "\n".join([
        "$(location @ragel//:ragelc) -G2 -o $@ $<",
        "sed -i -e '1h;2,$$H;$$!d;g' -re 's/static const char _nfa[^;]*;//g' $@",
    ]),
    tools = ["@ragel//:ragelc"],
)

genrule(
    name = "generate_http_request_parser",
    srcs = ["src/http/request_parser.rl"],
    outs = ["include/seastar/http/request_parser.hh"],
    cmd = "\n".join([
        "$(location @ragel//:ragelc) -G2 -o $@ $<",
        "sed -i -e '1h;2,$$H;$$!d;g' -re 's/static const char _nfa[^;]*;//g' $@",
    ]),
    tools = ["@ragel//:ragelc"],
)

genrule(
    name = "generate_http_response_parser",
    srcs = ["src/http/response_parser.rl"],
    outs = ["include/seastar/http/response_parser.hh"],
    cmd = "\n".join([
        "$(location @ragel//:ragelc) -G2 -o $@ $<",
        "sed -i -e '1h;2,$$H;$$!d;g' -re 's/static const char _nfa[^;]*;//g' $@",
    ]),
    tools = ["@ragel//:ragelc"],
)

cc_binary(
    name = "io_tester",
    srcs = ["apps/io_tester/io_tester.cc"],
    copts = COPTS,
    deps = [":seastar"],
)

cc_binary(
    name = "ioinfo",
    srcs = ["apps/io_tester/ioinfo.cc"],
    copts = COPTS,
    deps = [":seastar"],
)

cc_binary(
    name = "iotune",
    srcs = ["apps/iotune/iotune.cc"],
    copts = COPTS,
    deps = [":seastar"],
)

cc_binary(
    name = "rpc_tester",
    srcs = ["apps/rpc_tester/rpc_tester.cc"],
    copts = COPTS,
    deps = [":seastar"],
)

cc_binary(
    name = "seawreck",
    srcs = ["apps/seawreck/seawreck.cc"],
    copts = COPTS,
    deps = [":seastar"],
)

[
    cc_binary(
        name = file_name.replace("demos/", "").replace(".cc", ""),
        srcs = [file_name],
        copts = COPTS,
        includes = ["demos"],
        deps = [
            ":seastar",
            "@boost//:accumulators",
        ],
    )
    for file_name in glob(
        ["demos/*.cc"],
        exclude = ["demos/hello-cxx-module.cc"],
    )
]

[
    cc_test(
        name = file_name.replace("tests/unit/", "").replace(".cc", ""),
        srcs = glob(["tests/unit/*.hh"]) + [file_name],
        copts = COPTS,
        data = [
            "tests/unit/cert.cfg.in",
            "tests/unit/tls-ca-bundle.pem",
        ] if "tls" in file_name else [],
        defines = ["SEASTAR_TESTING_MAIN"],
        includes = ["src"],
        deps = [
            ":testing",
            "@boost//:accumulators",
            "@boost//:test",
            "@boost//:test.a",
        ],
    )
    for file_name in glob(["tests/unit/*_test.cc"])
]
