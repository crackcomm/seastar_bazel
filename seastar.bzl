load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")
load("@com_github_nelhage_rules_boost//:boost/boost.bzl", "boost_deps")
load("@rules_foreign_cc//foreign_cc:repositories.bzl", "rules_foreign_cc_dependencies")
load("@seastar_bazel//:seastar_archive.bzl", "seastar_archive")

def seastar():
    protobuf_deps()
    boost_deps()
    rules_foreign_cc_dependencies()
    seastar_archive()
