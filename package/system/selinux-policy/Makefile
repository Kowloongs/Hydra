#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=selinux-policy
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://git.defensec.nl/selinux-policy.git
PKG_VERSION:=1.1
PKG_MIRROR_HASH:=657ec1ff51ab946753fb3559384511a536ac1e018691f3e49cbab21c55d23e08
PKG_SOURCE_VERSION:=v$(PKG_VERSION)
PKG_BUILD_DEPENDS:=secilc/host policycoreutils/host

PKG_MAINTAINER:=Dominick Grift <dominick.grift@defensec.nl>
PKG_CPE_ID:=cpe:/a:defensec:selinux-policy
PKG_LICENSE:=Unlicense
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk

define Package/selinux-policy
	SECTION:=system
	CATEGORY:=Base system
	TITLE:=SELinux security policy for Hydra
	URL:=https://git.defensec.nl/?p=selinux-policy.git;a=summary
	PKGARCH:=all
endef

define Package/selinux-policy/description
	Basic SELinux Security Policy designed specifically for
	Hydra and written in Common Intermediate Language.
endef

define Build/Compile
	$(call Build/Compile/Default,policy)
endef

define Package/selinux-policy/conffiles
/etc/selinux/config
endef

define Package/selinux-policy/install
	$(INSTALL_DIR) $(1)/etc/selinux/$(PKG_NAME)/contexts/files/
	$(INSTALL_DIR) $(1)/etc/selinux/$(PKG_NAME)/policy/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/customizable_types $(1)/etc/selinux/$(PKG_NAME)/contexts/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/file_contexts.subs_dist $(1)/etc/selinux/$(PKG_NAME)/contexts/files/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/file_contexts $(1)/etc/selinux/$(PKG_NAME)/contexts/files/
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/policy.* $(1)/etc/selinux/$(PKG_NAME)/policy/
	$(INSTALL_DATA) ./files/selinux-config $(1)/etc/selinux/config
endef

$(eval $(call BuildPackage,selinux-policy))
