#
# Copyright (C) 2015 - 2029. Hydra Project.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=qos-scripts
PKG_VERSION:=1.3.1
PKG_RELEASE:=$(AUTORELEASE)
PKG_LICENSE:=GPL-2.0

PKG_MAINTAINER:=Felix Fietkau <nbd@nbd.name>

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/qos-scripts
  SECTION:=utils
  CATEGORY:=Base system
  DEPENDS:=+tc +kmod-sched-core +kmod-sched-connmark +kmod-ifb +iptables +iptables-mod-ipopt +iptables-mod-conntrack-extra
  TITLE:=QoS scripts
  PKGARCH:=all
endef

define Package/qos-scripts/description
 A set of scripts that abstract QoS configuration into a simple 
 configuration file supporting stanzas that specify any number of QoS 
 entries.
endef

define Package/qos-scripts/conffiles
/etc/config/qos
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/qos-scripts/install
	$(INSTALL_DIR) $(1)
	$(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,qos-scripts))
