#
# Copyright (C) 2015 - 2029. Hydra Project.
#

TOPDIR:=${CURDIR}
LC_ALL:=C
LANG:=C
SDK:=1
export TOPDIR LC_ALL LANG SDK

world:

DISTRO_PKG_CONFIG:=$(shell $(TOPDIR)/scripts/command_all.sh pkg-config | grep '/usr' | head -n 1)
export PATH:=$(TOPDIR)/staging_dir/host/bin:$(PATH)

ifneq ($(HYDRA_BUILD),1)
  override HYDRA_BUILD=1
  export HYDRA_BUILD

  empty:=
  space:= $(empty) $(empty)
  _SINGLE=export MAKEFLAGS=$(space);

  include $(TOPDIR)/include/debug.mk
  include $(TOPDIR)/include/depends.mk
  include $(TOPDIR)/include/toplevel.mk
else
  include rules.mk
  include $(INCLUDE_DIR)/depends.mk
  include $(INCLUDE_DIR)/subdir.mk
  include package/Makefile

$(package/stamp-compile): $(BUILD_DIR)/.prepared
$(BUILD_DIR)/.prepared: Makefile
	@mkdir -p $$(dirname $@)
	@touch $@

clean: FORCE
	git clean -f -d $(STAGING_DIR); true
	git clean -f -d $(BUILD_DIR); true
	git clean -f -d $(BIN_DIR); true

dirclean: clean
	git reset --hard HEAD
	git clean -f -d
	rm -rf feeds/

# check prerequisites before starting to build
prereq: $(package/stamp-prereq) ;

world: prepare $(package/stamp-compile) FORCE
	@$(MAKE) package/index

.PHONY: clean dirclean prereq prepare world

endif
