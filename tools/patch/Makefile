#
# Copyright (C) 2015 - 2029. Hydra Project.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=patch
PKG_VERSION:=2.7.6
PKG_RELEASE:=7
PKG_CPE_ID:=cpe:/a:gnu:patch

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=@GNU/patch
PKG_HASH:=ac610bda97abe0d9f6b7c963255a11dcb196c25e337c61f94e4778d632f1d8fd

HOST_BUILD_PARALLEL := 1

include $(INCLUDE_DIR)/host-build.mk

HOSTCC := $(HOSTCC_NOCACHE)
HOSTCXX := $(HOSTCXX_NOCACHE)

$(eval $(call HostBuild))
