#
# Copyright (C) 2015 - 2029. Hydra Project.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libiconv
PKG_RELEASE:=8

PKG_LICENSE:=LGPL-2.1
PKG_LICENSE_FILES:=LICENSE

PKG_MAINTAINER:=Jo-Philipp Wich <jo@mein.io>

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk

define Package/libiconv
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Tiny drop-in replacement for the GNU Character set conversion library
endef

define Build/Configure
endef

define Build/Compile
	$(TARGET_CC) $(TARGET_CFLAGS) -c $(PKG_BUILD_DIR)/iconv.c -o $(PKG_BUILD_DIR)/iconv.o -I$(PKG_BUILD_DIR)/include $(FPIC)
	$(TARGET_CROSS)ar rcs $(PKG_BUILD_DIR)/libiconv.a $(PKG_BUILD_DIR)/iconv.o
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib/libiconv-stub/lib
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/libiconv.a $(1)/usr/lib/libiconv-stub/lib/

	$(INSTALL_DIR) $(1)/usr/lib/libiconv-stub/include
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/include/iconv.h $(1)/usr/lib/libiconv-stub/include/

	$(INSTALL_DIR) $(1)/usr/share/aclocal
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/m4/* $(1)/usr/share/aclocal/
endef

define Package/libiconv/install
	$(INSTALL_DIR) $(1)/tmp
	touch $(1)/tmp/.libiconv-placeholder
endef

define Host/Prepare
	mkdir -p $(HOST_BUILD_DIR)
endef

define Host/Configure

endef

define Host/Compile
	$(HOSTCC) -c src/iconv.c -o $(HOST_BUILD_DIR)/iconv.o -Isrc/include -fPIC
	ar rcs $(HOST_BUILD_DIR)/libiconv.a $(HOST_BUILD_DIR)/iconv.o
endef

define Host/Install
	$(INSTALL_DIR) $(STAGING_DIR_HOSTPKG)/lib
	$(INSTALL_DATA) $(HOST_BUILD_DIR)/libiconv.a $(STAGING_DIR_HOSTPKG)/lib/

	$(INSTALL_DIR) $(STAGING_DIR_HOSTPKG)/include
	$(INSTALL_DATA) ./src/include/iconv.h $(STAGING_DIR_HOSTPKG)/include/

	$(INSTALL_DIR) $(STAGING_DIR_HOSTPKG)/share/aclocal
	$(INSTALL_DATA) ./src/m4/* $(STAGING_DIR_HOSTPKG)/share/aclocal/
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,libiconv))
