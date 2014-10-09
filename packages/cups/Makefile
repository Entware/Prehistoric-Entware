# Makefile for OpenWrt Buildroot 
#
# Copyright (C) 2011 Ryzhov Alexander
# 
# This is free software, licensed under the GNU General Public License v2.
#


all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	cp -f ./S60cupsd ../../../openwrt_trunk/feeds/oldpackages/net/cups/files/
	cp -f ./500-ppdc-linkage.patch ../../../openwrt_trunk/feeds/oldpackages/net/cups/patches/
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
