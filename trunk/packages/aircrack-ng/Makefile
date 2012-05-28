# Makefile for OpenWrt Buildroot 
#
# Copyright (C) 2011 Ryzhov Alexander
# 
# This is free software, licensed under the GNU General Public License v2.
#


all: ./.done

./.done:
	patch -p0 -i ./fix-path.patch
	cp -f ./050-add-link-flags.patch ../../../trunk/feeds/packages/net/aircrack-ng/patches/
	touch $@

clean:
	rm -f ./.done

.PHONY : clean