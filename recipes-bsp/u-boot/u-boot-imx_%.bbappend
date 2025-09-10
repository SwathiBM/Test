FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
SRC_URI:append:celeritas = " \
                           file://0001-Adding-support-for-Celeritas-SOM.patch \
                           file://0002-Disabling-USB-Type-C-driver.patch \
                           file://0003-Correcting-Device-tree-name-for-Celeritas-SOM.patch \
                           file://0004-Modifiying-Uboot-to-take-celeritas-uboot-dts.patch \
                           file://0005-Avoid-tring-to-load-boot.scr.patch \
                           file://0006-Changing-rpmsg-dtb-file-name.patch "

SRC_URI:append:agility = " \
                           file://0007-added-support-for-agility-som.patch "

do_configure[postfuncs] += "create_source_date_epoch_stamp"

PATCHTOOL = "git"
