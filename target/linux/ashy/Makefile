#
# Copyright (C) 2015 - 2029. Hydra Project.
#

include $(TOPDIR)/rules.mk

BOARD:=ashy
BOARDNAME:=Ashy
FEATURES:=ext4 audio usb usbgadget display gpio fpu pci pcie rootfs-part boot-part squashfs
SUBTARGETS:=armv8

KERNEL_PATCHVER=5.10

define Target/Description
	Build firmware image for Ashy SoC devices.
endef

include $(INCLUDE_DIR)/target.mk

DEFAULT_PACKAGES += uboot-envtools partx-utils e2fsprogs mkf2fs kmod-gpio-button-hotplug \
		    automount autocore-arm autosamba fdisk cfdisk e2fsprogs ethtool haveged htop

KERNELNAME:=Image dtbs

$(eval $(call BuildTarget))
