#
# Copyright (C) 2015 - 2029. Hydra Project.
#

include $(TOPDIR)/rules.mk

PKG_VERSION:=2019.07

PKG_HASH:=bff4fa77e8da17521c030ca4c5b947a056c1b1be4d3e6ee8637020b8d50251d0

include $(INCLUDE_DIR)/kernel.mk
include $(INCLUDE_DIR)/u-boot.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk

define U-Boot/Default
  BUILD_TARGET:=zynq
  UBOOT_IMAGE:=spl/boot.bin u-boot.img
  UBOOT_CONFIG:=zynq_$(1)
  UENV:=default
  HIDDEN:=1
endef

define U-Boot/zc702
  NAME:=Xilinx ZC702 Dev Board
  BUILD_DEVICES:=xlnx_zynq-zc702
endef

define U-Boot/zed
  NAME:=Avnet Digilent ZedBoard Dev Board
  BUILD_DEVICES:=avnet_zynq-zed
endef

define U-Boot/zybo
  NAME:=Digilent Zybo Dev Board
  BUILD_DEVICES:=digilent_zynq-zybo
endef

define U-Boot/zybo_z7
  NAME:=Digilent Zybo Z7 board
  BUILD_DEVICES:=digilent_zynq-zybo-z7
endef

UBOOT_TARGETS := \
	zc702 \
	zed \
	zybo \
	zybo_z7

define Build/InstallDev
	$(INSTALL_DIR) $(STAGING_DIR_IMAGE)
	$(CP) $(PKG_BUILD_DIR)/spl/boot.bin $(STAGING_DIR_IMAGE)/$(BUILD_DEVICES)-boot.bin
	$(CP) $(PKG_BUILD_DIR)/u-boot.img $(STAGING_DIR_IMAGE)/$(BUILD_DEVICES)-u-boot.img
	$(CP) ./files/uEnv-$(UENV).txt $(STAGING_DIR_IMAGE)/$(BUILD_DEVICES)-uEnv.txt
endef

define Package/u-boot/install/default
endef

$(eval $(call BuildPackage/U-Boot))
