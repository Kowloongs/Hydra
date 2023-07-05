#
# Copyright (C) 2015 - 2029. Hydra Project.
#

ARCH:=arm
SUBTARGET:=mt7629
BOARDNAME:=MT7629
CPU_TYPE:=cortex-a7
FEATURES:=squashfs nand ramdisk

KERNELNAME:=Image dtbs

define Target/Description
	Build firmware images for MediaTek mt7629 ARM based boards.
endef

