#
# Copyright (C) 2015 - 2029. Hydra Project.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=elfutils
PKG_VERSION:=0.186
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=https://sourceware.org/$(PKG_NAME)/ftp/$(PKG_VERSION)
PKG_HASH:=7f6fb9149b1673d38d9178a0d3e0fb8a1ec4f53a9f4c2ff89469609879641177

PKG_MAINTAINER:=Luiz Angelo Daros de Luca <luizluca@gmail.com>
PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=COPYING COPYING-GPLV2 COPYING-LGPLV3
PKG_CPE_ID:=cpe:/a:elfutils_project:elfutils

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1
PKG_USE_MIPS16:=1
PKG_BUILD_DEPENDS:=!USE_GLIBC:argp-standalone

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(INCLUDE_DIR)/host-build.mk

define Package/elfutils/Default
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=ELF manipulation libraries
  URL:=https://fedorahosted.org/elfutils/
  ABI_VERSION:=1
endef

define Package/libasm
  $(call Package/elfutils/Default)
  TITLE+= (libasm)
  DEPENDS:=+libelf +libdw
endef

define Package/libdw
  $(call Package/elfutils/Default)
  DEPENDS:=+libelf +libbz2 +USE_MUSL:musl-fts
  TITLE+= (libdw)
endef

define Package/libelf
  $(call Package/elfutils/Default)
  DEPENDS:=$(INTL_DEPENDS) +zlib
  TITLE+= (libelf)
  PROVIDES:=libelf1
endef

ifeq ($(CONFIG_BUILD_NLS),y)
TARGET_LDFLAGS += -lintl
else
CONFIGURE_ARGS += --disable-nls
endif

HOST_CONFIGURE_ARGS += \
	--disable-debuginfod \
	--disable-libdebuginfod \
	--without-lzma \
	--without-zstd

CONFIGURE_ARGS += \
	--program-prefix=eu- \
	--disable-debuginfod \
	--disable-libdebuginfod \
	--without-lzma \
	--without-zstd

HOST_CONFIGURE_VARS += \
	ac_cv_search__obstack_free=yes

CONFIGURE_VARS += \
	ac_cv_search__obstack_free=yes

TARGET_CFLAGS += -D_GNU_SOURCE -Wno-unused-result -Wno-format-nonliteral

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libasm*.{a,so*} $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libdw*.{a,so*} $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libelf*.{a,so*} $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libelf.pc $(1)/usr/lib/pkgconfig/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libdw.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libasm/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libasm{-*.so,*.so.*} $(1)/usr/lib/
endef

define Package/libdw/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libdw{-*.so,*.so.*} $(1)/usr/lib/
endef

define Package/libelf/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libelf{-*.so,*.so.*} $(1)/usr/lib/
endef

# these lines need to be ordered by dependency because of ABI versioning
$(eval $(call HostBuild))
$(eval $(call BuildPackage,libelf))
$(eval $(call BuildPackage,libdw))
$(eval $(call BuildPackage,libasm))
