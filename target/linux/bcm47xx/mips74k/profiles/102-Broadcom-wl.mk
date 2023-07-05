#
# Copyright (C) 2015 - 2029. Hydra Project.
#

define Profile/Broadcom-mips74k-wl
  NAME:=Broadcom SoC, BCM43xx WiFi (proprietary wl)
  PACKAGES:=-wpad-basic-wolfssl kmod-brcm-wl wlc nas
endef

define Profile/Broadcom-mips74k-wl/Description
	Package set for devices with BCM43xx WiFi including proprietary (and
	closed source) driver "wl".
endef

$(eval $(call Profile,Broadcom-mips74k-wl))

