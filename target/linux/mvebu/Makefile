#
# Copyright (C) 2015 - 2029. Hydra Project.
#

include $(TOPDIR)/rules.mk

BOARD:=mvebu
BOARDNAME:=Marvell EBU Armada
FEATURES:=fpu usb pci pcie gpio nand squashfs ramdisk boot-part rootfs-part legacy-sdcard targz
SUBTARGETS:=cortexa9 cortexa53 cortexa72

KERNEL_PATCHVER:=5.10

include $(INCLUDE_DIR)/target.mk

DEFAULT_PACKAGES += uboot-envtools kmod-gpio-button-hotplug

$(eval $(call BuildTarget))
