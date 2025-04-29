""" Definitions for Seastar. """

COPTS = [
    "-std=c++23",
    "-fno-semantic-interposition",
    "-Wimplicit-fallthrough",
    "-Wno-error=deprecated",
    "-Wno-unused-variable",
    "-Wno-unused-result",
    "-Wno-unused-parameter",
    "-Wno-unused-but-set-variable",
] + select({
    "@seastar//:use_stack_guards": ["-fstack-clash-protection"],
    "//conditions:default": [],
})

# Some more:
#   SEASTAR_OVERRIDE_ALLOCATOR_PAGE_SIZE
#   SEASTAR_TASK_BACKTRACE

CORE_DEFINES = [
    "SEASTAR_DEPRECATED_OSTREAM_FORMATTERS",  # only required for 2 tests
    "SEASTAR_SCHEDULING_GROUPS_COUNT=$(SCHEDULING_GROUPS)",
    "SEASTAR_API_LEVEL=$(API_LEVEL)",
    "SEASTAR_STRERROR_R_CHAR_P",
] + select({
    "@seastar//:use_sstring": ["SEASTAR_SSTRING"],
    "//conditions:default": [],
}) + select({
    "@seastar//:use_logger_compile_time_fmt": ["SEASTAR_LOGGER_COMPILE_TIME_FMT"],
    "//conditions:default": [],
}) + select({
    "@seastar//:use_stack_guards": ["SEASTAR_THREAD_STACK_GUARDS"],
    "//conditions:default": [],
})

CORE_LOCAL_DEFINES = [
    "SEASTAR_DEFERRED_ACTION_REQUIRE_NOEXCEPT",
] + select({
    "@seastar//:use_numa": ["SEASTAR_HAVE_NUMA"],
    "//conditions:default": [],
}) + select({
    "@seastar//:use_uring": ["SEASTAR_HAVE_URING"],
    "//conditions:default": [],
}) + select({
    "@seastar//:use_dpdk": ["SEASTAR_HAVE_DPDK"],
    "//conditions:default": [],
}) + select({
    "@seastar//:use_default_allocator": ["SEASTAR_DEFAULT_ALLOCATOR"],
    "//conditions:default": [],
}) + select({
    "@seastar//:use_hwloc": ["SEASTAR_HAVE_HWLOC"],
    "//conditions:default": [],
}) + select({
    "@seastar//:use_systemtap": ["SEASTAR_HAVE_SYSTEMTAP_SDT"],
    "//conditions:default": [],
})

DEBUG_DEFINES = [
    "SEASTAR_DEBUG",
    "SEASTAR_DEBUG_SHARED_PTR",
    "SEASTAR_DEBUG_PROMISE",
    "SEASTAR_SHUFFLE_TASK_QUEUE",
    "SEASTAR_TYPE_ERASE_MORE",
]

DEBUG_LOCAL_DEFINES = []

DEFAULT_DEFINES = CORE_DEFINES + select({
    ":debug": DEBUG_DEFINES,
    "//conditions:default": [],
})

DEFAULT_LOCAL_DEFINES = CORE_LOCAL_DEFINES + select({
    "@seastar//:use_debug_allocations": ["SEASTAR_DEBUG_ALLOCATIONS"],
    "//conditions:default": [],
}) + select({
    ":debug": DEBUG_LOCAL_DEFINES,
    "//conditions:default": [],
})

TOOLCHAINS = [
    ":api_level",
    ":scheduling_groups",
]

def _extra_kwargs(kwargs):
    return {
        k: v
        for k, v in kwargs.items()
        if k not in ["defines", "local_defines", "includes", "copts", "deps"]
    }

def seastar_cc_library(**kwargs):
    """A Seastar C++ library."""
    native.cc_library(
        copts = COPTS + kwargs.get("copts", []),
        deps = kwargs.get("deps", []),
        defines = DEFAULT_DEFINES + kwargs.get("defines", []),
        local_defines = DEFAULT_LOCAL_DEFINES + kwargs.get("local_defines", []),
        toolchains = TOOLCHAINS,
        includes = ["include", "src"] + kwargs.get("includes", []),
        strip_include_prefix = "include",
        **_extra_kwargs(kwargs)
    )

def seastar_cc_test(**kwargs):
    """A Seastar C++ library."""
    native.cc_test(
        copts = COPTS + kwargs.get("copts", []),
        defines = DEFAULT_DEFINES + kwargs.get("defines", []),
        local_defines = DEFAULT_LOCAL_DEFINES + kwargs.get("local_defines", []),
        toolchains = TOOLCHAINS,
        deps = [
            "@seastar//:testing_main",
            "@boost//:test",
            "@boost//:test.a",
        ] + kwargs.get("deps", []),
        **_extra_kwargs(kwargs)
    )
