#
# Copyright (C) 2015 - 2029. Hydra Project.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/target.mk

PKG_NAME:=ccache
PKG_VERSION:=4.6.3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://github.com/ccache/ccache/releases/download/v$(PKG_VERSION)
PKG_HASH:=1e3a251bb112632553b8255a78661fe526c3a16598496d51128c32b218fd8b22

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/cmake.mk

CMAKE_HOST_OPTIONS += \
	-DCMAKE_C_COMPILER_LAUNCHER="" \
	-DCMAKE_CXX_COMPILER_LAUNCHER="" \
	-DCMAKE_SKIP_RPATH=FALSE \
	-DCMAKE_INSTALL_RPATH="${STAGING_DIR_HOST}/lib" \
	-DREDIS_STORAGE_BACKEND=OFF

ifneq (docs-$(CONFIG_BUILD_DOCUMENTATION),docs-y)
CMAKE_HOST_OPTIONS += -DENABLE_DOCUMENTATION=OFF
endif

define Host/Install/ccache
	$(INSTALL_DIR) $(STAGING_DIR_HOST)/bin/
	$(CP) ./files/* $(STAGING_DIR_HOST)/bin/
endef

define Host/Install
	$(call Host/Install/Default)
	$(call Host/Install/ccache)
endef

$(eval $(call HostBuild))
