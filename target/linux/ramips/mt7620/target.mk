#
# Copyright (C) 2015 - 2029. Hydra Project.
#

SUBTARGET:=mt7620
BOARDNAME:=MT7620 based boards
FEATURES+=usb ramdisk
CPU_TYPE:=24kc

DEFAULT_PACKAGES += kmod-rt2800-soc wpad-basic-wolfssl swconfig

define Target/Description
	Build firmware images for Ralink MT7620 based boards.
endef

