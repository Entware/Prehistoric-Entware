#
# Copyright (C) 2011-2012 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: ./.done

./.done:
	patch -p0 -i ./fix-path.patch
	cp -f ./500-another-SHA1.patch ../../../openwrt_trunk/feeds/packages/multimedia/tvheadend/patches/
	cp -f ./510-grabbers-search-path.patch ../../../openwrt_trunk/feeds/packages/multimedia/tvheadend/patches/
	cp -f ./S71tvheadend ../../../openwrt_trunk/feeds/packages/multimedia/tvheadend/files/
	touch $@

clean:
	rm -f ./.done

.PHONY : clean
