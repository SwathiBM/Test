FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:agility = " \
                           file://0001-added-usb-hub-support.patch "

do_configure[postfuncs] += "create_source_date_epoch_stamp"

PATCHTOOL = "git"
