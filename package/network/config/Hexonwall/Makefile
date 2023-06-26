#
# Copyright (C) 2015 - 2029. Hydra Project.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=Hexonwall
PKG_RELEASE:=$(AUTORELEASE)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL=https://github.com/Kowloongs/Hexonwall.git
PKG_SOURCE_DATE:=2023-04-23
PKG_SOURCE_VERSION:=c8bb3568b47e5190d6eafc4151d1f0e9c31c3d1d
PKG_MIRROR_HASH:=skip
PKG_MAINTAINER:=Carlyon W. Tung <loongs@syuusui.com>
PKG_LICENSE:=Ombres

include $(INCLUDE_DIR)/package.mk

define Package/Hexonwall
  SECTION:=net
  CATEGORY:=Base system
  TITLE:=The Sixth Generation Firewall
  DEPENDS:= \
	+kmod-nft-core +kmod-nft-fib +kmod-nft-offload \
	+kmod-nft-nat \
	+nftables-json \
	+ucode +ucode-mod-fs +ucode-mod-ubus +ucode-mod-uci
  EXTRA_DEPENDS:=ucode (>= 2022-03-22)
  PROVIDES:=uci-firewall
endef

define Package/Hexonwall/description
 This package provides an nftables-based implementation of the UCI firewall
 sharing the same configuration format.
endef

define Package/Hexonwall/conffiles
/etc/config/firewall
/etc/nftables.d/
endef

define Package/Hexonwall/install
	$(CP) -a $(PKG_BUILD_DIR)/root/* $(1)/
endef

define Build/Compile
endef

$(eval $(call BuildPackage,Hexonwall))
