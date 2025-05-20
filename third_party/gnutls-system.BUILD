HDR_FILES = [
    "gnutls/abstract.h",
    "gnutls/compat.h",
    "gnutls/crypto.h",
    "gnutls/dane.h",
    "gnutls/dtls.h",
    "gnutls/gnutls.h",
    "gnutls/gnutlsxx.h",
    "gnutls/ocsp.h",
    "gnutls/openpgp.h",
    "gnutls/pkcs11.h",
    "gnutls/pkcs12.h",
    "gnutls/pkcs7.h",
    "gnutls/self-test.h",
    "gnutls/socket.h",
    "gnutls/system-keys.h",
    "gnutls/tpm.h",
    "gnutls/urls.h",
    "gnutls/x509-ext.h",
    "gnutls/x509.h",
]

genrule(
    name = "gnutls_include",
    outs = ["gnutls_include/" + f for f in HDR_FILES],
    cmd = "mkdir -p $(@D)/gnutls_include/gnutls && " +
          " && ".join(["cp /usr/include/{} $(@D)/gnutls_include/{}".format(f, f) for f in HDR_FILES]),
    local = True,
    message = "Copying system GnuTLS headers from /usr/include",
    tags = ["no-remote-exec"],
)

genrule(
    name = "copy_libgnutls_so",
    outs = ["libgnutls.so"],
    cmd = "cp /usr/lib/libgnutls.so $(OUTS)",
    local = True,
    message = "Copying system GnuTLS shared library from /usr/lib",
    tags = ["no-remote-exec"],
)

genrule(
    name = "generate_dummy_cc",
    outs = ["dummy.cc"],
    cmd = "echo '// empty dummy' > $@",
)

cc_library(
    name = "gnutls_headers",
    srcs = [":generate_dummy_cc"],
    # srcs = ["dummy.cc"],  # required to re-generate the headers
    hdrs = [":gnutls_include"],
    includes = ["gnutls_include"],
)

cc_import(
    name = "gnutls",
    interface_library = ":libgnutls.so",
    system_provided = True,
    visibility = ["//visibility:public"],
    deps = [":gnutls_headers"],
)
