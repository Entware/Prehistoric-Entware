#
# Copyright (C) 2011-2013 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: ./.done

./.done:
	patch -p0 -i ./fix-path.patch
	mkdir -p ../../../openwrt_trunk/feeds/packages/net/nzbget/files
	cp -f ./S75nzbget ../../../openwrt_trunk/feeds/packages/net/nzbget/files/
	rm -f ../../../openwrt_trunk/feeds/packages/net/nzbget/patches/001-openssl-1.0.0-compat.patch
	touch $@

clean:
	rm -f ./.done

.PHONY : clean
