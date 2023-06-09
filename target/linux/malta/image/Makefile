#
# Copyright (C) 2015 - 2029. Hydra Project.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/image.mk

define CompressLzma
  $(STAGING_DIR_HOST)/bin/lzma e $(1) -lc1 -lp2 -pb2 $(2)
endef

define CompressGzip
	gzip -9n -c $(1) > $(2)
endef

define MkuImage
	mkimage -A mips -O linux -T kernel -a 0x80100000 -C $(1) $(2) \
		-e 0x80100000 -n 'MIPS Hydra Linux-$(LINUX_VERSION)' \
		-d $(3) $(4)
endef

define Image/Prepare
	$(call CompressLzma,$(KDIR)/vmlinux,$(KDIR)/vmlinux.bin.lzma)
	$(call MkuImage,lzma,,$(KDIR)/vmlinux.bin.lzma,$(KDIR)/uImage.lzma)
	$(call CompressGzip,$(KDIR)/vmlinux,$(KDIR)/vmlinux.bin.gz)
	$(call MkuImage,gzip,,$(KDIR)/vmlinux.bin.gz,$(KDIR)/uImage.gz)
endef

define Image/BuildKernel
	cp $(KDIR)/vmlinux.elf $(BIN_DIR)/$(IMG_PREFIX)-vmlinux.elf
	cp $(KDIR)/uImage.lzma $(BIN_DIR)/$(IMG_PREFIX)-uImage-lzma
	cp $(KDIR)/uImage.gz $(BIN_DIR)/$(IMG_PREFIX)-uImage-gzip
endef

define Image/Build/Initramfs
	cp $(KDIR)/vmlinux-initramfs.elf $(BIN_DIR)/$(IMG_PREFIX)-vmlinux-initramfs.elf
	cp $(KDIR)/vmlinux-initramfs $(BIN_DIR)/$(IMG_PREFIX)-vmlinux-initramfs.bin
endef

define Image/Build/gzip
	gzip -f9n $(BIN_DIR)/$(IMG_ROOTFS)-$(1).img
endef

$(eval $(call Image/gzip-ext4-padded-squashfs))

define Image/Build
	$(call Image/Build/$(1))
	$(CP) $(KDIR)/root.$(1) $(BIN_DIR)/$(IMG_ROOTFS)-$(1).img
	$(call Image/Build/gzip/$(1))
endef

$(eval $(call BuildImage))
