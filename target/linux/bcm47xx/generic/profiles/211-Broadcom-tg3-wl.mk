#
# Copyright (C) 2015 - 2029. Hydra Project.
#

define Profile/Broadcom-tg3-wl
  NAME:=Broadcom SoC, tg3 Ethernet, BCM43xx WiFi (wl, proprietary)
  PACKAGES:=-wpad-basic-wolfssl kmod-brcm-wl wlc nas kmod-tg3
endef

define Profile/Broadcom-tg3-wl/Description
	Package set compatible with hardware Broadcom BCM4705/BCM4785
	SoC with Broadcom BCM43xx Wifi cards using the proprietary Broadcom
	wireless "wl" driver and tg3 Ethernet driver.
endef

$(eval $(call Profile,Broadcom-tg3-wl))

