#
# Copyright (C) 2015 - 2029. Hydra Project.
#

define Profile/Default
  NAME:=Default Profile
  PRIORITY:=1
  PACKAGES := kmod-usb-dwc2 kmod-usb-ledtrig-usbport kmod-usb-storage kmod-fs-vfat wpad-basic-wolfssl
endef

define Profile/Default/Description
	Default package set
endef

$(eval $(call Profile,Default))
