licenses(["notice"])  # Apache 2.0

exports_files(["LICENSE"])

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

DEFINES = [
    "SEASTAR_NO_EXCEPTION_HACK",
    "NO_EXCEPTION_INTERCEPT",
    "SEASTAR_DEFAULT_ALLOCATOR",
    "SEASTAR_HAVE_NUMA",
    "SEASTAR_SCHEDULING_GROUPS_COUNT=24",  # TODO: option
    "SEASTAR_API_LEVEL=6",  # TODO: option
    "SEASTAR_SSTRING",  # TODO: option
    # TODO:
    # "SEASTAR_HAVE_DPDK",
    # Debug flags:
    # "SEASTAR_DEBUG",
    # "SEASTAR_DEFAULT_ALLOCATOR",
    # "SEASTAR_SHUFFLE_TASK_QUEUE",
    # "SEASTAR_TYPE_ERASE_MORE",
]

LINKOPTS = [
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
            "src/testing/*.cc",
        ],
    ),
    hdrs = glob(
        ["include/seastar/**/*.hh"],
        exclude = [
            "include/seastar/testing/*.hh",
        ],
    ) + [
        "include/seastar/http/chunk_parsers.hh",
        "include/seastar/http/request_parser.hh",
        "include/seastar/http/response_parser.hh",
    ],
    copts = COPTS,
    defines = DEFINES,
    includes = [
        "src",
    ],
    linkopts = LINKOPTS,
    strip_include_prefix = "include",
    visibility = ["//visibility:public"],
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
        "@cares",
        "@cryptopp",
        "@fmtlib",
        "@gnutls",
        "@lz4",
        "@org_lzma_lzma//:lzma",
        "@readerwriterqueue",
        "@sctp",
        "@systemtap-sdt",
        "@xfs",
        "@yaml-cpp",
        "@com_google_protobuf//:protobuf",
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
    local_defines = [
        "BOOST_TEST_ALTERNATIVE_INIT_API",
    ],
    strip_include_prefix = "include",
    visibility = ["//visibility:public"],
    deps = [
        ":seastar",
        "@boost//:test",
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

cc_test(
    name = "tests",
    srcs = ["tests/unit/sstring_test.cc"],
    additional_linker_inputs = [
        "@gnutls",
    ],
    data = [
        "@cryptopp//:testdata",
    ],
    linkopts = ["-lgomp"],
    linkstatic = True,
    visibility = ["//visibility:public"],
    deps = [
        ":seastar",
        ":testing",
        "@boost//:test.a",
    ],
)
