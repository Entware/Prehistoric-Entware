#
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

ARCH:=mipsel
BOARD:=rtn
BOARDNAME:=ASUS RT-N1x repo
FEATURES:=
#squashfs

LINUX_VERSION:=2.6.39

include $(INCLUDE_DIR)/target.mk
#DEFAULT_PACKAGES += wpad-mini kmod-switch kmod-diag nvram

define Target/Description
	Build Software Repository for ASUS WL-5xx RT-N1x Oleg's based custom firmware
endef

$(eval $(call BuildTarget))
