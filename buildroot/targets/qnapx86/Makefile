#
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

ARCH:=i386
BOARD:=qnapx86
BOARDNAME:=QNAP x86
FEATURES:=
LINUX_VERSION:=2.6.31

include $(INCLUDE_DIR)/target.mk

define Target/Description
	Build Software Repository for MIPSEL soft float routers, like Zyxel Keenetic and others.
endef

$(eval $(call BuildTarget))
