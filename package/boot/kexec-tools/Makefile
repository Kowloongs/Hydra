#
# Copyright (C) 2015 - 2029. Hydra Project.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=kexec-tools
PKG_VERSION:=2.0.21
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=@KERNEL/linux/utils/kernel/kexec
PKG_HASH:=e113142dee891638ad96e0f72cf9277b244477619470b30c41999d312e8e8702

PKG_CONFIG_DEPENDS := CONFIG_KEXEC_ZLIB CONFIG_KEXEC_LZMA

include $(INCLUDE_DIR)/package.mk

define Package/kexec-tools/Default
  SECTION:=utils
  CATEGORY:=Utilities
  URL:=http://kernel.org/pub/linux/kernel/people/horms/kexec-tools/
endef

define Package/kexec-tools
  $(call Package/kexec-tools/Default)
  TITLE:=kexec-tools transition meta package
  DEPENDS:=+kexec
endef

define Package/kexec-tools/description
 kexec is a set of system calls that allows you to load
 another kernel from the currently executing Linux kernel.
 The kexec utility allows to load and boot another kernel.
endef

define Package/kexec
  $(call Package/kexec-tools/Default)
  TITLE:=Kernel boots kernel
  DEPENDS:=\
	@(armeb||arm||i386||x86_64||powerpc64||mipsel||mips) \
	+KEXEC_ZLIB:zlib @KERNEL_KEXEC
endef

define Package/kexec/description
 The kexec utility allows to load and boot another kernel.
endef

define Package/kexec/config
	source "$(SOURCE)/Config.in"
endef

KEXEC_TARGET_NAME:=$(ARCH)-linux-$(TARGET_SUFFIX)

CONFIGURE_ARGS = \
		--target=$(KEXEC_TARGET_NAME) \
		--host=$(REAL_GNU_TARGET_NAME) \
		--build=$(GNU_HOST_NAME) \
		--program-prefix="" \
		--program-suffix="" \
		--prefix=/usr \
		--exec-prefix=/usr \
		--bindir=/usr/bin \
		--sbindir=/usr/sbin \
		--libexecdir=/usr/lib \
		--sysconfdir=/etc \
		$(if $(CONFIG_KEXEC_ZLIB),--with,--without)-zlib \
		$(if $(CONFIG_KEXEC_LZMA),--with,--without)-lzma \
		TARGET_LD="$(TARGET_CROSS)ld"

TARGET_CFLAGS += -ffunction-sections -fdata-sections
TARGET_LDFLAGS += -Wl,--gc-sections

CONFIGURE_VARS += \
	BUILD_CC="$(HOSTCC)" \
	TARGET_CC="$(TARGET_CC)"

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)" all install
endef

define Package/kexec-tools/install
	:
endef

define Package/kexec/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/kexec $(1)/usr/sbin

# make a link for compatability with other distros
	$(INSTALL_DIR) $(1)/sbin
	$(LN) ../usr/sbin/kexec $(1)/sbin/kexec
endef

$(eval $(call BuildPackage,kexec-tools))
$(eval $(call BuildPackage,kexec))
