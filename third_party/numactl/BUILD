load("@rules_cc//cc:cc_import.bzl", "cc_import")
load("@rules_cc//cc:cc_library.bzl", "cc_library")

HDR_FILES = [
    "numaif.h",
    "numa.h",
]

COPIED_HDRS = ["numa_include/" + f for f in HDR_FILES]

genrule(
    name = "numa_include",
    outs = COPIED_HDRS,
    cmd = "mkdir -p $(@D)/numa_include && " +
          " && ".join(["cp /usr/include/{} $(@D)/numa_include/{}".format(f, f) for f in HDR_FILES]),
    local = True,
    message = "Copying system numa headers from /usr/include",
    tags = ["no-remote-exec"],
)

genrule(
    name = "copy_libnuma_so",
    outs = ["libnuma.so"],
    cmd = "cp /usr/lib/libnuma.so $(OUTS)",
    local = True,
    message = "Copying system numa shared library from /usr/lib",
    tags = ["no-remote-exec"],
)

cc_library(
    name = "numa_headers",
    srcs = ["dummy.cc"],  # required to re-generate the headers
    hdrs = [":numa_include"],
    includes = ["numa_include"],
)

cc_import(
    name = "numa_system",
    interface_library = ":libnuma.so",
    system_provided = True,
    visibility = ["//visibility:public"],
    deps = [":numa_headers"],
)

alias(
    name = "numa",
    actual = ":numa_system",
    visibility = ["//visibility:public"],
)
