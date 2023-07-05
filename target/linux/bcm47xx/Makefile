#
# Copyright (C) 2015 - 2029. Hydra Project.
#

include $(TOPDIR)/rules.mk

ARCH:=mipsel
BOARD:=bcm47xx
BOARDNAME:=Broadcom BCM47xx/53xx (MIPS)
FEATURES:=squashfs usb
SUBTARGETS:=generic mips74k legacy

KERNEL_PATCHVER:=5.10

define Target/Description
	Build firmware images for Broadcom based BCM47xx/53xx routers with MIPS CPU, *not* ARM.
endef

include $(INCLUDE_DIR)/target.mk

DEFAULT_PACKAGES += swconfig nvram otrx \
	kmod-leds-gpio kmod-gpio-button-hotplug

$(eval $(call BuildTarget))
