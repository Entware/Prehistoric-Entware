# Makefile for OpenWrt Buildroot 
#
# Copyright (C) 2011 Ryzhov Alexander
# 
# This is free software, licensed under the GNU General Public License v2.
#


all: ./.done

./.done:
	cp ./555-install-prefix.patch ../../../trunk/feeds/packages/net/miniupnpc/patches/
	patch -p0 -i ./fix-path.patch
	touch $@

clean:
	rm -f ./.done

.PHONY : clean