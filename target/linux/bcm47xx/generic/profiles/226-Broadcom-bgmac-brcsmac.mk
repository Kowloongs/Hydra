#
# Copyright (C) 2015 - 2029. Hydra Project.
#

define Profile/Broadcom-bgmac-brcmsmac
  NAME:=Broadcom SoC, bgmac Ethernet, BCM43xx WiFi (brcmsmac)
  PACKAGES:=kmod-bgmac kmod-brcmsmac
endef

define Profile/Broadcom-bgmac-brcmsmac/Description
	Package set compatable with newer gigabit + N based bcm47xx SoCs with
	Broadcom BCM43xx Wifi cards using the mac80211 brcmsmac driver and
	bgmac Ethernet driver.
endef

$(eval $(call Profile,Broadcom-bgmac-brcmsmac))

