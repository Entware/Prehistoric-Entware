#
# Copyright (C) 2011-2013 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: ./.done

./.done:
	patch -p0 -i ./fix-path.patch
	cp -f ./500-disable-insmod-flags.patch ../../../openwrt_trunk/feeds/packages/net/strongswan/patches/
	cp -f ./S90strongswan ../../../openwrt_trunk/feeds/packages/net/strongswan/files/
	touch $@

clean:
	rm -f ./.done

.PHONY : clean
