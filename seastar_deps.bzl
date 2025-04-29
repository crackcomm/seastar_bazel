load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def seastar_deps():
    maybe(
        http_archive,
        name = "bazel_skylib",
        sha256 = "bc283cdfcd526a52c3201279cda4bc298652efa898b10b4db0837dc51652756f",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.7.1/bazel-skylib-1.7.1.tar.gz",
            "https://github.com/bazelbuild/bazel-skylib/releases/download/1.7.1/bazel-skylib-1.7.1.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "rules_foreign_cc",
        sha256 = "c7913eb3ce2e9fea0e1b2ba65c51114ea66a524d20d974f720a9baa5cbbb2ab3",
        strip_prefix = "rules_foreign_cc-0ed27c13b18f412e00e9122fc01327503d52579c",
        url = "https://github.com/bazelbuild/rules_foreign_cc/archive/0ed27c13b18f412e00e9122fc01327503d52579c.tar.gz",
    )

    maybe(
        http_archive,
        name = "rules_cc",
        urls = ["https://github.com/bazelbuild/rules_cc/releases/download/0.0.17/rules_cc-0.0.17.tar.gz"],
        sha256 = "abc605dd850f813bb37004b77db20106a19311a96b2da1c92b789da529d28fe1",
        strip_prefix = "rules_cc-0.0.17",
    )

    maybe(
        http_archive,
        name = "rules_python",
        sha256 = "4f7e2aa1eb9aa722d96498f5ef514f426c1f55161c3c9ae628c857a7128ceb07",
        strip_prefix = "rules_python-1.0.0",
        url = "https://github.com/bazelbuild/rules_python/releases/download/1.0.0/rules_python-1.0.0.tar.gz",
    )

    maybe(
        http_archive,
        name = "net_zlib_zlib",
        build_file = "@seastar_bazel//third_party:zlib.BUILD",
        sha256 = "d14c38e313afc35a9a8760dadf26042f51ea0f5d154b0630a31da0540107fb98",
        strip_prefix = "zlib-1.2.13",
        urls = [
            "https://github.com/madler/zlib/releases/download/v1.2.13/zlib-1.2.13.tar.xz",
            "https://zlib.net/zlib-1.2.13.tar.xz",
        ],
    )

    maybe(
        http_archive,
        name = "com_github_facebook_zstd",
        build_file = "@seastar_bazel//third_party:zstd.BUILD",
        sha256 = "3b1c3b46e416d36931efd34663122d7f51b550c87f74de2d38249516fe7d8be5",
        strip_prefix = "zstd-1.5.6/lib",
        urls = ["https://github.com/facebook/zstd/archive/v1.5.6.zip"],
    )

    maybe(
        http_archive,
        name = "com_google_protobuf",
        sha256 = "da288bf1daa6c04d03a9051781caa52aceb9163586bff9aa6cfb12f69b9395aa",
        strip_prefix = "protobuf-27.0",
        url = "https://github.com/protocolbuffers/protobuf/releases/download/v27.0/protobuf-27.0.tar.gz",
    )

    maybe(
        http_archive,
        name = "com_github_nelhage_rules_boost",
        sha256 = "896d511f057cad281e93103be6ccf3f31ce1b66322ea7fe733232651d16b1cdb",
        strip_prefix = "rules_boost-63a91c1464eaf1b918a5df4cf3ffaa9ca852ab11",
        url = "https://github.com/nelhage/rules_boost/archive/63a91c1464eaf1b918a5df4cf3ffaa9ca852ab11.tar.gz",
    )

    maybe(
        http_archive,
        name = "fmtlib",
        build_file = "@seastar_bazel//third_party:fmtlib.BUILD",
        sha256 = "5dea48d1fcddc3ec571ce2058e13910a0d4a6bab4cc09a809d8b1dd1c88ae6f2",
        strip_prefix = "fmt-9.1.0",
        urls = ["https://github.com/fmtlib/fmt/archive/9.1.0.tar.gz"],
    )

    maybe(
        http_archive,
        name = "cares_cares",
        build_file = "@seastar_bazel//third_party:cares.BUILD",
        sha256 = "5f02cc809aac3f6cc5edc1fac6c4423fd5616d7406ce47b904c24adf0ff2cd0f",
        strip_prefix = "c-ares-1.32.3",
        urls = [
            "https://github.com/c-ares/c-ares/releases/download/v1.32.3/c-ares-1.32.3.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "yaml-cpp",
        build_file = "@seastar_bazel//third_party:yaml-cpp.BUILD",
        sha256 = "43e6a9fcb146ad871515f0d0873947e5d497a1c9c60c58cb102a97b47208b7c3",
        strip_prefix = "yaml-cpp-yaml-cpp-0.7.0",
        urls = [
            "https://github.com/jbeder/yaml-cpp/archive/yaml-cpp-0.7.0.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "colm",
        build_file = "@seastar_bazel//third_party:colm.BUILD",
        sha256 = "4644956dd82bedf3795bb1a6fdf9ee8bdd33bd1e7769ef81ffdaa3da70c5a349",
        strip_prefix = "colm-0.13.0.6",
        urls = [
            "http://www.colm.net/files/colm/colm-0.13.0.6.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "ragel",
        build_file = "@seastar_bazel//third_party:ragel.BUILD",
        sha256 = "08bac6ff8ea9ee7bdd703373fe4d39274c87fecf7ae594774dfdc4f4dd4a5340",
        strip_prefix = "ragel-7.0.0.11",
        urls = [
            "http://www.colm.net/files/ragel/ragel-7.0.0.11.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "lz4",
        build_file = "@seastar_bazel//third_party:lz4.BUILD",
        sha256 = "658ba6191fa44c92280d4aa2c271b0f4fbc0e34d249578dd05e50e76d0e5efcc",
        strip_prefix = "lz4-1.9.2/lib",
        urls = [
            "https://github.com/lz4/lz4/archive/v1.9.2.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "sctp",
        build_file = "@seastar_bazel//third_party:sctp.BUILD",
        sha256 = "3e9ab5b3844a8b65fc8152633aafe85f406e6da463e53921583dfc4a443ff03a",
        strip_prefix = "lksctp-tools-1.0.18",
        urls = ["https://github.com/sctp/lksctp-tools/archive/v1.0.18.tar.gz"],
    )

    maybe(
        http_archive,
        name = "gmp",
        build_file = "@seastar_bazel//third_party:gmp.BUILD",
        sha256 = "5275bb04f4863a13516b2f39392ac5e272f5e1bb8057b18aec1c9b79d73d8fb2",
        strip_prefix = "gmp-6.1.2",
        urls = ["https://gmplib.org/download/gmp/gmp-6.1.2.tar.bz2"],
    )

    maybe(
        http_archive,
        name = "nettle",
        build_file = "@seastar_bazel//third_party:nettle.BUILD",
        sha256 = "b0fcdd7fc0cdea6e80dcf1dd85ba794af0d5b4a57e26397eee3bc193272d9132",
        strip_prefix = "nettle-3.10.1",
        urls = ["https://ftp.gnu.org/gnu/nettle/nettle-3.10.1.tar.gz"],
    )

    maybe(
        http_archive,
        name = "gnutls",
        build_file = "@seastar_bazel//third_party:gnutls.BUILD",
        sha256 = "ac4f020e583880b51380ed226e59033244bc536cad2623f2e26f5afa2939d8fb",
        strip_prefix = "gnutls-3.8.8",
        urls = ["https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.8.tar.xz"],
    )

    maybe(
        http_archive,
        name = "systemtap-sdt",
        build_file = "@seastar_bazel//third_party:systemtap-sdt.BUILD",
        sha256 = "0984ebe3162274988252ec35074021dc1e8420d87a8b35f437578562fce08781",
        strip_prefix = "systemtap-4.2",
        urls = [
            "https://mirrors.kernel.org/sourceware/systemtap/releases/systemtap-4.2.tar.gz",
            "https://sourceware.org/systemtap/ftp/releases/systemtap-4.2.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "uuid",
        build_file = "@seastar_bazel//third_party:uuid.BUILD",
        sha256 = "37ac05d82c6410d89bc05d43cee101fefc8fe6cf6090b3ce7a1409a6f35db606",
        strip_prefix = "util-linux-2.35.1",
        urls = ["https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.35/util-linux-2.35.1.tar.gz"],
    )

    maybe(
        http_archive,
        name = "xfs",
        build_file = "@seastar_bazel//third_party:xfs.BUILD",
        sha256 = "cfbb0b136799c48cb79435facd0969c5a60a587a458e2d16f9752771027efbec",
        strip_prefix = "xfsprogs-5.5.0",
        urls = ["https://mirrors.edge.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/xfsprogs-5.5.0.tar.xz"],
    )

    maybe(
        http_archive,
        name = "uring",
        build_file = "@seastar_bazel//third_party:uring.BUILD",
        sha256 = "456f5f882165630f0dc7b75e8fd53bd01a955d5d4720729b4323097e6e9f2a98",
        strip_prefix = "liburing-liburing-2.5",
        urls = [
            "https://github.com/axboe/liburing/archive/refs/tags/liburing-2.5.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "bazel_clang_tidy",
        integrity = "sha256-bVCXKTSdmB2f9EKUizJIm8mwRnAmbuFNXRgKtNkjgxM=",
        strip_prefix = "bazel_clang_tidy-0baa068ae3cdb5cc450e61afb4f9f43a2b329716",
        urls = [
            "https://github.com/crackcomm/bazel_clang_tidy/archive/0baa068ae3cdb5cc450e61afb4f9f43a2b329716.tar.gz",
        ],
    )

    native.bind(
        name = "numa",
        actual = "@seastar_bazel//third_party/numactl:numa",
    )

    native.bind(
        name = "valgrind",
        actual = "@seastar_bazel//third_party/valgrind",
    )
