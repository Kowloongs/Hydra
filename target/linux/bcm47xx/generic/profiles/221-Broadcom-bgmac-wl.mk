#
# Copyright (C) 2015 - 2029. Hydra Project.
#

define Profile/Broadcom-bgmac-wl
  NAME:=Broadcom SoC, bgmac Ethernet, BCM43xx WiFi (wl, proprietary)
  PACKAGES:=-wpad-basic-wolfssl kmod-bgmac kmod-brcm-wl wlc nas
endef

define Profile/Broadcom-bgmac-wl/Description
	Package set compatible with hardware newer Broadcom BCM47xx or BCM535x
	SoC with Broadcom BCM43xx Wifi cards using the proprietary Broadcom
	wireless "wl" driver and bgmac Ethernet driver.
endef

$(eval $(call Profile,Broadcom-bgmac-wl))

