#
# Copyright (C) 2015 - 2029. Hydra Project.
#

include $(TOPDIR)/rules.mk

ARCH:=arm
BOARD:=omap
BOARDNAME:=TI OMAP3/4/AM33xx
FEATURES:=usb usbgadget ext4 targz fpu audio display nand rootfs-part squashfs
CPU_TYPE:=cortex-a8
CPU_SUBTYPE:=vfpv3

KERNEL_PATCHVER:=5.10

KERNELNAME:=zImage dtbs

define Target/Description
	TI OMAP boards
endef

include $(INCLUDE_DIR)/target.mk

DEFAULT_PACKAGES += partx-utils mkf2fs e2fsprogs

$(eval $(call BuildTarget))
