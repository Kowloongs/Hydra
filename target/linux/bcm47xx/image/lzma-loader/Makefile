#
# Copyright (C) 2015 - 2029. Hydra Project.
#

include $(TOPDIR)/rules.mk

PKG_NAME := lzma-loader
PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

$(PKG_BUILD_DIR)/.prepared:
	mkdir $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
	touch $@

$(PKG_BUILD_DIR)/loader.gz: $(PKG_BUILD_DIR)/.prepared
	$(MAKE) -C $(PKG_BUILD_DIR) CC="$(TARGET_CC)" \
		LD="$(TARGET_CROSS)ld" CROSS_COMPILE="$(TARGET_CROSS)"

download: 
prepare: $(PKG_BUILD_DIR)/.prepared
compile: $(PKG_BUILD_DIR)/loader.gz
install:

ifneq ($(TARGET),)
install: compile
	$(CP) $(PKG_BUILD_DIR)/loader.gz $(PKG_BUILD_DIR)/loader.elf $(TARGET)/
endif

clean:
	rm -rf $(PKG_BUILD_DIR)
