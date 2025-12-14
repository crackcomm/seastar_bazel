load("@rules_foreign_cc//foreign_cc:configure.bzl", "configure_make")

licenses(["permissive"])  # LGPL headers only

exports_files(["LICENSE"])

filegroup(
    name = "all",
    srcs = glob(["**"]),
)

configure_make(
    name = "gnutls",
    args = [
        "-j`nproc`",
        "-l`nproc`",
    ],
    build_data = glob(["**/*"]),
    configure_in_place = True,
    configure_options = [
        "--disable-doc",
        "--disable-libdane",
        "--disable-dependency-tracking",
        "--disable-openssl-compatibility",
        "--disable-tests",
        "--disable-tools",
        "--disable-rpath",
        "--disable-manpages",
        "--enable-shared=no",
        "--enable-static=yes",
        "--disable-non-suiteb-curves",
        "--without-p11-kit",
        "--with-included-libtasn1",
        "--with-included-unistring",
        "--with-zlib",
        "--with-zstd",
    ],
    env = {
        # Generic flags
        "CPPFLAGS": "-I$$EXT_BUILD_DEPS$$/include",
        "LDFLAGS": "-L$$EXT_BUILD_DEPS$$/lib",

        # Nettle & Hogweed (Explicitly set to override broken .pc files)
        "NETTLE_CFLAGS": "-I$$EXT_BUILD_DEPS$$/include",
        "NETTLE_LIBS": "-L$$EXT_BUILD_DEPS$$/lib -lnettle -lgmp",
        "HOGWEED_CFLAGS": "-I$$EXT_BUILD_DEPS$$/include",
        "HOGWEED_LIBS": "-L$$EXT_BUILD_DEPS$$/lib -lhogweed -lnettle -lgmp",

        # Zlib
        "ZLIB_CFLAGS": "-I$$EXT_BUILD_DEPS$$/include",
        "ZLIB_LIBS": "-L$$EXT_BUILD_DEPS$$/lib -lz",

        # Zstd
        "LIBZSTD_CFLAGS": "-I$$EXT_BUILD_DEPS$$/include",
        "LIBZSTD_LIBS": "-L$$EXT_BUILD_DEPS$$/lib -lzstd",
    },
    lib_source = ":all",
    out_static_libs = ["libgnutls.a"],
    visibility = ["//visibility:public"],
    deps = [
        "@nettle",
        "@zlib",
        "@zstd",
    ],
)
