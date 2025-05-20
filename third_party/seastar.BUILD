load("@bazel_skylib//rules:common_settings.bzl", "bool_flag", "int_flag")
load(
    "@seastar_bazel//third_party:seastar_defs.bzl",
    "COPTS",
    "seastar_cc_library",
    "seastar_cc_test",
)

licenses(["notice"])  # Apache 2.0

package(default_visibility = ["//visibility:public"])

exports_files(["LICENSE"])

config_setting(
    name = "debug",
    values = {
        "compilation_mode": "dbg",
    },
)

bool_flag(
    name = "sstring",
    build_setting_default = True,
)

bool_flag(
    name = "dpdk",
    build_setting_default = False,
)

bool_flag(
    name = "numa",
    build_setting_default = True,
)

bool_flag(
    name = "uring",
    build_setting_default = False,
)

bool_flag(
    name = "hwloc",
    build_setting_default = False,
)

bool_flag(
    name = "systemtap",
    build_setting_default = True,
)

bool_flag(
    name = "default_allocator",
    build_setting_default = False,
)

bool_flag(
    name = "debug_allocations",
    build_setting_default = False,
)

bool_flag(
    name = "stack_guards",
    build_setting_default = False,
)

int_flag(
    name = "api_level",
    build_setting_default = 7,
    make_variable = "API_LEVEL",
)

int_flag(
    name = "scheduling_groups",
    build_setting_default = 16,
    make_variable = "SCHEDULING_GROUPS",
)

bool_flag(
    name = "logger_compile_time_fmt",
    build_setting_default = False,
)

bool_flag(
    name = "cpp_modules",
    build_setting_default = False,
)

config_setting(
    name = "use_sstring",
    flag_values = {":sstring": "true"},
)

config_setting(
    name = "use_dpdk",
    flag_values = {":dpdk": "true"},
)

config_setting(
    name = "use_numa",
    flag_values = {":numa": "true"},
)

config_setting(
    name = "use_uring",
    flag_values = {":uring": "true"},
)

config_setting(
    name = "use_hwloc",
    flag_values = {":hwloc": "true"},
)

config_setting(
    name = "use_systemtap",
    flag_values = {":systemtap": "true"},
)

config_setting(
    name = "use_default_allocator",
    flag_values = {":default_allocator": "true"},
)

config_setting(
    name = "use_debug_allocations",
    flag_values = {":debug_allocations": "true"},
)

config_setting(
    name = "use_stack_guards",
    flag_values = {":stack_guards": "true"},
)

config_setting(
    name = "use_logger_compile_time_fmt",
    flag_values = {":logger_compile_time_fmt": "true"},
)

config_setting(
    name = "use_cpp_modules",
    flag_values = {":cpp_modules": "true"},
)

proto_library(
    name = "metrics2_proto",
    srcs = ["src/proto/metrics2.proto"],
    strip_import_prefix = "src",
    deps = ["@protobuf//:timestamp_proto"],
)

cc_proto_library(
    name = "metrics2_cc_proto",
    deps = [":metrics2_proto"],
)

MODULE_SRCS = glob(
    ["src/**/*.cc"],
    exclude = [
        "src/seastar.cc",
        "src/testing/*.cc",
    ],
)

PUBLIC_HEADERS = glob(
    ["include/seastar/**/*.hh"],
    exclude = [
        "include/seastar/testing/*.hh",
    ],
) + [
    "include/seastar/http/chunk_parsers.hh",
    "include/seastar/http/request_parser.hh",
    "include/seastar/http/response_parser.hh",
]

cc_library(
    name = "headers",
    hdrs = PUBLIC_HEADERS,
    strip_include_prefix = "include",
    visibility = ["//visibility:public"],
)

INTERNAL_HEADERS = glob(["src/**/*.hh"])

seastar_cc_library(
    name = "seastar_internal_headers",
    hdrs = INTERNAL_HEADERS,
    includes = ["src"],
    strip_include_prefix = "src",
    visibility = ["//:__pkg__"],
)

seastar_cc_library(
    name = "seastar",
    srcs = MODULE_SRCS,
    copts = [
        "-Wno-error",
        "-Wno-include-angled-in-module-purview",
    ],
    features = select({
        ":use_cpp_modules": ["cpp_modules"],
        "//conditions:default": [],
    }),
    linkopts = [
        "-ldl",
        "-lrt",
    ],
    # module_interfaces = select({
    #     ":use_cpp_modules": ["src/seastar.cc"],
    #     "//conditions:default": [],
    # }),
    visibility = ["//visibility:public"],
    deps = [
        ":headers",
        ":metrics2_cc_proto",
        ":seastar_internal_headers",
        "@boost//:asio",
        "@boost//:endian",
        "@boost//:intrusive",
        "@boost//:lockfree",
        "@boost//:program_options",
        "@boost//:thread",
        "@cares_cares//:cares",
        "@fmt",
        "@gnutls",
        "@lz4",
        "@protobuf",
        "@sctp",
        "@seastar_bazel//third_party/valgrind",
        "@xfs",
        "@yaml-cpp",
    ] + select({
        ":use_hwloc": ["@hwloc"],
        "//conditions:default": [],
    }) + select({
        ":use_uring": ["@uring"],
        "//conditions:default": [],
    }) + select({
        ":use_dpdk": ["@dpdk"],
        "//conditions:default": [],
    }) + select({
        ":use_systemtap": ["@systemtap-sdt"],
        "//conditions:default": [],
    }) + select({
        ":use_numa": ["@seastar_bazel//third_party/numactl:numa"],
        "//conditions:default": [],
    }),
)

seastar_cc_library(
    name = "testing",
    srcs = [
        "src/testing/entry_point.cc",
        "src/testing/random.cc",
        "src/testing/seastar_test.cc",
        "src/testing/test_runner.cc",
    ],
    hdrs = [
        "include/seastar/testing/entry_point.hh",
        "include/seastar/testing/exchanger.hh",
        "include/seastar/testing/linux_perf_event.hh",
        "include/seastar/testing/on_internal_error.hh",
        "include/seastar/testing/perf_tests.hh",
        "include/seastar/testing/random.hh",
        "include/seastar/testing/seastar_test.hh",
        "include/seastar/testing/test_case.hh",
        "include/seastar/testing/test_runner.hh",
        "include/seastar/testing/thread_test_case.hh",
    ],
    defines = [
        "BOOST_TEST_ALTERNATIVE_INIT_API",
    ],
    visibility = ["//visibility:public"],
    deps = [
        ":seastar",
        "@boost//:test.so",
    ],
)

seastar_cc_library(
    name = "testing_main",
    srcs = ["@seastar_bazel//third_party:seastar_test_main.cc"],
    deps = [":testing"],
    alwayslink = 1,
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
    deps = [
        ":seastar",
        "@boost//:accumulators",
    ],
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
    deps = [
        ":seastar",
        "@boost//:accumulators",
    ],
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
        srcs = [file_name] + glob([
            "demos/*.hh",
            "apps/lib/*.hh",
        ]),
        copts = COPTS,
        includes = ["demos"],
        deps = [":seastar"],
    )
    for file_name in glob(
        ["demos/*.cc"],
        exclude = ["demos/hello-cxx-module.cc"],
    )
]

[
    seastar_cc_test(
        name = file_name.replace("tests/unit/", "").replace(".cc", ""),
        timeout = "long",
        srcs = glob(["tests/unit/*.hh"]) + [file_name],
        data = [
            "tests/unit/cert.cfg.in",
            "tests/unit/tls-ca-bundle.pem",
        ] if "tls" in file_name else [],
        defines = ["SEASTAR_TESTING_WITH_NETWORKING"],
        deps = [":seastar"],
    )
    for file_name in glob(
        ["tests/unit/*_test.cc"],
        exclude = [
            # TODO: certs from bazel runfiles
            "tests/unit/tls_test.cc",
            # times out:
            "tests/unit/distributed_test.cc",
            # https://github.com/scylladb/seastar/issues/520
            "tests/unit/slab_test.cc",
        ],
    )
]
