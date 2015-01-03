#
# Copyright (C) 2011-2014 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include ../config.mk
export TOP:=$(shell (cd ../.. && pwd -P))
CFG=$(TOP)/openwrt_trunk/.config

all:
	$(error Choose an arch!)

define delete_arch_defs
	for i in $$(cat arch_defs_strings); do ( \
	    grep -v "$$i" $(CFG) > $(CFG).tmp; \
	    mv $(CFG).tmp $(CFG); \
	); done

endef

arm:
	$(call delete_arch_defs)
	if [ ! -f "./.arch_defs_arm" ]; \
	then \
		cp -f arch_defs_arm .arch_defs_arm; \
		sed -i 's,__TOOLCHAIN_ROOT__,$(TOP)/arm-unknown-linux-gnueabi,g' .arch_defs_arm; \
		sed -i 's,__SYSROOT__,$(TOP)/arm-unknown-linux-gnueabi/arm-unknown-linux-gnueabi/sysroot,g' .arch_defs_arm; \
		sed -i 's,__USRBIN__,$(TOP)/arm-unknown-linux-gnueabi/arm-unknown-linux-gnueabi/sysroot/usr/bin,g' .arch_defs_arm; \
		sed -i 's,__USR__,$(TOP)/arm-unknown-linux-gnueabi/arm-unknown-linux-gnueabi/sysroot/usr,g' .arch_defs_arm; \
	fi
	cat .arch_defs_arm >> $(CFG)
	sed -i 's,ld-linux.so.2,ld-linux.so.3,g' $(TOP)/openwrt_trunk/rules.mk
#	make -C $(TOP)/openwrt_trunk oldconfig

x86:
	$(call delete_arch_defs)
	if [ ! -f "./.arch_defs_x86" ]; \
	then \
		cp -f arch_defs_x86 .arch_defs_x86; \
		sed -i 's,__TOOLCHAIN_ROOT__,$(TOP)/i686-unknown-linux-gnu,g' .arch_defs_x86; \
		sed -i 's,__SYSROOT__,$(TOP)/i686-unknown-linux-gnu/i686-unknown-linux-gnu/sysroot,g' .arch_defs_x86; \
		sed -i 's,__USRBIN__,$(TOP)/i686-unknown-linux-gnu/i686-unknown-linux-gnu/sysroot/usr/bin,g' .arch_defs_x86; \
		sed -i 's,__USR__,$(TOP)/i686-unknown-linux-gnu/i686-unknown-linux-gnu/sysroot/usr,g' .arch_defs_x86; \
	fi
	cat .arch_defs_x86 >> $(CFG)
	sed -i 's,ld-linux.so.3,ld-linux.so.2,g' $(TOP)/openwrt_trunk/rules.mk
#	make -C $(TOP)/openwrt_trunk oldconfig


.PHONY: all arm x86
