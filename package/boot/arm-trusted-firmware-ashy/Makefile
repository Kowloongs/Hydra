#
# Copyright (C) 2015 - 2029. Hydra Project.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=arm-trusted-firmware-ashy
PKG_VERSION:=1.1
PKG_RELEASE:=$(AUTORELEASE)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL=https://github.com/rockchip-linux/rkbin.git
PKG_SOURCE_DATE:=2022-08-01
PKG_SOURCE_VERSION:=b0c100f1a260d807df450019774993c761beb79d
PKG_MIRROR_HASH:=17723ac8f6ec446c759444ee29ba4fe544cebb3785e26d8e10c91c54b9df3f1a

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=license.md

PKG_MAINTAINER:=Ombres

MAKE_PATH:=$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/arm-trusted-firmware-ashy
    SECTION:=boot
    CATEGORY:=Boot Loaders
    TITLE:=ARM Trusted Firmware for Ashy
    DEPENDS:=@TARGET_rockchip_armv8
    VARIANT:=rk3568
endef

define Build/Configure
	$(SED) 's,$$$$(PKG_BUILD_DIR),$(PKG_BUILD_DIR),g' $(PKG_BUILD_DIR)/trust.ini
	$(SED) 's,$$$$(VARIANT),$(BUILD_VARIANT),g' $(PKG_BUILD_DIR)/trust.ini
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(CURDIR)/pre-firmware.sh build $(BUILD_VARIANT) $(PKG_BUILD_DIR)
endef

define Build/InstallDev
	$(INSTALL_DIR) -p $(STAGING_DIR_IMAGE)
	$(CURDIR)/pre-firmware.sh install $(BUILD_VARIANT) $(PKG_BUILD_DIR) $(STAGING_DIR_IMAGE)
	$(CP) ./files/bin/rk35/* $(STAGING_DIR_IMAGE)
endef

define Package/arm-trusted-firmware-ashy/install
endef

$(eval $(call BuildPackage,arm-trusted-firmware-ashy))
