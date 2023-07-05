#
# Copyright (C) 2015 - 2029. Hydra Project.
#

include $(TOPDIR)/rules.mk

ARCH:=mips
BOARD:=ath25
BOARDNAME:=Atheros AR231x/AR5312
FEATURES:=squashfs low_mem small_flash

KERNEL_PATCHVER:=5.10
KERNEL_TESTING_PATCHVER:=5.10

define Target/Description
	Build firmware images for Atheros SoC boards
endef

include $(INCLUDE_DIR)/target.mk

DEFAULT_PACKAGES += wpad-basic-wolfssl kmod-ath5k swconfig kmod-gpio-button-hotplug

$(eval $(call BuildTarget))
