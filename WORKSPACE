workspace(name = "seastar_bazel")

local_repository(
    name = "seastar_bazel_examples",
    path = "examples",
)

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

http_archive(
    name = "rules_foreign_cc",
    sha256 = "c7913eb3ce2e9fea0e1b2ba65c51114ea66a524d20d974f720a9baa5cbbb2ab3",
    strip_prefix = "rules_foreign_cc-0ed27c13b18f412e00e9122fc01327503d52579c",
    url = "https://github.com/bazelbuild/rules_foreign_cc/archive/0ed27c13b18f412e00e9122fc01327503d52579c.tar.gz",
)

load("@rules_foreign_cc//foreign_cc:repositories.bzl", "rules_foreign_cc_dependencies")

rules_foreign_cc_dependencies()

http_archive(
    name = "zlib",
    build_file = "//third_party:zlib.BUILD",
    sha256 = "d14c38e313afc35a9a8760dadf26042f51ea0f5d154b0630a31da0540107fb98",
    strip_prefix = "zlib-1.2.13",
    urls = [
        "https://github.com/madler/zlib/releases/download/v1.2.13/zlib-1.2.13.tar.xz",
        "https://zlib.net/zlib-1.2.13.tar.xz",
    ],
)

maybe(
    http_archive,
    name = "com_google_protobuf",
    sha256 = "cfcba2df10feec52a84208693937c17a4b5df7775e1635c1e3baffc487b24c9b",
    strip_prefix = "protobuf-3.9.2",
    urls = ["https://github.com/protocolbuffers/protobuf/archive/v3.9.2.zip"],
)

load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")

protobuf_deps()

# Boost
http_archive(
    name = "com_github_nelhage_rules_boost",
    sha256 = "896d511f057cad281e93103be6ccf3f31ce1b66322ea7fe733232651d16b1cdb",
    strip_prefix = "rules_boost-63a91c1464eaf1b918a5df4cf3ffaa9ca852ab11",
    url = "https://github.com/nelhage/rules_boost/archive/63a91c1464eaf1b918a5df4cf3ffaa9ca852ab11.tar.gz",
)

load("@com_github_nelhage_rules_boost//:boost/boost.bzl", "boost_deps")

boost_deps()

maybe(
    http_archive,
    name = "fmtlib",
    build_file = "//third_party:fmtlib.BUILD",
    sha256 = "3d794d3cf67633b34b2771eb9f073bde87e846e0d395d254df7b211ef1ec7346",
    strip_prefix = "fmt-8.1.1",
    urls = [
        "https://github.com/fmtlib/fmt/archive/8.1.1.tar.gz",
    ],
)

maybe(
    http_archive,
    name = "cares",
    build_file = "//third_party:cares.BUILD",
    sha256 = "7c48c57706a38691041920e705d2a04426ad9c68d40edd600685323f214b2d57",
    strip_prefix = "c-ares-cares-1_13_0",
    urls = [
        "https://github.com/c-ares/c-ares/archive/cares-1_13_0.tar.gz",
    ],
)

maybe(
    http_archive,
    name = "yaml-cpp",
    build_file = "//third_party:yaml-cpp.BUILD",
    sha256 = "77ea1b90b3718aa0c324207cb29418f5bced2354c2e483a9523d98c3460af1ed",
    strip_prefix = "yaml-cpp-yaml-cpp-0.6.3",
    urls = [
        "https://github.com/jbeder/yaml-cpp/archive/yaml-cpp-0.6.3.tar.gz",
    ],
)

maybe(
    http_archive,
    name = "colm",
    build_file = "//third_party:colm.BUILD",
    sha256 = "4644956dd82bedf3795bb1a6fdf9ee8bdd33bd1e7769ef81ffdaa3da70c5a349",
    strip_prefix = "colm-0.13.0.6",
    urls = [
        "http://www.colm.net/files/colm/colm-0.13.0.6.tar.gz",
    ],
)

maybe(
    http_archive,
    name = "ragel",
    build_file = "//third_party:ragel.BUILD",
    sha256 = "08bac6ff8ea9ee7bdd703373fe4d39274c87fecf7ae594774dfdc4f4dd4a5340",
    strip_prefix = "ragel-7.0.0.11",
    urls = [
        "http://www.colm.net/files/ragel/ragel-7.0.0.11.tar.gz",
    ],
)

maybe(
    http_archive,
    name = "cryptopp",
    build_file = "//third_party:cryptopp.BUILD",
    sha256 = "8f64cf09cf4f61d5d74bca53574b8cc9959186cc0f072a2e6597e4999d6ad5db",
    strip_prefix = "cryptopp-CRYPTOPP_8_5_0",
    urls = [
        "https://github.com/weidai11/cryptopp/archive/CRYPTOPP_8_5_0.tar.gz",
    ],
)

maybe(
    http_archive,
    name = "lz4",
    build_file = "//third_party:lz4.BUILD",
    sha256 = "658ba6191fa44c92280d4aa2c271b0f4fbc0e34d249578dd05e50e76d0e5efcc",
    strip_prefix = "lz4-1.9.2/lib",
    urls = [
        "https://github.com/lz4/lz4/archive/v1.9.2.tar.gz",
    ],
)

maybe(
    http_archive,
    name = "sctp",
    build_file = "//third_party:sctp.BUILD",
    sha256 = "3e9ab5b3844a8b65fc8152633aafe85f406e6da463e53921583dfc4a443ff03a",
    strip_prefix = "lksctp-tools-1.0.18",
    urls = ["https://github.com/sctp/lksctp-tools/archive/v1.0.18.tar.gz"],
)

maybe(
    http_archive,
    name = "gnutls",
    build_file = "//third_party:gnutls.BUILD",
    sha256 = "bfacf16e342949ffd977a9232556092c47164bd26e166736cf3459a870506c4b",
    strip_prefix = "gnutls-3.6.12",
    urls = ["https://mirrors.aliyun.com/macports/distfiles/gnutls/gnutls-3.6.12.tar.xz"],
)

maybe(
    http_archive,
    name = "systemtap-sdt",
    build_file = "//third_party:systemtap-sdt.BUILD",
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
    build_file = "//third_party:uuid.BUILD",
    sha256 = "37ac05d82c6410d89bc05d43cee101fefc8fe6cf6090b3ce7a1409a6f35db606",
    strip_prefix = "util-linux-2.35.1",
    urls = ["https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.35/util-linux-2.35.1.tar.gz"],
)

maybe(
    http_archive,
    name = "xfs",
    build_file = "//third_party:xfs.BUILD",
    sha256 = "cfbb0b136799c48cb79435facd0969c5a60a587a458e2d16f9752771027efbec",
    strip_prefix = "xfsprogs-5.5.0",
    urls = ["https://mirrors.edge.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/xfsprogs-5.5.0.tar.xz"],
)

maybe(
    http_archive,
    name = "seastar",
    build_file = "//third_party:seastar.BUILD",
    #patch_file = "//third_party:seastar.patch",
    #sha256 = "82044cd4f73edb38bbc47a139272753495449414364e67438e3c2cb3d4989f17",
    strip_prefix = "seastar-master",
    urls = [
        "https://github.com/scylladb/seastar/archive/master.tar.gz",
    ],
)

maybe(
    http_archive,
    name = "readerwriterqueue",
    build_file = "//third_party:readerwriterqueue.BUILD",
    sha256 = "67a761278457ab1f113086449c1938e501f272be7f0fd50be28887c1274fe580",
    strip_prefix = "readerwriterqueue-1.0.1",
    urls = [
        "https://github.com/cameron314/readerwriterqueue/archive/v1.0.1.tar.gz",
    ],
)
