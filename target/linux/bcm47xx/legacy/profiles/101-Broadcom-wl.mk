#
# Copyright (C) 2015 - 2029. Hydra Project.
#

define Profile/Broadcom-wl
  NAME:=Broadcom SoC, all Ethernet, BCM43xx WiFi (wl, proprietary)
  PACKAGES:=-wpad-basic-wolfssl kmod-brcm-wl-mini wlc nas
endef

define Profile/Broadcom-wl/Description
	Package set compatible with hardware any Broadcom BCM47xx or BCM535x
	SoC with Broadcom BCM43xx Wifi cards using the proprietary Broadcom
	wireless "wl" driver and b44, tg3 or bgmac Ethernet driver.
endef

$(eval $(call Profile,Broadcom-wl))

