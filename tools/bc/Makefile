#
# Copyright (C) 2015 - 2029. Hydra Project.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=bc
PKG_VERSION:=1.06.95

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=https://alpha.gnu.org/gnu/bc \
	https://gnualpha.uib.no/bc/ \
	https://mirrors.fe.up.pt/pub/gnu-alpha/bc/ \
	https://www.nic.funet.fi/pub/gnu/alpha/gnu/bc/
PKG_HASH:=7ee4abbcfac03d8a6e1a8a3440558a3d239d6b858585063e745c760957725ecc

PKG_FIXUP := autoreconf

include $(INCLUDE_DIR)/host-build.mk

$(eval $(call HostBuild))
