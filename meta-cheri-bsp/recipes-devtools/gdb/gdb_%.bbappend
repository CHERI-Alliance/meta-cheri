PACKAGECONFIG:remove = "python"
DEPENDS:remove = "lttng-ust"
TOOLCHAIN = "clang"

EXTRA_OECONF += "--without-debuginfod"
DEPENDS:remove = "elfutils"
PACKAGECONFIG:remove = "debuginfod"
