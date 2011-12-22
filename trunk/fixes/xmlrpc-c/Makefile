# Makefile for OpenWrt Buildroot 
#
# Copyright (C) 2011 Ryzhov Alexander
# 
# This is free software, licensed under the GNU General Public License v2.
#


all: ./.done

./.done:
	patch -p0 -i ./fix-path.patch
	cp -f ./555-remove-curl-types-header.patch ../../../trunk/feeds/packages/libs/xmlrpc-c/patches/
	touch $@

clean:
	rm -f ./.done

.PHONY : clean