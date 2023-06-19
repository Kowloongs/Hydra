#
# Copyright (C) 2015 - 2029. Hydra Project.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=arm-trusted-firmware-ashy
PKG_VERSION:=2.1
PKG_RELEASE:=$(AUTORELEASE)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL=https://github.com/rockchip-linux/rkbin.git
PKG_SOURCE_DATE:=2023-05-19
PKG_SOURCE_VERSION:=d6ccfe401ca84a98ca3b85c12b9554a1a43a166c
PKG_MIRROR_HASH:=75eac9f0bdf10808d7e230c3d995b18cd1f701be5e9770b4ef17e9af885d706a

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
	$(CP) $(PKG_BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)/bin/rk35/* $(STAGING_DIR_IMAGE)/
endef

define Package/arm-trusted-firmware-ashy/install
endef

$(eval $(call BuildPackage,arm-trusted-firmware-ashy))
