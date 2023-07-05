#
# Copyright (C) 2015 - 2029. Hydra Project.
#

define Profile/Broadcom-tg3-b43
  NAME:=Broadcom SoC, tg3 Ethernet, BCM43xx WiFi (b43)
  PACKAGES:=kmod-b43 kmod-tg3
endef

define Profile/Broadcom-tg3-b43/Description
	Package set compatible with hardware Broadcom BCM4705/BCM4785
	SoCs with Broadcom BCM43xx Wifi cards using the mac80211 and b43
	driver and tg3 Ethernet driver.
endef

$(eval $(call Profile,Broadcom-tg3-b43))

