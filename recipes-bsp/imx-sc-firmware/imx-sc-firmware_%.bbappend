FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
SC_FIRMWARE_NAME:celeritas = "mx8qx-celeritas-scfw-tcm.bin"
SC_FIRMWARE_NAME:agility = "mx8qx-agility-scfw-tcm.bin"

SC_MX_FAMILY ?= "INVALID"
SC_MX8_FAMILY:celeritas = "qx"
SC_MX8_FAMILY:agility = "qx"

SC_MACHINE_NAME:celeritas = "mx8${SC_MX8_FAMILY}_b0"
SC_MACHINE_NAME:agility = "mx8${SC_MX8_FAMILY}_b0"

SC_BOARD_NAME:celeritas = "celeritas"
SC_BOARD_NAME:agility = "agility"

SRC_URI += " \
           file://scfw_export_${SC_MACHINE_NAME} \
           https://developer.arm.com/-/media/Files/downloads/gnu-rm/8-2018q4/gcc-arm-none-eabi-8-2018-q4-major-linux.tar.bz2;name=gcc-arm-none-eabi \
"

SRC_URI[gcc-arm-none-eabi.md5sum] = "f55f90d483ddb3bcf4dae5882c2094cd"
SRC_URI[gcc-arm-none-eabi.sha256sum] = "fb31fbdfe08406ece43eef5df623c0b2deb8b53e405e2c878300f7a1f303ee52"

unset do_compile[noexec]

do_compile() {
    export TOOLS=${WORKDIR}
    cd ${WORKDIR}/scfw_export_${SC_MACHINE_NAME}/
    oe_runmake clean-${SC_MX8_FAMILY}
    oe_runmake ${SC_MX8_FAMILY} R=B0 B=${SC_BOARD_NAME} DL=5 M=1 V=1
    cp ${WORKDIR}/scfw_export_${SC_MACHINE_NAME}/build_${SC_MACHINE_NAME}/scfw_tcm.bin ${S}/${SC_FIRMWARE_NAME}
}

