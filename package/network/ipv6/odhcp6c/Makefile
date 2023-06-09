#
# Copyright (C) 2015 - 2029. Hydra Project.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=odhcp6c
PKG_RELEASE:=18

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL=$(PROJECT_GIT)/project/odhcp6c.git
PKG_SOURCE_DATE:=2022-08-05
PKG_SOURCE_VERSION:=7d21e8d8ecd6d776f64b6928f62893c0f5c9747a
PKG_MIRROR_HASH:=6d918517de4ec47d83edddb6167bb52f08b2b696f336d5055a45290bb37ac4db
PKG_MAINTAINER:=Hans Dedecker <dedeckeh@gmail.com>
PKG_LICENSE:=GPL-2.0

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

CMAKE_OPTIONS += \
	-DUSE_LIBUBOX=on

ifneq ($(CONFIG_PACKAGE_odhcp6c_ext_cer_id),0)
  CMAKE_OPTIONS += -DEXT_CER_ID=$(CONFIG_PACKAGE_odhcp6c_ext_cer_id)
endif

define Package/odhcp6c
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Embedded DHCPv6-client for Hydra
  DEPENDS:=@IPV6 +libubox
endef

define Package/odhcp6c/config
  config PACKAGE_odhcp6c_ext_cer_id
    int "CER-ID Extension ID (0 = disabled)"
    depends on PACKAGE_odhcp6c
    default 0
endef

define Package/odhcp6c/conffiles
/etc/odhcp6c.user
/etc/odhcp6c.user.d/
endef

define Package/odhcp6c/install
	$(INSTALL_DIR) $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/odhcp6c $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/lib/netifd/proto
	$(INSTALL_BIN) ./files/dhcpv6.sh $(1)/lib/netifd/proto/dhcpv6.sh
	$(INSTALL_BIN) ./files/dhcpv6.script $(1)/lib/netifd/
	$(INSTALL_DIR) $(1)/etc/odhcp6c.user.d/
	$(INSTALL_CONF) ./files/odhcp6c.user $(1)/etc/
endef

$(eval $(call BuildPackage,odhcp6c))
