FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:agility = " \
			file://0001-Added-support-for-Gigabit-ethernet.patch \
			file://0002-Add-support-for-usb-hub-2.0.patch \
			file://0003-Add-support-for-sd-card.patch \
			file://0004-added-support-for-i2c-gp-with-eeprom.patch \ 
			file://0005-Add-support-for-gpios.patch \
			file://0006-Added-support-for-rs485-interface.patch \
			file://0007-Added-support-for-10.1-LVDS-display.patch \
			"
do_configure[postfuncs] += "do_change_source_epoch"


python do_change_source_epoch() {
    source_date_epoch = oe.reproducible.get_source_date_epoch_from_youngest_file(d, d.getVar('S'))
    oe.reproducible.epochfile_write(source_date_epoch, d.getVar('SDE_FILE'), d)
}

PATCH_TOOL = "git"

