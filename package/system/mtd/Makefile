#
# Copyright (C) 2015 - 2029. Hydra Project.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=mtd
PKG_RELEASE:=26

PKG_BUILD_DIR := $(KERNEL_BUILD_DIR)/$(PKG_NAME)
STAMP_PREPARED := $(STAMP_PREPARED)_$(call confvar,CONFIG_MTD_REDBOOT_PARTS)

PKG_LICENSE:=GPL-2.0+
PKG_LICENSE_FILES:=

PKG_FLAGS:=nonshared

include $(INCLUDE_DIR)/package.mk

define Package/mtd
  SECTION:=utils
  CATEGORY:=Base system
  DEPENDS:=+libubox
  TITLE:=Update utility for trx firmware images
endef

define Package/mtd/description
 This package contains an utility useful to upgrade from other firmware or 
 older releases.
endef

target=$(firstword $(subst -, ,$(BOARD)))

MAKE_FLAGS += TARGET="$(target)"
TARGET_CFLAGS += -Dtarget_$(target)=1 -Wall -flto
TARGET_LDFLAGS += -flto=jobserver

ifdef CONFIG_MTD_REDBOOT_PARTS
  MAKE_FLAGS += FIS_SUPPORT=1
  TARGET_CFLAGS += -DFIS_SUPPORT=1
endif

define Package/mtd/install
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/mtd $(1)/sbin/
endef

$(eval $(call BuildPackage,mtd))
