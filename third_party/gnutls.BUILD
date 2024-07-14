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
        "--disable-tests",
        "--disable-tools",
        "--disable-rpath",
        "--enable-shared=no",
        "--disable-non-suiteb-curves",
        "--without-p11-kit",
        "--with-included-libtasn1",
        "--with-included-unistring",
    ],
    lib_source = ":all",
    out_static_libs = ["libgnutls.a"],
    visibility = ["//visibility:public"],
    deps = ["@nettle"],
)
