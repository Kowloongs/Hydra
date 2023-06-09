#
# Copyright (C) 2015 - 2029. Hydra Project.
#

define Profile/Broadcom-b44-ath5k
  NAME:=Broadcom SoC, b44 Ethernet, Atheros WiFi (ath5k)
  PACKAGES:=kmod-b44 kmod-ath5k
endef

define Profile/Broadcom-b44-ath5k/Description
	Package set compatible with hardware older Broadcom BCM47xx or BCM535x
	SoC with Atheros Wifi cards using the mac80211 and ath5k drivers and
	b44 Ethernet driver.
endef
$(eval $(call Profile,Broadcom-b44-ath5k))

