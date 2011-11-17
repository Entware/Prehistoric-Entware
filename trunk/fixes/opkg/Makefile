# Makefile for OpenWrt Buildroot 
#
# Copyright (C) 2011 Ryzhov Alexander
# 
# This is free software, licensed under the GNU General Public License v2.
#


all: ./.done

./.done:
	patch -p0 -i ./fix-path.patch
	cp ./999-change-default-config-path.patch ../../../trunk/package/opkg/patches
	cp ./999-free-space-calc.patch ../../../trunk/package/opkg/patches
	rm -f ../../../trunk/package/opkg/patches/009-remove-upgrade-all.patch
	touch $@

clean:
	rm -f ./.done

.PHONY : clean