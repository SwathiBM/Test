FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:celeritas = " \
                           file://0001-Celeritas-SOM-Initial-Support.patch \
                           file://0002-Adding-suppport-for-Wifi.patch \
                           file://0003-Change-EMMC-timing-spec-to-DDR52.patch \
                           file://0004-Fixing-Issue-with-SPI-nor-AAI-mode.patch \
                           file://0005-Enabling-the-USB-in-dts.patch \
                           file://0006-Adding-Sysfs-Entry-for-GPIO.patch \
                           file://0007-Adding-celeritas-rpmsg-device-tree-in-linux.patch \
                           file://0008-Disable-AUD-MIX-since-it-is-not-used.patch \
                           file://0009-Increasing-reserved-memory-area-for-m4.patch \
			   "
SRC_URI:append:agility = " \
			file://0010-Adding-support-for-Agility-SoM.patch \
			file://0004-Fixing-Issue-with-SPI-nor-AAI-mode.patch \ 
			file://0011-Adding-Sysfs-Entry-for-GPIO-for-agility-SoM.patch \
			file://0012-Removed-wireless-configs-from-defconfig-file.patch \
			file://0013-Imporve-setup-time-of-spi-data-line-for-working-at-5.patch \
			"

do_configure[postfuncs] += "do_change_source_epoch"

python do_change_source_epoch() {
    source_date_epoch = oe.reproducible.get_source_date_epoch_from_youngest_file(d, d.getVar('S'))
    oe.reproducible.epochfile_write(source_date_epoch, d.getVar('SDE_FILE'), d)
}

PATCH_TOOL = "git"

