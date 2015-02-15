#
# Copyright (C) 2011-2015 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	cp -f ./010-cfg-and-db-paths.patch ../../../openwrt_trunk/feeds/packages/net/vnstat/patches/
	cp -f ./S32vnstat ../../../openwrt_trunk/feeds/packages/net/vnstat/files/
	cp -f ./vnstat.conf ../../../openwrt_trunk/feeds/packages/net/vnstat/files/
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
