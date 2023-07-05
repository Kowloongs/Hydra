#
# Copyright (C) 2015 - 2029. Hydra Project.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ipip
PKG_RELEASE:=4
PKG_LICENSE:=GPL-2.0

include $(INCLUDE_DIR)/package.mk

define Package/ipip
  SECTION:=net
  CATEGORY:=Network
  MAINTAINER:=Hans Dedecker <dedeckeh@gmail.com>
  TITLE:=IP in IP Tunnel config support
  DEPENDS:= +kmod-ipip +resolveip
  PKGARCH:=all
endef

define Package/ipip/description
 IP in IP Tunnel config support in /etc/config/network.
endef

define Build/Compile
endef

define Build/Configure
endef

define Package/ipip/install
	$(INSTALL_DIR) $(1)/lib/netifd/proto
	$(INSTALL_BIN) ./files/ipip.sh $(1)/lib/netifd/proto/ipip.sh
endef

$(eval $(call BuildPackage,ipip))
