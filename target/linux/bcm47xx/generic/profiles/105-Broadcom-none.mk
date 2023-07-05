#
# Copyright (C) 2015 - 2029. Hydra Project.
#

define Profile/Broadcom-none
  NAME:=Broadcom SoC, all Ethernet, No WiFi
  PACKAGES:=-wpad-basic-wolfssl kmod-b44 kmod-tg3 kmod-bgmac
endef

define Profile/Broadcom-none/Description
	Package set compatible with hardware any Broadcom BCM47xx or BCM535x
	SoC without any Wifi cards and b44, tg3 or bgmac Ethernet driver.
endef
$(eval $(call Profile,Broadcom-none))

