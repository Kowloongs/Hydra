#
# Copyright (C) 2015 - 2029. Hydra Project.
#

define Profile/Ps1208mfg
  NAME:=Edimax PS-1208MFG
  PACKAGES:=-firewall -dropbear -dnsmasq -mtd -ppp -wpad-basic-wolfssl kmod-b44 block-mount kmod-usb-storage kmod-usb2 kmod-usb-ohci -iptables -swconfig kmod-fs-ext4
endef

define Profile/Ps1208mfg/Description
	Package set optimize for edimax PS-1208MFG printserver
endef

$(eval $(call Profile,Ps1208mfg))

