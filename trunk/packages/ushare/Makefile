#
# Copyright (C) 2011-2013 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: ./.done

./.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	rm ../../../openwrt_trunk/feeds/packages/multimedia/ushare/files/ushare.*
	cp -f ./555-flv-support.patch ../../../openwrt_trunk/feeds/packages/multimedia/ushare/patches/
	cp ./S99ushare ../../../openwrt_trunk/feeds/packages/multimedia/ushare/files/
	touch $@

clean:
	rm -f ./.done

.PHONY : clean
