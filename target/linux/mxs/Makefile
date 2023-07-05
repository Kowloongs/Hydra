#
# Copyright (C) 2015 - 2029. Hydra Project.
#

include $(TOPDIR)/rules.mk

ARCH:=arm
BOARD:=mxs
BOARDNAME:=Freescale i.MX23/i.MX28
FEATURES:=ext4 rtc usb gpio
CPU_TYPE:=arm926ej-s

KERNEL_PATCHVER:=5.10

KERNELNAME:=zImage dtbs

define Target/Description
	Support for Freescale i.MX23/i.MX28 boards
endef

include $(INCLUDE_DIR)/target.mk

$(eval $(call BuildTarget))
