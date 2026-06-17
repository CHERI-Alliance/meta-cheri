ERROR_QA:remove = "version-going-backwards"
SRCREV = "669eba10526ea9fd2f0442e0bb9aab433f3fb59a"

SRC_URI = " \
    git://${META_CHERI_OPENSBI_REPO};protocol=${META_CHERI_OPENSBI_PROTOCOL};branch=${META_CHERI_OPENSBI_BRANCH} \
"

PV = "1.7+git${SRCPV}"

python () {
  import re
  cc=d.getVar("CC")
  def translate_arg(cc_arg, new_var):
    r = re.search(r'%s=(\w*)' % cc_arg, cc)
    if r :
      return new_var + "=" + r.group(1)
    return ""
  d.setVar("RISCV_VARS", translate_arg("-mabi", "PLATFORM_RISCV_ABI") + " " + translate_arg("-march", "PLATFORM_RISCV_ISA"))
}

EXTRA_OEMAKE:append = " ${RISCV_VARS}"
# TODO: Remove explicitly `CC_SUPPORT_VECTOR=n` when CHERI compiler supports 
#       vector externsion for CHERI
EXTRA_OEMAKE:append:cheri = " CC_SUPPORT_VECTOR=n"

EXTRA_OEMAKE:append:qemuriscv64cheri = " FW_TEXT_START=0x80000000"

COMPATIBLE_MACHINE:cva6cheri = "^(cva6cheri)"
