LICENSE = "GPL-2.0-only & GPL-3.0-only & LGPL-2.0-only & LGPL-3.0-only"
LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
		    file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
		    file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
		    file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674"

SRC_URI = "git://${META_CHERI_GDB_REPO};protocol=${META_CHERI_GDB_PROTOCOL};branch=${META_CHERI_GDB_BRANCH} \
           file://0001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch \
           file://0002-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch \
           file://0003-Dont-disable-libreadline.a-when-using-disable-static.patch \
           file://0004-use-asm-sgidefs.h.patch \
           file://0005-Change-order-of-CFLAGS.patch \
           file://0006-Fix-invalid-sigprocmask-call.patch \
           file://0007-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
           file://0008-Add-fix-for-packages-that-are-not-compatible-with-C2.patch \
           file://0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch \
           "
#SRC_URI[sha256sum] = "14996f5f74c9f68f5a543fdc45bca7800207f91f92aeea6c2e791822c7c6d876"

PV = "17.1+git"
SRCREV = "${AUTOREV}"
S = "${WORKDIR}/git"

# Remove patch added by meta-clang. Only needed when building with glibc.
SRC_URI:remove = " \
    file://0001-gdb-Link-with-latomic-for-riscv-clang-alone.patch \
"
