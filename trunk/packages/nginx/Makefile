#
# Copyright (C) 2011-2012 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: ./.done

./.done:
	patch -p0 -i ./fix-path.patch
	patch -p0 -i ./modules.patch
	cp ./110-remove-accep4-support.patch ../../../openwrt_trunk/feeds/packages/net/nginx/patches/
	cp ./300-http-dav-ext.patch ../../../openwrt_trunk/feeds/packages/net/nginx/patches/
	cp ./S80nginx ../../../openwrt_trunk/feeds/packages/net/nginx/files/
	touch $@

clean:
	rm -f ./.done

.PHONY : clean
