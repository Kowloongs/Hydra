#
# Copyright (C) 2015 - 2029. Hydra Project.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/target.mk

export TARGET_BUILD=1

prereq clean download prepare compile install oldconfig menuconfig nconfig xconfig update refresh: FORCE
	@+$(NO_TRACE_MAKE) -C $(firstword $(wildcard feeds/$(BOARD) $(BOARD))) $@
