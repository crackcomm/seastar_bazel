load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def seastar_deps():
    maybe(
        http_archive,
        name = "rules_foreign_cc",
        sha256 = "c7913eb3ce2e9fea0e1b2ba65c51114ea66a524d20d974f720a9baa5cbbb2ab3",
        strip_prefix = "rules_foreign_cc-0ed27c13b18f412e00e9122fc01327503d52579c",
        url = "https://github.com/bazelbuild/rules_foreign_cc/archive/0ed27c13b18f412e00e9122fc01327503d52579c.tar.gz",
    )

    maybe(
        http_archive,
        name = "zlib",
        build_file = "@seastar_bazel//:third_party/zlib.BUILD",
        sha256 = "d14c38e313afc35a9a8760dadf26042f51ea0f5d154b0630a31da0540107fb98",
        strip_prefix = "zlib-1.2.13",
        urls = [
            "https://github.com/madler/zlib/releases/download/v1.2.13/zlib-1.2.13.tar.xz",
            "https://zlib.net/zlib-1.2.13.tar.xz",
        ],
    )

    maybe(
        http_archive,
        name = "zstd",
        build_file = "@seastar_bazel//:third_party/zstd.BUILD",
        sha256 = "3b1c3b46e416d36931efd34663122d7f51b550c87f74de2d38249516fe7d8be5",
        strip_prefix = "zstd-1.5.6/lib",
        urls = ["https://github.com/facebook/zstd/archive/v1.5.6.zip"],
    )

    maybe(
        http_archive,
        name = "com_google_protobuf",
        sha256 = "5babb8571f1cceafe0c18e13ddb3be556e87e12ceea3463d6b0d0064e6cc1ac3",
        strip_prefix = "protobuf-21.9",
        urls = ["https://github.com/protocolbuffers/protobuf/archive/v21.9.zip"],
    )

    maybe(
        http_archive,
        name = "com_github_nelhage_rules_boost",
        sha256 = "896d511f057cad281e93103be6ccf3f31ce1b66322ea7fe733232651d16b1cdb",
        strip_prefix = "rules_boost-63a91c1464eaf1b918a5df4cf3ffaa9ca852ab11",
        url = "https://github.com/nelhage/rules_boost/archive/63a91c1464eaf1b918a5df4cf3ffaa9ca852ab11.tar.gz",
        repo_mapping = {
            "@net_zlib_zlib": "@zlib",
        },
    )

    maybe(
        http_archive,
        name = "fmtlib",
        build_file = "@seastar_bazel//:third_party/fmtlib.BUILD",
        sha256 = "3d794d3cf67633b34b2771eb9f073bde87e846e0d395d254df7b211ef1ec7346",
        strip_prefix = "fmt-8.1.1",
        urls = [
            "https://github.com/fmtlib/fmt/archive/8.1.1.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "cares_cares",
        build_file = "@seastar_bazel//:third_party/cares.BUILD",
        sha256 = "7c48c57706a38691041920e705d2a04426ad9c68d40edd600685323f214b2d57",
        strip_prefix = "c-ares-cares-1_13_0",
        urls = [
            "https://github.com/c-ares/c-ares/archive/cares-1_13_0.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "yaml-cpp",
        build_file = "@seastar_bazel//:third_party/yaml-cpp.BUILD",
        sha256 = "43e6a9fcb146ad871515f0d0873947e5d497a1c9c60c58cb102a97b47208b7c3",
        strip_prefix = "yaml-cpp-yaml-cpp-0.7.0",
        urls = [
            "https://github.com/jbeder/yaml-cpp/archive/yaml-cpp-0.7.0.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "colm",
        build_file = "@seastar_bazel//:third_party/colm.BUILD",
        sha256 = "4644956dd82bedf3795bb1a6fdf9ee8bdd33bd1e7769ef81ffdaa3da70c5a349",
        strip_prefix = "colm-0.13.0.6",
        urls = [
            "http://www.colm.net/files/colm/colm-0.13.0.6.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "ragel",
        build_file = "@seastar_bazel//:third_party/ragel.BUILD",
        sha256 = "08bac6ff8ea9ee7bdd703373fe4d39274c87fecf7ae594774dfdc4f4dd4a5340",
        strip_prefix = "ragel-7.0.0.11",
        urls = [
            "http://www.colm.net/files/ragel/ragel-7.0.0.11.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "lz4",
        build_file = "@seastar_bazel//:third_party/lz4.BUILD",
        sha256 = "658ba6191fa44c92280d4aa2c271b0f4fbc0e34d249578dd05e50e76d0e5efcc",
        strip_prefix = "lz4-1.9.2/lib",
        urls = [
            "https://github.com/lz4/lz4/archive/v1.9.2.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "sctp",
        build_file = "@seastar_bazel//:third_party/sctp.BUILD",
        sha256 = "3e9ab5b3844a8b65fc8152633aafe85f406e6da463e53921583dfc4a443ff03a",
        strip_prefix = "lksctp-tools-1.0.18",
        urls = ["https://github.com/sctp/lksctp-tools/archive/v1.0.18.tar.gz"],
    )

    maybe(
        http_archive,
        name = "gmp",
        build_file = "@seastar_bazel//:third_party/gmp.BUILD",
        sha256 = "5275bb04f4863a13516b2f39392ac5e272f5e1bb8057b18aec1c9b79d73d8fb2",
        strip_prefix = "gmp-6.1.2",
        urls = ["https://gmplib.org/download/gmp/gmp-6.1.2.tar.bz2"],
    )

    maybe(
        http_archive,
        name = "nettle",
        build_file = "@seastar_bazel//:third_party/nettle.BUILD",
        sha256 = "661f5eb03f048a3b924c3a8ad2515d4068e40f67e774e8a26827658007e3bcf0",
        strip_prefix = "nettle-3.7.3",
        urls = ["https://ftp.gnu.org/gnu/nettle/nettle-3.7.3.tar.gz"],
    )

    maybe(
        http_archive,
        name = "gnutls",
        build_file = "@seastar_bazel//:third_party/gnutls.BUILD",
        sha256 = "b6e4e8bac3a950a3a1b7bdb0904979d4ab420a81e74de8636dd50b467d36f5a9",
        strip_prefix = "gnutls-3.7.10",
        urls = ["https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.10.tar.xz"],
    )

    maybe(
        http_archive,
        name = "systemtap-sdt",
        build_file = "@seastar_bazel//:third_party/systemtap-sdt.BUILD",
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
        build_file = "@seastar_bazel//:third_party/uuid.BUILD",
        sha256 = "37ac05d82c6410d89bc05d43cee101fefc8fe6cf6090b3ce7a1409a6f35db606",
        strip_prefix = "util-linux-2.35.1",
        urls = ["https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.35/util-linux-2.35.1.tar.gz"],
    )

    maybe(
        http_archive,
        name = "xfs",
        build_file = "@seastar_bazel//:third_party/xfs.BUILD",
        sha256 = "cfbb0b136799c48cb79435facd0969c5a60a587a458e2d16f9752771027efbec",
        strip_prefix = "xfsprogs-5.5.0",
        urls = ["https://mirrors.edge.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/xfsprogs-5.5.0.tar.xz"],
    )

    maybe(
        http_archive,
        name = "readerwriterqueue",
        build_file = "@seastar_bazel//:third_party/readerwriterqueue.BUILD",
        sha256 = "67a761278457ab1f113086449c1938e501f272be7f0fd50be28887c1274fe580",
        strip_prefix = "readerwriterqueue-1.0.1",
        urls = [
            "https://github.com/cameron314/readerwriterqueue/archive/v1.0.1.tar.gz",
        ],
    )
