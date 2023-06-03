#
# Copyright (C) 2015 - 2029. Hydra Project.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=arm-trusted-firmware-ashy
PKG_VERSION:=2.3
PKG_RELEASE:=1

PKG_SOURCE:=atf-v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/atf-builds/atf/releases/download/v$(PKG_VERSION)/atf-v$(PKG_VERSION).tar.gz?
PKG_HASH:=bf352298743aed594cf2958dd588e06ab6713fc514bb6f809bf55a85a87134c1

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=license.md

PKG_MAINTAINER:=Ombres

MAKE_PATH:=$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/arm-trusted-firmware-ashy
    SECTION:=boot
    CATEGORY:=Boot Loaders
    TITLE:=ARM Trusted Firmware for Ashy
    DEPENDS:=@TARGET_ashy_armv8
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

define Package/arm-trusted-firmware-ashy/install
endef

$(eval $(call BuildPackage,arm-trusted-firmware-ashy))