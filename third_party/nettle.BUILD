load("@rules_foreign_cc//foreign_cc:configure.bzl", "configure_make")

licenses(["notice"])  # LGPL3

package(default_visibility = ["//visibility:public"])

exports_files(["COPYING.LESSERv3"])

filegroup(
    name = "all",
    srcs = glob(["**"]),
)

configure_make(
    name = "nettle",
    args = [
        "-j`nproc`",
        "-l`nproc`",
    ],
    autogen = True,
    autogen_command = ".bootstrap",
    build_data = glob(["**/*"]),
    configure_in_place = True,
    configure_options = [
        "--disable-documentation",
        "--disable-openssl",
        "--disable-shared",
        "--enable-static",
        "--enable-public-key",
        "--prefix=$$INSTALLDIR",
        "--libdir=$$INSTALLDIR/lib",
        "--includedir=$$INSTALLDIR/include",
    ],
    env = {
        "CPPFLAGS": "-I$$EXT_BUILD_DEPS$$/include",
        "LDFLAGS": "-L$$EXT_BUILD_DEPS$$/lib",
    },
    lib_source = ":all",
    out_lib_dir = "lib",
    out_static_libs = [
        "libhogweed.a",
        "libnettle.a",
    ],
    targets = [
        "install-headers install-static",
    ],
    visibility = ["//visibility:public"],
    deps = ["@gmp"],
)
