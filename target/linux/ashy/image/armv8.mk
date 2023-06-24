#
# Copyright (C) 2015 - 2029. Hydra Project.
#

define Device/ombres_monopi-r5s
  DEVICE_VENDOR := Ombres
  DEVICE_MODEL := MonoPi R5S
  SOC := rk3568
  UBOOT_DEVICE_NAME := monopi-r5s-rk3568
  IMAGE/sysupgrade.img.gz := boot-common | boot-script monopi-r5s | pine64-img | gzip | append-metadata
  DEVICE_PACKAGES := kmod-usb-net-rtl8152
endef
TARGET_DEVICES += ombres_monopi-r5s
