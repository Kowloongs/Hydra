#
# Copyright (C) 2015 - 2029. Hydra Project.
#

ARCH:=aarch64
SUBTARGET:=bcm2710
BOARDNAME:=BCM2710 boards (64 bit)
CPU_TYPE:=cortex-a53

define Target/Description
	Build firmware image for BCM2710 devices.
	This firmware features a 64 bit kernel.
endef
