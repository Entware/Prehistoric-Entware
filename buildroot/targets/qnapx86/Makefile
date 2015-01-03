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
LINUX_VERSION:=2.6.32

include $(INCLUDE_DIR)/target.mk

define Target/Description
	Build Software Repository for x86 NASes, like QNAP and Synology.
endef

$(eval $(call BuildTarget))
