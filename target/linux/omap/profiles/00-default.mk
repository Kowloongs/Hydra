#
# Copyright (C) 2015 - 2029. Hydra Project.
#

define Profile/Default
  NAME:=Default Profile
  PACKAGES:= \
	kmod-usb-net-asix kmod-usb-net-asix-ax88179 kmod-usb-net-hso \
	kmod-usb-net-kaweth kmod-usb-net-pegasus kmod-usb-net-mcs7830 \
	kmod-usb-net-smsc95xx kmod-usb-net-dm9601-ether \
	wpad-basic-wolfssl
  PRIORITY := 1
endef

define Profile/Default/Description
	Default package set compatible with most boards.
endef

$(eval $(call Profile,Default))
