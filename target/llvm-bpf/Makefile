#
# Copyright (C) 2015 - 2029. Hydra Project.
#

include $(TOPDIR)/rules.mk

override MAKEFLAGS=

LLVM_VERSION := $(shell cat $(STAGING_DIR_HOST)/llvm-bpf/.llvm-version)

LLVM_BPF_PREFIX := llvm-bpf-$(LLVM_VERSION).$(HOST_OS)-$(HOST_ARCH)
LLVM_TAR := $(BIN_DIR)/$(LLVM_BPF_PREFIX).tar.xz

$(LLVM_TAR): $(STAGING_DIR_HOST)/llvm-bpf/.llvm-version
	tar -C $(STAGING_DIR_HOST) \
		-I '$(STAGING_DIR_HOST)/bin/xz -7e -T$(if $(filter 1,$(NPROC)),2,0)' \
		$(if $(SOURCE_DATE_EPOCH),--mtime="@$(SOURCE_DATE_EPOCH)") \
		-cf $@.tmp llvm-bpf $(LLVM_BPF_PREFIX)
	mv $@.tmp $@

download:
prepare:
compile: $(LLVM_TAR)
install: compile

clean:
	rm -f $(LLVM_TAR)
