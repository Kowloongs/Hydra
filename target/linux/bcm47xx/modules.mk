#
# Copyright (C) 2015 - 2029. Hydra Project.
#

define KernelPackage/bgmac
  TITLE:=Broadcom bgmac driver
  KCONFIG:=CONFIG_BGMAC CONFIG_BGMAC_BCMA
  DEPENDS:=@TARGET_bcm47xx @!TARGET_bcm47xx_legacy
  SUBMENU:=$(NETWORK_DEVICES_MENU)
  FILES:= \
	$(LINUX_DIR)/drivers/net/ethernet/broadcom/bgmac-bcma.ko \
	$(LINUX_DIR)/drivers/net/ethernet/broadcom/bgmac-bcma-mdio.ko \
	$(LINUX_DIR)/drivers/net/ethernet/broadcom/bgmac.ko
  AUTOLOAD:=$(call AutoProbe,bgmac-bcma)
endef

define KernelPackage/bgmac/description
 Kernel modules for Broadcom bgmac Ethernet adapters.
endef

$(eval $(call KernelPackage,bgmac))
