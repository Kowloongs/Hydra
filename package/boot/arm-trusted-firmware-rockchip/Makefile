#
# Copyright (C) 2015 - 2029. Hydra Project.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=arm-trusted-firmware-rockchip
PKG_VERSION:=2.9
PKG_RELEASE:=1

PKG_SOURCE:=atf-v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/asytumn/atf/releases/download/v$(PKG_VERSION)/atf-v$(PKG_VERSION).tar.gz?
PKG_HASH:=b0c723bdabc0bd68aaba2da9f7008932b9198a19a9fcbbfa511fcb64c34f5aee

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=license.md

PKG_MAINTAINER:=Ombres

MAKE_PATH:=$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/arm-trusted-firmware-rockchip
    SECTION:=boot
    CATEGORY:=Boot Loaders
    TITLE:=ARM Trusted Firmware for Rockchip
    DEPENDS:=@TARGET_rockchip_armv8
endef

define Build/Prepare
	$(TAR) -C $(PKG_BUILD_DIR) -xf $(DL_DIR)/$(PKG_SOURCE)
endef

define Build/Compile
endef

define Build/InstallDev
	$(INSTALL_DIR) -p $(STAGING_DIR_IMAGE)
	$(CP) $(PKG_BUILD_DIR)/rk*.elf $(STAGING_DIR_IMAGE)/
endef

define Package/arm-trusted-firmware-rockchip/install
endef

$(eval $(call BuildPackage,arm-trusted-firmware-rockchip))
