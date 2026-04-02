#
# Copyright (C) 2026 OpenClaw
# Licensed under GPLv3, see LICENSE for details
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-oc-traffic
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_LICENSE:=GPL-3.0
PKG_MAINTAINER:=OpenClaw Team <contact@openclaw.org>

LUCI_TITLE:=OpenClash Traffic Monitor
LUCI_DEPENDS:=+curl +jq
PKGARCH:=all

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
