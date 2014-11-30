# Makefile for OpenWrt Buildroot 
#
# Copyright (C) 2011 Ryzhov Alexander
# 
# This is free software, licensed under the GNU General Public License v2.
#


all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	cp -f ./103-gcc-4.2.patch ../../../openwrt_trunk/feeds/packages/utils/attr/patches/
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
