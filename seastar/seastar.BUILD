load("@bazel_skylib//rules:common_settings.bzl", "bool_flag", "int_flag")
load("@rules_python//python:defs.bzl", "py_binary")
load(
    "@seastar_bazel//seastar:defs.bzl",
    "COPTS",
    "seastar_cc_library",
    "seastar_cc_test",
    "seastar_generate_swagger",
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
    name = "gnutls",
    build_setting_default = True,
)

bool_flag(
    name = "openssl",
    build_setting_default = False,
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
    build_setting_default = 9,
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
    name = "asan",
    build_setting_default = False,
)

bool_flag(
    name = "asan_fiber_support",
    build_setting_default = True,
)

bool_flag(
    name = "cpp_modules",
    build_setting_default = False,
)

bool_flag(
    name = "exception_intercept",
    build_setting_default = True,
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
    name = "use_gnutls",
    flag_values = {":gnutls": "true"},
)

config_setting(
    name = "use_openssl",
    flag_values = {":openssl": "true"},
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
    name = "asan_enabled",
    flag_values = {":asan": "true"},
)

config_setting(
    name = "have_asan_fiber_support",
    flag_values = {":asan_fiber_support": "true"},
)

config_setting(
    name = "use_cpp_modules",
    flag_values = {":cpp_modules": "true"},
)

config_setting(
    name = "use_exception_intercept",
    flag_values = {":exception_intercept": "true"},
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

BASE_HEADERS = [
    "include/seastar/core/abort_on_expiry.hh",
    "include/seastar/core/abort_source.hh",
    "include/seastar/core/abortable_fifo.hh",
    "include/seastar/core/align.hh",
    "include/seastar/core/circular_buffer_fixed_capacity.hh",
    "include/seastar/core/bitops.hh",
    "include/seastar/core/bitset-iter.hh",
    "include/seastar/core/cacheline.hh",
    "include/seastar/core/chunked_fifo.hh",
    "include/seastar/core/circular_buffer.hh",
    "include/seastar/core/coroutine.hh",
    "include/seastar/core/deleter.hh",
    "include/seastar/core/do_with.hh",
    "include/seastar/core/format.hh",
    "include/seastar/core/function_traits.hh",
    "include/seastar/core/future.hh",
    "include/seastar/core/iostream-impl.hh",
    "include/seastar/core/iostream.hh",
    "include/seastar/core/loop.hh",
    "include/seastar/core/lowres_clock.hh",
    "include/seastar/core/make_task.hh",
    "include/seastar/core/preempt.hh",
    "include/seastar/core/scattered_message.hh",
    "include/seastar/core/scheduling.hh",
    "include/seastar/core/enum.hh",
    "include/seastar/core/semaphore.hh",
    "include/seastar/core/shard_id.hh",
    "include/seastar/core/shared_ptr.hh",
    "include/seastar/core/shared_ptr_debug_helper.hh",
    "include/seastar/core/sstring.hh",
    "include/seastar/core/task.hh",
    "include/seastar/core/temporary_buffer.hh",
    "include/seastar/core/thread_impl.hh",
    "include/seastar/core/timed_out_error.hh",
    "include/seastar/core/timer-set.hh",
    "include/seastar/core/timer.hh",
    "include/seastar/core/transfer.hh",
    "include/seastar/core/file-types.hh",
    "include/seastar/coroutine/exception.hh",
    "include/seastar/coroutine/maybe_yield.hh",
    "include/seastar/net/const.hh",
    "include/seastar/net/packet.hh",
    "include/seastar/util/assert.hh",
    "include/seastar/util/backtrace.hh",
    "include/seastar/util/bool_class.hh",
    "include/seastar/util/critical_alloc_section.hh",
    "include/seastar/util/eclipse.hh",
    "include/seastar/util/indirect.hh",
    "include/seastar/util/iostream.hh",
    "include/seastar/util/is_smart_ptr.hh",
    "include/seastar/util/noncopyable_function.hh",
    "include/seastar/util/optimized_optional.hh",
    "include/seastar/util/sampler.hh",
    "include/seastar/util/std-compat.hh",
    "include/seastar/util/used_size.hh",
    "include/seastar/util/variant_utils.hh",
]

BASE_SRCS = [
    "src/core/sstring.cc",
]

GNUTLS_SRCS = [
    "src/net/tls_gnutls.cc",
    "src/core/crypto_gnutls.cc",
]

OPENSSL_SRCS = [
    "src/net/tls_openssl.cc",
    "src/core/crypto_openssl.cc",
]

MODULE_SRCS = glob(
    ["src/**/*.cc"],
    exclude = [
        "src/seastar.cc",
        "src/testing/*.cc",
        "src/core/prometheus.cc",
    ] + BASE_SRCS + GNUTLS_SRCS + OPENSSL_SRCS,
)

PUBLIC_HEADERS = glob(
    ["include/seastar/**/*.hh"],
    exclude = [
        "include/seastar/testing/*.hh",
        "include/seastar/core/prometheus.hh",
    ] + BASE_HEADERS,
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

INTERNAL_HEADERS = glob(
    ["src/**/*.hh"],
    exclude = [
        "src/core/prometheus-impl.hh",
    ] + BASE_HEADERS,
)

seastar_cc_library(
    name = "seastar_internal_headers",
    hdrs = INTERNAL_HEADERS,
    includes = ["src"],
    strip_include_prefix = "src",
    visibility = ["//:__pkg__"],
)

seastar_cc_library(
    name = "base",
    srcs = BASE_SRCS,
    hdrs = BASE_HEADERS,
    local_defines = select({
        ":use_exception_intercept": [],
        "//conditions:default": ["NO_EXCEPTION_INTERCEPT"],
    }),
    deps = [
        "@boost//:container",
        "@boost//:intrusive",
        "@fmt",
    ],
)

seastar_cc_library(
    name = "seastar",
    srcs = MODULE_SRCS + select({
        ":use_gnutls": GNUTLS_SRCS,
        "//conditions:default": [],
    }) + select({
        ":use_openssl": OPENSSL_SRCS,
        "//conditions:default": [],
    }),
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
    local_defines = select({
        ":use_exception_intercept": [],
        "//conditions:default": ["NO_EXCEPTION_INTERCEPT"],
    }) + select({
        ":use_openssl": ["SEASTAR_HAVE_OPENSSL"],
        "//conditions:default": [],
    }) + select({
        ":use_gnutls": ["SEASTAR_HAVE_GNUTLS"],
        "//conditions:default": [],
    }),
    # module_interfaces = select({
    #     ":use_cpp_modules": ["src/seastar.cc"],
    #     "//conditions:default": [],
    # }),
    visibility = ["//visibility:public"],
    deps = [
        ":base",
        ":headers",
        ":seastar_internal_headers",
        "@boost//:asio",
        "@boost//:endian",
        "@boost//:intrusive",
        "@boost//:lockfree",
        "@boost//:program_options",
        "@cares_cares//:cares",
        "@fmt",
        "@lz4",
        "@sctp",
        "@seastar_bazel//third_party/valgrind",
        "@xfs",
        "@yaml-cpp",
    ] + select({
        ":use_gnutls": ["@gnutls"],
        "//conditions:default": [],
    }) + select({
        # ":use_hwloc": ["@hwloc"],
        "//conditions:default": [],
    }) + select({
        ":use_uring": ["@liburing"],
        "//conditions:default": [],
    }) + select({
        ":use_dpdk": [
            # "@dpdk",
            "@seastar_bazel//third_party/numactl:numa",
        ],
        "//conditions:default": [],
    }) + select({
        ":use_systemtap": ["@systemtap-sdt"],
        "//conditions:default": [],
    }),
)

seastar_cc_library(
    name = "prometheus",
    srcs = [
        "src/core/prometheus.cc",
        "src/core/prometheus-impl.hh",
    ],
    hdrs = [
        "include/seastar/core/prometheus.hh",
    ],
    visibility = ["//visibility:public"],
    deps = [
        ":metrics2_cc_proto",
        ":seastar",
        "@protobuf",
    ],
)

seastar_cc_library(
    name = "testing",
    srcs = [
        "src/testing/entry_point.cc",
        "src/testing/random.cc",
        "src/testing/seastar_test.cc",
        "src/testing/test_runner.cc",
    ],
    hdrs = glob([
        "include/seastar/testing/*.hh",
    ]),
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
    name = "benchmark",
    srcs = [
        "tests/perf/linux_perf_event.cc",
        "tests/perf/perf_tests.cc",
    ],
    deps = [":testing"],
)

seastar_cc_library(
    name = "testing_main",
    srcs = ["@seastar_bazel//seastar:seastar_test_main.cc"],
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

py_binary(
    name = "seastar_json2code",
    srcs = ["scripts/seastar-json2code.py"],
    main = "scripts/seastar-json2code.py",
)

seastar_generate_swagger(
    name = "demo_api",
    in_file = "apps/httpd/demo.json",
    visibility = ["//visibility:public"],
)

cc_binary(
    name = "httpd",
    srcs = ["apps/httpd/main.cc"],
    copts = COPTS,
    deps = [
        ":demo_api",
        ":seastar",
    ],
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
