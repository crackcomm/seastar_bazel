load("@rules_cc//cc:cc_library.bzl", "cc_library")

HDR_FILES = [
    "valgrind/valgrind.h",
    "valgrind/callgrind.h",
]

genrule(
    name = "valgrind_include",
    outs = ["valgrind_include/" + f for f in HDR_FILES],
    cmd = "mkdir -p $(@D)/valgrind_include/valgrind && " +
          " echo $(@D)  && " +
          " && ".join(["cp /usr/include/{} $(@D)/valgrind_include/{}".format(f, f) for f in HDR_FILES]),
    local = True,
    message = "Copying system Valgrind headers from /usr/include",
    tags = ["no-remote-exec"],
)

cc_library(
    name = "valgrind",
    hdrs = [":valgrind_include"],
    includes = ["valgrind_include"],
    visibility = ["//visibility:public"],
)
