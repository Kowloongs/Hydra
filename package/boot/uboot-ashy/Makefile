#
# Copyright (C) 2015 - 2029. Hydra Project.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_VERSION:=9.5.1
PKG_RELEASE:=$(AUTORELEASE)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL=https://github.com/Kowloongs/Bifrost.git
PKG_SOURCE_DATE:=2023-07-15
PKG_SOURCE_VERSION:=44320375ad0b9bc022cbb823831455d1088d616f
PKG_MIRROR_HASH:=3252285a342a320b0233b49edf067479c43048ba44ee258e2c069d1e145e38c5

PKG_MAINTAINER:=Ombres

include $(INCLUDE_DIR)/u-boot.mk
include $(INCLUDE_DIR)/package.mk

define U-Boot/Default
  BUILD_TARGET:=ashy
  UENV:=default
  HIDDEN:=1
endef

# Hexonisg Boards

define U-Boot/monopi-r5s-rk3568
  BUILD_SUBTARGET:=armv8
  NAME:=Ombres MonoPi R5S
  BUILD_DEVICES:= \
    ombres_monopi-r5s
  DEPENDS:=+PACKAGE_u-boot-monopi-r5s-rk3568:arm-trusted-firmware-ashy
  PKG_BUILD_DEPENDS:=arm-trusted-firmware-ashy
  ATF:=rk3568_bl31_v1.42.elf
  DDR:=rk3568_ddr_1560MHz_v1.16.bin
endef

UBOOT_TARGETS := \
  monopi-r5s-rk3568

UBOOT_CONFIGURE_VARS += USE_PRIVATE_LIBGCC=yes

UBOOT_MAKE_FLAGS += \
  BL31=$(STAGING_DIR_IMAGE)/$(ATF) \
  RK_TPL_BIN=$(STAGING_DIR_IMAGE)/$(TPL) \

define Build/Configure
	$(call Build/Configure/U-Boot)

	$(SED) 's#CONFIG_MKIMAGE_DTC_PATH=.*#CONFIG_MKIMAGE_DTC_PATH="$(PKG_BUILD_DIR)/scripts/dtc/dtc"#g' $(PKG_BUILD_DIR)/.config
	echo 'CONFIG_IDENT_STRING=" Hydra"' >> $(PKG_BUILD_DIR)/.config
	
ifneq ($(DDR),)
	$(CP) $(STAGING_DIR_IMAGE)/$(DDR) $(PKG_BUILD_DIR)/ram_init.bin
endif
endef

define Build/Compile
	$(call Build/Compile/U-Boot)
endef

define Build/InstallDev
	$(INSTALL_DIR) -p $(STAGING_DIR_IMAGE)
	
ifneq ($(USE_RKBIN),)
	$(STAGING_DIR_IMAGE)/loaderimage --pack --uboot $(PKG_BUILD_DIR)/u-boot-dtb.bin $(PKG_BUILD_DIR)/uboot.img 0x200000
	$(CP) $(PKG_BUILD_DIR)/uboot.img $(STAGING_DIR_IMAGE)/$(BUILD_VARIANT)-uboot.img
else
	$(CP) $(PKG_BUILD_DIR)/idbloader.img $(STAGING_DIR_IMAGE)/$(BUILD_VARIANT)-idbloader.img
	$(CP) $(PKG_BUILD_DIR)/u-boot.itb $(STAGING_DIR_IMAGE)/$(BUILD_VARIANT)-u-boot.itb
endif

ifneq ($(OF_PRE_BUILD),)
	$(CP) $(PKG_BUILD_DIR)/of-pre-build/$(OF_PRE_BUILD)/idbloader.img $(STAGING_DIR_IMAGE)/$(BUILD_VARIANT)-idbloader.img
	$(CP) $(PKG_BUILD_DIR)/of-pre-build/$(OF_PRE_BUILD)/uboot.img $(STAGING_DIR_IMAGE)/$(BUILD_VARIANT)-u-boot.itb
endif
endef

define Package/u-boot/install/default
endef

$(eval $(call BuildPackage/U-Boot))
