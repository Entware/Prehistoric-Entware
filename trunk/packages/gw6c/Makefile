#
# Copyright (C) 2011-2013 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: ./.done

./.done:
	patch -p0 -i ./fix-path.patch
	mkdir -p ../../../openwrt_trunk/feeds/packages/ipv6/gw6c/patches
	cp -f 0*.patch ../../../openwrt_trunk/feeds/packages/ipv6/gw6c/patches/
	cp -f ./S11gw6c ../../../openwrt_trunk/feeds/packages/ipv6/gw6c/files/
	cp -f ./gw6c.conf ../../../openwrt_trunk/feeds/packages/ipv6/gw6c/files/
	touch $@

clean:
	rm -f ./.done

.PHONY : clean
