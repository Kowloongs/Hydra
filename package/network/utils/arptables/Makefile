#
# Copyright (C) 2015 - 2029. Hydra Project.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=arptables
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://git.netfilter.org/arptables
PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2015-05-20
PKG_SOURCE_VERSION:=f4ab8f63f11a72f14687a6646d04ae1bae3fa45f
PKG_MIRROR_HASH:=84bc660be4c9f70be91046acfd87785add930eceab7c543036058e1a9de2e9d9

PKG_LICENSE:=GPL-2.0

include $(INCLUDE_DIR)/package.mk

define Package/arptables-legacy
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Firewall
  TITLE:=ARP firewalling software
  DEPENDS:=+kmod-arptables
  URL:=https://git.netfilter.org/arptables/
  PROVIDES:=arptables
  ALTERNATIVES:=\
    200:/usr/sbin/arptables:/usr/sbin/arptables-legacy
endef

MAKE_FLAGS += \
	COPT_FLAGS="$(TARGET_CFLAGS) -D__OPTIMIZE__=1" \
	KERNEL_DIR="$(LINUX_DIR)"

define Package/arptables-legacy/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/arptables $(1)/usr/sbin/arptables-legacy
endef

$(eval $(call BuildPackage,arptables-legacy))
