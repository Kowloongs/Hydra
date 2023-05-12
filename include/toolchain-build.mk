#
# Copyright (C) 2015 - 2029. Hydra Project.
#

override CONFIG_AUTOREBUILD=
override CONFIG_AUTOREMOVE=

HOST_BUILD_PREFIX:=$(TOOLCHAIN_DIR)
BUILD_DIR_HOST:=$(BUILD_DIR_TOOLCHAIN)

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/hardening.mk

HOST_STAMP_PREPARED=$(HOST_BUILD_DIR)/.prepared

define FixupLibdir
	if [ -d $(1)/lib64 -a \! -L $(1)/lib64 ]; then \
		mkdir -p $(1)/lib; \
		mv $(1)/lib64/* $(1)/lib/; \
		rm -rf $(1)/lib64; \
	fi
	ln -sf lib $(1)/lib64
endef
