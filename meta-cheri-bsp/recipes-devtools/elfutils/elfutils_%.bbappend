FILESEXTRAPATHS:prepend := "${THISDIR}/elfutils:"
SRC_URI:append = " \
    file://cheri-fixes.patch \
    file://elfutils-Fix-alignment-issues-to-make-it-compile.patch \
    file://Avoid_overriding_libcxx_system_header.patch \
    file://config_Adjust_AM_CPPFLAGS_for_srcdir.patch \
"

EXTRA_OECONF += "--disable-demangler"

PACKAGECONFIG:remove = "python"
DEPENDS:remove = "lttng-ust"
TOOLCHAIN = "clang"
