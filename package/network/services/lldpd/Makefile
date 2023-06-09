#
# Copyright (C) 2015 - 2029. Hydra Project.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=lldpd
PKG_VERSION:=1.0.13
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://media.luffy.cx/files/lldpd
PKG_HASH:=d639827fd8a27720d1bfd94bc52eca24af63ddcc3c9d2da60788778889d84701

PKG_MAINTAINER:=Stijn Tintel <stijn@linux-ipv6.be>
PKG_LICENSE:=ISC

PKG_FIXUP:=autoreconf
PKG_BUILD_PARALLEL:=1
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/lldpd
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Routing and Redirection
  TITLE:=Link Layer Discovery Protocol daemon
  URL:=https://vincentbernat.github.io/lldpd/
  DEPENDS:=+libcap +libevent2 +USE_GLIBC:libbsd +LLDPD_WITH_JSON:libjson-c
  USERID:=lldp=121:lldp=129
  MENU:=1
endef

define Package/lldpd/config
source "$(SOURCE)/Config.in"
endef

define Package/lldpd/description
	LLDP (Link Layer Discovery Protocol) is an industry standard protocol designed
	to supplant proprietary Link-Layer protocols such as
	Extreme's EDP (Extreme Discovery Protocol) and
	CDP (Cisco Discovery Protocol).
	The goal of LLDP is to provide an inter-vendor compatible mechanism to deliver
	Link-Layer notifications to adjacent network devices.
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/liblldpctl.so* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/lldpctl.h $(1)/usr/include/lldpctl.h
	$(CP) $(PKG_INSTALL_DIR)/usr/include/lldp-const.h $(1)/usr/include/lldp-const.h
endef

define Package/lldpd/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/etc/lldpd.d
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DIR) $(1)/usr/lib $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/lldp{cli,ctl,d} $(1)/usr/sbin/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/liblldpctl.so* $(1)/usr/lib/
	$(INSTALL_BIN) ./files/lldpd.init $(1)/etc/init.d/lldpd
	$(INSTALL_CONF) ./files/lldpd.config $(1)/etc/config/lldpd
ifneq ($(CONFIG_LLDPD_WITH_CDP),y)
	sed -i -e '/cdp/d' $(1)/etc/init.d/lldpd $(1)/etc/config/lldpd
endif
ifneq ($(CONFIG_LLDPD_WITH_FDP),y)
	sed -i -e '/fdp/d' $(1)/etc/init.d/lldpd $(1)/etc/config/lldpd
endif
ifneq ($(CONFIG_LLDPD_WITH_EDP),y)
	sed -i -e '/edp/d' $(1)/etc/init.d/lldpd $(1)/etc/config/lldpd
endif
ifneq ($(CONFIG_LLDPD_WITH_SONMP),y)
	sed -i -e '/sonmp/d' $(1)/etc/init.d/lldpd $(1)/etc/config/lldpd
endif
ifneq ($(CONFIG_LLDPD_WITH_SNMP),y)
	sed -i -e '/agentxsocket/d' $(1)/etc/init.d/lldpd $(1)/etc/config/lldpd
endif
endef

define Package/lldpd/conffiles
/etc/config/lldpd
endef

CONFIGURE_ARGS += \
	$(if $(CONFIG_LLDPD_WITH_PRIVSEP), \
	--with-privsep-user=lldp \
	--with-privsep-group=lldp \
	--with-privsep-chroot=/var/run/lldp \
	,--disable-privsep) \
	--with-readline=no \
	--with-embedded-libevent=no \
	--disable-hardening \
	--without-xml \
	--disable-doxygen-doc \
	--sysconfdir=/tmp \
	$(if $(CONFIG_LLDPD_WITH_CDP),,--disable-cdp) \
	$(if $(CONFIG_LLDPD_WITH_FDP),,--disable-fdp) \
	$(if $(CONFIG_LLDPD_WITH_EDP),,--disable-edp) \
	$(if $(CONFIG_LLDPD_WITH_LLDPMED),,--disable-lldpmed) \
	$(if $(CONFIG_LLDPD_WITH_DOT1),,--disable-dot1) \
	$(if $(CONFIG_LLDPD_WITH_DOT3),,--disable-dot3) \
	$(if $(CONFIG_LLDPD_WITH_CUSTOM),,--disable-custom) \
	$(if $(CONFIG_LLDPD_WITH_SONMP),,--disable-sonmp) \
	$(if $(CONFIG_LLDPD_WITH_JSON),--enable-json0,) \
	$(if $(CONFIG_LLDPD_WITH_SNMP),--with-snmp,) \
	$(if $(CONFIG_USE_GLIBC),,--without-libbsd)

TARGET_CFLAGS += -flto
TARGET_LDFLAGS += -flto -Wl,--gc-sections,--as-needed

$(eval $(call BuildPackage,lldpd))
