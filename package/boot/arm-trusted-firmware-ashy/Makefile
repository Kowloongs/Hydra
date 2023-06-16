#
# Copyright (C) 2015 - 2029. Hydra Project.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=arm-trusted-firmware-ashy
PKG_VERSION:=2.4
PKG_RELEASE:=$(AUTORELEASE)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL=https://github.com/rockchip-linux/rkbin.git
PKG_SOURCE_DATE:=2023-05-19
PKG_SOURCE_VERSION:=d6ccfe401ca84a98ca3b85c12b9554a1a43a166c
PKG_MIRROR_HASH:=1b9faa5479eebde5dd189f51c766d4ba5cbbf058cd9b7020ab27144efeea880b

PKG_MAINTAINER:=Ombres

MAKE_PATH:=$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/arm-trusted-firmware-ashy
    SECTION:=boot
    CATEGORY:=Boot Loaders
    TITLE:=ARM Trusted Firmware for Ashy
    DEPENDS:=@TARGET_ashy_armv8
    VARIANT:=rk3568
endef

define Build/Configure
	$(SED) 's,$$$$(PKG_BUILD_DIR),$(PKG_BUILD_DIR),g' $(PKG_BUILD_DIR)/trust.ini
	$(SED) 's,$$$$(VARIANT),$(BUILD_VARIANT),g' $(PKG_BUILD_DIR)/trust.ini
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(CURDIR)/pre-atf.sh build $(BUILD_VARIANT) $(PKG_BUILD_DIR)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(STAGING_DIR_IMAGE)
	$(CURDIR)/pre-atf.sh install $(BUILD_VARIANT) $(PKG_BUILD_DIR) $(STAGING_DIR_IMAGE)
	$(CP) ./files/bin/rk35/* $(STAGING_DIR_IMAGE)
endef


define Package/arm-trusted-firmware-ashy/install
endef

$(eval $(call BuildPackage,arm-trusted-firmware-ashy))
