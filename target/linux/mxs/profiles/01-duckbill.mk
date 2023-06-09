#
# Copyright (C) 2015 - 2029. Hydra Project.
#

define Profile/duckbill
  NAME:=I2SE Duckbill boards
  FEATURES+=usbgadget
  PACKAGES+= \
	-dnsmasq -firewall -ppp -ip6tables -iptables -6relayd -mtd uboot-envtools \
	kmod-leds-gpio -kmod-ipt-nathelper uboot-mxs-duckbill
endef

define Profile/duckbill/Description
	I2SE's Duckbill devices
endef

$(eval $(call Profile,duckbill))
