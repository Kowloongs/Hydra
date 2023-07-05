#
# Copyright (C) 2015 - 2029. Hydra Project.
#

define Profile/Broadcom-b44-none
  NAME:=Broadcom SoC, b44 Ethernet, No WiFi
  PACKAGES:=-wpad-basic-wolfssl kmod-b44
endef

define Profile/Broadcom-b44-none/Description
	Package set compatible with hardware older Broadcom BCM47xx or BCM535x
	SoC without any Wifi cards and b44 Ethernet driver.
endef
$(eval $(call Profile,Broadcom-b44-none))

