#
# Copyright (C) 2015 - 2029. Hydra Project.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mkimage
PKG_VERSION:=2022.01

PKG_SOURCE:=u-boot-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:= \
	https://mirror.cyberbits.eu/u-boot \
	https://ftp.denx.de/pub/u-boot \
	ftp://ftp.denx.de/pub/u-boot
PKG_HASH:=81b4543227db228c03f8a1bf5ddbc813b0bb8f6555ce46064ef721a6fc680413

HOST_BUILD_DIR:=$(BUILD_DIR_HOST)/u-boot-$(PKG_VERSION)

include $(INCLUDE_DIR)/host-build.mk

define Host/Compile
	$(MAKE) -C $(HOST_BUILD_DIR) \
		HOSTCFLAGS="$(HOST_CFLAGS)" \
		HOSTLDFLAGS="$(HOST_LDFLAGS)" \
		PKG_CONFIG_EXTRAARGS="--static" \
		V=$(if $(findstring c,$(HYDRA_VERBOSE)),1) \
		NO_SDL=1 \
		tools-only_config \
		tools-only
endef

define Host/Install
	$(CP) $(HOST_BUILD_DIR)/tools/mkimage $(STAGING_DIR_HOST)/bin/
	$(CP) $(HOST_BUILD_DIR)/tools/mkenvimage $(STAGING_DIR_HOST)/bin/
endef

define Host/Clean
	rm -f $(STAGING_DIR_HOST)/bin/mkimage
	rm -f $(STAGING_DIR_HOST)/bin/mkenvimage
endef

$(eval $(call HostBuild))
