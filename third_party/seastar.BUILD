licenses(["notice"])  # Apache 2.0

exports_files(["LICENSE"])

package(default_visibility = ["//visibility:public"])

load("@bazel_skylib//rules:common_settings.bzl", "bool_flag")

bool_flag(
    name = "with_tls",
    build_setting_default = False,
)

config_setting(
    name = "build_tls",
    flag_values = {":with_tls": "true"},
)

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
    "SEASTAR_API_LEVEL=6",  # TODO: option
    "SEASTAR_SSTRING",  # TODO: option
    "SEASTAR_HAVE_LZ4_COMPRESS_DEFAULT",
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

srcs_glob = [
    "src/**/*.cc",
    "src/**/*.hh",
]

srcs_exclude = [
    "src/testing/*.cc",
]

hdrs_srcs = [
    "include/seastar/http/chunk_parsers.hh",
    "include/seastar/http/request_parser.hh",
    "include/seastar/http/response_parser.hh",
]

hdrs_glob = ["include/seastar/**/*.hh"]

hdrs_exclude = [
    "include/seastar/testing/*.hh",
    "include/seastar/testing/*.hh",
]

cc_library(
    name = "seastar",
    srcs =
        select({
            ":build_tls": glob(
                srcs_glob,
                exclude = srcs_exclude,
            ),
            "//conditions:default": glob(
                srcs_glob,
                exclude = srcs_exclude + [
                    "src/net/tls.cc",
                ],
            ),
        }),
    hdrs =
        select({
            ":build_tls": glob(
                hdrs_glob,
                exclude = hdrs_exclude,
            ) + hdrs_srcs,
            "//conditions:default": glob(
                hdrs_glob,
                exclude = hdrs_exclude + [
                    "include/seastar/net/tls.hh",
                ],
            ) + hdrs_srcs,
        }),
    copts = COPTS,
    defines = select({
        ":build_tls": [
            "SEASTAR_HAVE_TLS",
        ],
        "//conditions:default": [
            "SEASTAR_NO_TLS",
        ],
    }) + select({
        ":debug": DEBUG_FLAGS,
        "//conditions:default": [],
    }) + DEFAULT_DEFINES,
    includes = [
        "src",
    ],
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
    ] + select({
        ":build_tls": [
            "@gnutls",
        ],
        "//conditions:default": [],
    }),
)

cc_library(
    name = "testing",
    srcs = glob(
        ["src/testing/*.cc"],
    ),
    hdrs = glob(
        ["include/seastar/testing/*.hh"],
    ),
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

[
    cc_binary(
        name = app.replace("apps/", ""),
        srcs = glob([app + "/*.cc"]),
        additional_linker_inputs = [
            "@gnutls",
        ],
        linkopts = ["-lgomp"],
        deps = [
            ":seastar",
            "@boost//:accumulators",
        ],
    )
    for app in glob(
        ["apps/*"],
        exclude = ["apps/CMakeLists.txt"],
        exclude_directories = 0,
    )
]

[
    cc_binary(
        name = file_name.replace("demos/", "").replace(".cc", ""),
        srcs = [file_name],
        deps = [
            ":seastar",
            "@boost//:accumulators",
        ],
    )
    for file_name in glob(["demos/*.cc"])
    if "tls" not in file_name
]

[
    cc_test(
        name = file_name.replace("tests/unit/", "").replace(".cc", ""),
        srcs = glob(["tests/unit/*.hh"]) + [file_name],
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
    if "tls" not in file_name
]
