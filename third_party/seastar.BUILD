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
    name = "use_logger_compile_time_fmt",
    flag_values = {":logger_compile_time_fmt": "true"},
)

proto_library(
    name = "metrics2_proto",
    srcs = ["src/proto/metrics2.proto"],
    strip_import_prefix = "src",
    deps = ["@com_google_protobuf//:timestamp_proto"],
)

cc_proto_library(
    name = "metrics2_cc_proto",
    deps = [":metrics2_proto"],
)

CORE_HEADERS = [
    "include/seastar/core/abort_on_expiry.hh",
    "include/seastar/core/abort_source.hh",
    "include/seastar/core/abortable_fifo.hh",
    "include/seastar/core/bitset-iter.hh",
    "include/seastar/core/byteorder.hh",
    "include/seastar/core/cacheline.hh",
    "include/seastar/core/chunked_fifo.hh",
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
    "include/seastar/core/preempt.hh",
    "include/seastar/core/print.hh",
    "include/seastar/core/scattered_message.hh",
    "include/seastar/core/scheduling.hh",
    "include/seastar/core/semaphore.hh",
    "include/seastar/core/shard_id.hh",
    "include/seastar/core/shared_ptr.hh",
    "include/seastar/core/shared_ptr_debug_helper.hh",
    "include/seastar/core/sstring.hh",
    "include/seastar/core/task.hh",
    "include/seastar/core/temporary_buffer.hh",
    "include/seastar/core/thread.hh",
    "include/seastar/core/thread_impl.hh",
    "include/seastar/core/timed_out_error.hh",
    "include/seastar/core/timer-set.hh",
    "include/seastar/core/timer.hh",
    "include/seastar/core/unaligned.hh",
    "include/seastar/coroutine/exception.hh",
    "include/seastar/net/const.hh",
    "include/seastar/net/packet.hh",
    "include/seastar/util/backtrace.hh",
    "include/seastar/util/bool_class.hh",
    "include/seastar/util/critical_alloc_section.hh",
    "include/seastar/util/eclipse.hh",
    "include/seastar/util/indirect.hh",
    "include/seastar/util/is_smart_ptr.hh",
    "include/seastar/util/modules.hh",
    "include/seastar/util/noncopyable_function.hh",
    "include/seastar/util/optimized_optional.hh",
    "include/seastar/util/std-compat.hh",
    "include/seastar/util/used_size.hh",
    "include/seastar/util/variant_utils.hh",

    # level 2
    "include/seastar/core/abort_on_ebadf.hh",
    "include/seastar/core/align.hh",
    "include/seastar/core/aligned_buffer.hh",
    "include/seastar/core/app-template.hh",
    "include/seastar/core/bitops.hh",
    "include/seastar/core/circular_buffer.hh",
    "include/seastar/core/circular_buffer_fixed_capacity.hh",
    "include/seastar/core/condition-variable.hh",
    "include/seastar/core/distributed.hh",
    "include/seastar/core/enum.hh",
    "include/seastar/core/file-types.hh",
    "include/seastar/core/file.hh",
    "include/seastar/core/fstream.hh",
    "include/seastar/core/gate.hh",
    "include/seastar/core/idle_cpu_handler.hh",
    "include/seastar/core/internal/api-level.hh",
    "include/seastar/core/internal/estimated_histogram.hh",
    "include/seastar/core/internal/io_desc.hh",
    "include/seastar/core/internal/io_request.hh",
    "include/seastar/core/internal/io_sink.hh",
    "include/seastar/core/internal/pollable_fd.hh",
    "include/seastar/core/internal/run_in_background.hh",
    "include/seastar/core/io_priority_class.hh",
    "include/seastar/core/make_task.hh",
    "include/seastar/core/manual_clock.hh",
    "include/seastar/core/map_reduce.hh",
    "include/seastar/core/memory.hh",
    "include/seastar/core/metrics.hh",
    "include/seastar/core/metrics_api.hh",
    "include/seastar/core/metrics_registration.hh",
    "include/seastar/core/metrics_types.hh",
    "include/seastar/core/on_internal_error.hh",
    "include/seastar/core/posix.hh",
    "include/seastar/core/queue.hh",
    "include/seastar/core/ragel.hh",
    "include/seastar/core/reactor.hh",
    "include/seastar/core/reactor_config.hh",
    "include/seastar/core/resource.hh",
    "include/seastar/core/scheduling_specific.hh",
    "include/seastar/core/scollectd.hh",
    "include/seastar/core/seastar.hh",
    "include/seastar/core/sharded.hh",
    "include/seastar/core/shared_mutex.hh",
    "include/seastar/core/smp.hh",
    "include/seastar/core/smp_options.hh",
    "include/seastar/core/stream.hh",
    "include/seastar/core/thread_cputime_clock.hh",
    "include/seastar/core/transfer.hh",
    "include/seastar/core/when_all.hh",
    "include/seastar/coroutine/generator.hh",
    "include/seastar/net/api.hh",
    "include/seastar/net/byteorder.hh",
    "include/seastar/net/inet_address.hh",
    "include/seastar/net/socket_defs.hh",
    "include/seastar/net/tls.hh",
    "include/seastar/net/unix_address.hh",
    "include/seastar/util/iostream.hh",
    "include/seastar/util/log-cli.hh",
    "include/seastar/util/log-impl.hh",
    "include/seastar/util/log.hh",
    "include/seastar/util/memory_diagnostics.hh",
    "include/seastar/util/program-options.hh",
    "include/seastar/util/sampler.hh",
    "include/seastar/util/short_streams.hh",
    "include/seastar/util/spinlock.hh",
    "include/seastar/util/string_utils.hh",
    "include/seastar/util/tuple_utils.hh",

    # level 3 (used only in .cc files)
    "include/seastar/core/alien.hh",
    "include/seastar/core/array_map.hh",
    "include/seastar/core/exception_hacks.hh",
    "include/seastar/core/execution_stage.hh",
    "include/seastar/core/fair_queue.hh",
    "include/seastar/core/fsnotify.hh",
    "include/seastar/core/fsqual.hh",
    "include/seastar/core/future-util.hh",
    "include/seastar/core/internal/buffer_allocator.hh",
    "include/seastar/core/internal/io_intent.hh",
    "include/seastar/core/internal/poll.hh",
    "include/seastar/core/internal/read_state.hh",
    "include/seastar/core/internal/stall_detector.hh",
    "include/seastar/core/internal/uname.hh",
    "include/seastar/core/io_intent.hh",
    "include/seastar/core/io_queue.hh",
    "include/seastar/core/linux-aio.hh",
    "include/seastar/core/polymorphic_temporary_buffer.hh",
    "include/seastar/core/prefetch.hh",
    "include/seastar/core/relabel_config.hh",
    "include/seastar/core/report_exception.hh",
    "include/seastar/core/scollectd_api.hh",
    "include/seastar/core/signal.hh",
    "include/seastar/core/sleep.hh",
    "include/seastar/core/stall_sampler.hh",
    "include/seastar/core/systemwide_memory_barrier.hh",
    "include/seastar/core/with_scheduling_group.hh",
    "include/seastar/core/with_timeout.hh",
    "include/seastar/coroutine/as_future.hh",
    "include/seastar/net/arp.hh",
    "include/seastar/net/config.hh",
    "include/seastar/net/dhcp.hh",
    "include/seastar/net/dns.hh",
    "include/seastar/net/dpdk.hh",
    "include/seastar/net/ethernet.hh",
    "include/seastar/net/ip.hh",
    "include/seastar/net/ip_checksum.hh",
    "include/seastar/net/ipv4_address.hh",
    "include/seastar/net/ipv6_address.hh",
    "include/seastar/net/native-stack.hh",
    "include/seastar/net/net.hh",
    "include/seastar/net/packet-util.hh",
    "include/seastar/net/posix-stack.hh",
    "include/seastar/net/proxy.hh",
    "include/seastar/net/stack.hh",
    "include/seastar/net/tcp-stack.hh",
    "include/seastar/net/tcp.hh",
    "include/seastar/net/toeplitz.hh",
    "include/seastar/net/udp.hh",
    "include/seastar/net/virtio-interface.hh",
    "include/seastar/net/virtio.hh",
    "include/seastar/util/alloc_failure_injector.hh",
    "include/seastar/util/conversions.hh",
    "include/seastar/util/defer.hh",
    "include/seastar/util/exceptions.hh",
    "include/seastar/util/file.hh",
    "include/seastar/util/function_input_iterator.hh",
    "include/seastar/util/internal/iovec_utils.hh",
    "include/seastar/util/internal/magic.hh",
    "include/seastar/util/later.hh",
    "include/seastar/util/print_safe.hh",
    "include/seastar/util/process.hh",
    "include/seastar/util/read_first_line.hh",
    "include/seastar/util/reference_wrapper.hh",
    "include/seastar/util/shared_token_bucket.hh",
    "include/seastar/util/tmp_file.hh",
    "include/seastar/util/transform_iterator.hh",

    # level 4 (used only in tests and applications)
    "include/seastar/core/checked_ptr.hh",
    "include/seastar/core/dpdk_rte.hh",
    "include/seastar/core/expiring_fifo.hh",
    "include/seastar/core/layered_file.hh",
    "include/seastar/core/pipe.hh",
    "include/seastar/core/rwlock.hh",
    "include/seastar/core/shared_future.hh",
    "include/seastar/core/shared_ptr_incomplete.hh",
    "include/seastar/core/simple-stream.hh",
    "include/seastar/core/slab.hh",
    "include/seastar/core/units.hh",
    "include/seastar/core/vector-data-sink.hh",
    "include/seastar/core/weak_ptr.hh",
    "include/seastar/core/when_any.hh",
    "include/seastar/coroutine/all.hh",
    "include/seastar/coroutine/maybe_yield.hh",
    "include/seastar/coroutine/parallel_for_each.hh",
    "include/seastar/coroutine/switch_to.hh",
    "include/seastar/net/packet-data-source.hh",
    "include/seastar/util/closeable.hh",
    "include/seastar/util/concepts.hh",
    "include/seastar/util/lazy.hh",
    "include/seastar/util/source_location-compat.hh",
]

CORE_SRCS = [
    "src/core/alien.cc",
    "src/core/app-template.cc",
    "src/core/cgroup.hh",
    "src/core/condition-variable.cc",
    "src/core/dpdk_rte.cc",
    "src/core/exception_hacks.cc",
    "src/core/execution_stage.cc",
    "src/core/fair_queue.cc",
    "src/core/file-impl.hh",
    "src/core/file.cc",
    "src/core/fsnotify.cc",
    "src/core/fsqual.cc",
    "src/core/fstream.cc",
    "src/core/future-util.cc",
    "src/core/future.cc",
    "src/core/io_queue.cc",
    "src/core/linux-aio.cc",
    "src/core/memory.cc",
    "src/core/metrics.cc",
    "src/core/on_internal_error.cc",
    "src/core/posix.cc",
    "src/core/prefault.hh",
    "src/core/program_options.cc",
    "src/core/program_options.hh",
    "src/core/reactor.cc",
    "src/core/reactor_backend.cc",
    "src/core/reactor_backend.hh",
    "src/core/resource.cc",
    "src/core/scollectd-impl.hh",
    "src/core/scollectd.cc",
    "src/core/semaphore.cc",
    "src/core/sharded.cc",
    "src/core/signal.cc",
    "src/core/smp.cc",
    "src/core/sstring.cc",
    "src/core/syscall_result.hh",
    "src/core/syscall_work_queue.hh",
    "src/core/systemwide_memory_barrier.cc",
    "src/core/thread.cc",
    "src/core/thread_pool.cc",
    "src/core/thread_pool.hh",
    "src/core/uname.cc",
    "src/core/vla.hh",
    "src/net/arp.cc",
    "src/net/config.cc",
    "src/net/dhcp.cc",
    "src/net/dns.cc",
    "src/net/dpdk.cc",
    "src/net/ethernet.cc",
    "src/net/inet_address.cc",
    "src/net/ip.cc",
    "src/net/ip_checksum.cc",
    "src/net/native-stack-impl.hh",
    "src/net/native-stack.cc",
    "src/net/net.cc",
    "src/net/packet.cc",
    "src/net/posix-stack.cc",
    "src/net/proxy.cc",
    "src/net/socket_address.cc",
    "src/net/stack.cc",
    "src/net/tcp.cc",
    "src/net/tls.cc",
    "src/net/udp.cc",
    "src/net/unix_address.cc",
    "src/net/virtio.cc",
    "src/util/alloc_failure_injector.cc",
    "src/util/backtrace.cc",
    "src/util/conversions.cc",
    "src/util/exceptions.cc",
    "src/util/file.cc",
    "src/util/log.cc",
    "src/util/process.cc",
    "src/util/program-options.cc",
    "src/util/read_first_line.cc",
    "src/util/short_streams.cc",
    "src/util/tmp_file.cc",
]

RPC_HEADERS = [
    "include/seastar/rpc/lz4_compressor.hh",
    "include/seastar/rpc/lz4_fragmented_compressor.hh",
    "include/seastar/rpc/multi_algo_compressor_factory.hh",
    "include/seastar/rpc/rpc.hh",
    "include/seastar/rpc/rpc_impl.hh",
    "include/seastar/rpc/rpc_types.hh",
]

RPC_SRCS = [
    "src/rpc/lz4_compressor.cc",
    "src/rpc/lz4_fragmented_compressor.cc",
    "src/rpc/rpc.cc",
]

JSON_HEADERS = [
    "include/seastar/json/json_elements.hh",
    "include/seastar/json/formatter.hh",
]

JSON_SRCS = [
    "src/json/json_elements.cc",
    "src/json/formatter.cc",
]

HTTP_HEADERS = [
    "include/seastar/http/api_docs.hh",
    "include/seastar/http/client.hh",
    "include/seastar/http/common.hh",
    "include/seastar/http/connection_factory.hh",
    "include/seastar/http/exception.hh",
    "include/seastar/http/file_handler.hh",
    "include/seastar/http/function_handlers.hh",
    "include/seastar/http/handlers.hh",
    "include/seastar/http/httpd.hh",
    "include/seastar/http/internal/content_source.hh",
    "include/seastar/http/json_path.hh",
    "include/seastar/http/matcher.hh",
    "include/seastar/http/matchrules.hh",
    "include/seastar/http/mime_types.hh",
    "include/seastar/http/reply.hh",
    "include/seastar/http/request.hh",
    "include/seastar/http/routes.hh",
    "include/seastar/http/short_streams.hh",
    "include/seastar/http/transformers.hh",
    "include/seastar/http/url.hh",
    # Generated headers
    "include/seastar/http/chunk_parsers.hh",
    "include/seastar/http/request_parser.hh",
    "include/seastar/http/response_parser.hh",
]

HTTP_SRCS = [
    "src/http/api_docs.cc",
    "src/http/client.cc",
    "src/http/common.cc",
    "src/http/file_handler.cc",
    "src/http/httpd.cc",
    "src/http/json_path.cc",
    "src/http/matcher.cc",
    "src/http/mime_types.cc",
    "src/http/reply.cc",
    "src/http/request.cc",
    "src/http/routes.cc",
    "src/http/transformers.cc",
    "src/http/url.cc",
]

METRICS_HEADERS = [
    "include/seastar/core/prometheus.hh",
]

METRICS_SRCS = [
    "src/core/prometheus.cc",
]

seastar_cc_library(
    name = "core",
    srcs = CORE_SRCS,
    hdrs = CORE_HEADERS,
    linkopts = [
        "-ldl",
        "-lrt",
    ] + select({
        ":use_numa": ["-lnuma"],
        "//conditions:default": [],
    }),
    deps = [
        "@boost//:asio",
        "@boost//:endian",
        "@boost//:intrusive",
        "@boost//:lockfree",
        "@boost//:program_options",
        "@boost//:thread",
        "@cares_cares//:cares",
        "@fmtlib",
        "@gnutls",
        "@sctp",
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
    }),
)

seastar_cc_library(
    name = "metrics",
    srcs = METRICS_SRCS,
    hdrs = METRICS_HEADERS,
    deps = [
        ":http",
        ":metrics2_cc_proto",
        "@com_google_protobuf//:protobuf",
    ],
)

seastar_cc_library(
    name = "json",
    srcs = JSON_SRCS,
    hdrs = JSON_HEADERS,
    deps = [
        ":core",
        "@boost//:container",
    ],
)

seastar_cc_library(
    name = "http",
    srcs = HTTP_SRCS,
    hdrs = HTTP_HEADERS,
    deps = [
        ":core",
        ":json",
        "@boost//:algorithm",
        "@boost//:move",
    ],
)

seastar_cc_library(
    name = "rpc",
    srcs = RPC_SRCS,
    hdrs = RPC_HEADERS,
    deps = [
        ":core",
        "@lz4",
    ],
)

seastar_cc_library(
    name = "websocket",
    srcs = [
        "src/websocket/server.cc",
    ],
    hdrs = [
        "include/seastar/websocket/server.hh",
    ],
    deps = [
        ":http",
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
        ":core",
        "@boost//:test.so",
    ],
)

seastar_cc_library(
    name = "seastar",
    deps = [
        ":core",
        ":http",
        ":json",
        ":metrics",
        ":rpc",
        ":websocket",
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
    deps = [
        ":core",
        "@boost//:accumulators",
    ],
)

cc_binary(
    name = "ioinfo",
    srcs = ["apps/io_tester/ioinfo.cc"],
    copts = COPTS,
    deps = [":core"],
)

cc_binary(
    name = "iotune",
    srcs = ["apps/iotune/iotune.cc"],
    copts = COPTS,
    deps = [":core"],
)

cc_binary(
    name = "rpc_tester",
    srcs = ["apps/rpc_tester/rpc_tester.cc"],
    copts = COPTS,
    deps = [
        ":rpc",
        "@boost//:accumulators",
    ],
)

cc_binary(
    name = "seawreck",
    srcs = ["apps/seawreck/seawreck.cc"],
    copts = COPTS,
    deps = [":http"],
)

[
    cc_binary(
        name = file_name.replace("demos/", "").replace(".cc", ""),
        srcs = [file_name] + glob(["demos/*.hh"]),
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
