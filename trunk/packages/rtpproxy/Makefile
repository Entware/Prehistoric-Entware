# Makefile for OpenWrt Buildroot 
#
# Copyright (C) 2011 Ryzhov Alexander
# 
# This is free software, licensed under the GNU General Public License v2.
#


all: ./.done

./.done:
	patch -p0 -i ./fix-path.patch
	mkdir ../../../trunk/feeds/packages/net/rtpproxy/files
	cp ./S18rtpproxy ../../../trunk/feeds/packages/net/rtpproxy/files/
	touch $@

clean:
	rm -f ./.done

.PHONY : clean