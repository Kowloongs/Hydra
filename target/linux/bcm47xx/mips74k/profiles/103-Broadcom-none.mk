#
# Copyright (C) 2015 - 2029. Hydra Project.
#

define Profile/Broadcom-mips74k-none
  NAME:=Broadcom SoC, No WiFi
  PACKAGES:=-wpad-basic-wolfssl
endef

define Profile/Broadcom-mips74k-none/Description
	Package set for devices without a WiFi.
endef

$(eval $(call Profile,Broadcom-mips74k-none))

