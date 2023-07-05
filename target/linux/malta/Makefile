#
# Copyright (C) 2015 - 2029. Hydra Project.
#

include $(TOPDIR)/rules.mk

BOARD:=malta
BOARDNAME:=MIPS Malta CoreLV board (qemu)
SUBTARGETS:=le be le64 be64
INITRAMFS_EXTRA_FILES:=
FEATURES:=cpiogz ext4 ramdisk squashfs targz

KERNEL_PATCHVER:=5.10

include $(INCLUDE_DIR)/target.mk

DEFAULT_PACKAGES += wpad-basic-wolfssl kmod-mac80211-hwsim kmod-pcnet32 mkf2fs e2fsprogs

$(eval $(call BuildTarget))
