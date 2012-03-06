# Makefile for OpenWrt Buildroot 
#
# Copyright (C) 2011 Ryzhov Alexander
# 
# This is free software, licensed under the GNU General Public License v2.
#


all: ./.done

./.done:
	patch -p0 -i ./fix-path.patch
	mkdir ../../../trunk/feeds/packages/utils/psmisc/patches/
	cp ./010-enable-peekfd.patch ../../../trunk/feeds/packages/utils/psmisc/patches
	touch $@

clean:
	rm -f ./.done

.PHONY : clean