#
# Copyright (C) 2015 - 2029. Hydra Project.
#

include $(TOPDIR)/rules.mk

ARCH:=powerpc
BOARD:=mpc85xx
BOARDNAME:=Freescale MPC85xx
CPU_TYPE:=8540
FEATURES:=squashfs ramdisk nand
SUBTARGETS:=p1010 p1020 p2020

KERNEL_PATCHVER:=5.10

KERNELNAME:=zImage

include $(INCLUDE_DIR)/target.mk

DEFAULT_PACKAGES += \
	kmod-input-core kmod-input-gpio-keys kmod-button-hotplug \
	kmod-leds-gpio swconfig kmod-ath9k wpad-basic-wolfssl kmod-usb2 \
	uboot-envtools

$(eval $(call BuildTarget))
