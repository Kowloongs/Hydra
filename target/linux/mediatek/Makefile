#
# Copyright (C) 2015 - 2029. Hydra Project.
#

include $(TOPDIR)/rules.mk

ARCH:=arm
BOARD:=mediatek
BOARDNAME:=MediaTek Ralink ARM
SUBTARGETS:=mt7622 mt7623 mt7629
FEATURES:=dt-overlay emmc fpu gpio nand pci pcie rootfs-part separate_ramdisk squashfs usb

KERNEL_PATCHVER:=5.10

include $(INCLUDE_DIR)/target.mk
DEFAULT_PACKAGES += \
	kmod-leds-gpio kmod-gpio-button-hotplug

$(eval $(call BuildTarget))
