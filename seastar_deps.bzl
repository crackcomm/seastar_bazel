load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("//:seastar_archive.bzl", "seastar_archive")

def seastar_deps():
    # keep-sorted start block=yes newline_separated=yes
    maybe(
        http_archive,
        name = "cares_cares",
        build_file = "@seastar_bazel//third_party:cares.BUILD",
        sha256 = "912dd7cc3b3e8a79c52fd7fb9c0f4ecf0aaa73e45efda880266a2d6e26b84ef5",
        strip_prefix = "c-ares-1.34.6",
        urls = [
            "https://github.com/c-ares/c-ares/releases/download/v1.34.6/c-ares-1.34.6.tar.gz",
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
        name = "gmp",
        build_file = "@seastar_bazel//third_party:gmp.BUILD",
        sha256 = "a3c2b80201b89e68616f4ad30bc66aee4927c3ce50e33929ca819d5c43538898",
        strip_prefix = "gmp-6.3.0",
        urls = ["https://gmplib.org/download/gmp/gmp-6.3.0.tar.xz"],
    )

    maybe(
        http_archive,
        name = "gnutls",
        build_file = "@seastar_bazel//third_party:gnutls.BUILD",
        sha256 = "91bd23c4a86ebc6152e81303d20cf6ceaeb97bc8f84266d0faec6e29f17baa20",
        strip_prefix = "gnutls-3.8.11",
        urls = ["https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.11.tar.xz"],
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
        name = "nettle",
        build_file = "@seastar_bazel//third_party:nettle.BUILD",
        sha256 = "0c0fa8fd49ef313a766a6374de8d549efc88007359e8f0bac67f012ed6f5fca7",
        strip_prefix = "nettle-nettle_3.10.2_release_20250626",
        urls = [
            "https://github.com/gnutls/nettle/archive/refs/tags/nettle_3.10.2_release_20250626.tar.gz",
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
        name = "sctp",
        build_file = "@seastar_bazel//third_party:sctp.BUILD",
        sha256 = "3e9ab5b3844a8b65fc8152633aafe85f406e6da463e53921583dfc4a443ff03a",
        strip_prefix = "lksctp-tools-1.0.18",
        urls = ["https://github.com/sctp/lksctp-tools/archive/v1.0.18.tar.gz"],
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

    # keep-sorted end

def _non_module_dependencies_impl(_ctx):
    seastar_deps()
    seastar_archive()

non_module_dependencies = module_extension(
    implementation = _non_module_dependencies_impl,
)
