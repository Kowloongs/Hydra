#
# Copyright (C) 2015 - 2029. Hydra Project.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mtools
PKG_VERSION:=4.0.39

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@GNU/$(PKG_NAME)
PKG_HASH:=397f1e2b7b7a2a270eb7970fa363e445f956926ec51e8170c3869da85b0987bd

HOST_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/host-build.mk

HOST_CONFIGURE_ARGS += --without-x

HOST_CONFIGURE_VARS += \
	ac_cv_header_iconv_h=no

define Host/Compile
	$(MAKE) -C $(HOST_BUILD_DIR) mcopy mmd
endef

define Host/Install
	$(INSTALL_BIN) $(HOST_BUILD_DIR)/mcopy $(STAGING_DIR_HOST)/bin/
	$(INSTALL_BIN) $(HOST_BUILD_DIR)/mmd $(STAGING_DIR_HOST)/bin/
endef

define Host/Clean
	rm -f $(STAGING_DIR_HOST)/bin/mcopy
	rm -f $(STAGING_DIR_HOST)/bin/mmd
endef

$(eval $(call HostBuild))
