#
# Copyright (C) 2015 - 2029. Hydra Project.
#

define Profile/Broadcom-b44-b43
  NAME:=Broadcom SoC, b44 Ethernet, BCM43xx WiFi (b43, default)
  PACKAGES:=kmod-b44 kmod-b43 kmod-b43legacy
endef

define Profile/Broadcom-b44-b43/Description
	Package set compatible with hardware older Broadcom BCM47xx or BCM535x
	SoC with Broadcom BCM43xx Wifi cards using the mac80211, b43 and
	b43legacy drivers and b44 Ethernet driver.
endef

$(eval $(call Profile,Broadcom-b44-b43))

