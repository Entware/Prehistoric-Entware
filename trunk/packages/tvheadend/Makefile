#
# Copyright (C) 2011-2013 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	rm -f ../../../openwrt_trunk/feeds/packages/multimedia/tvheadend/patches/*.patch
	cp -f ./S71tvheadend ../../../openwrt_trunk/feeds/packages/multimedia/tvheadend/files/
	cp -f ./tv_grab_wl500g_info* ../../../openwrt_trunk/feeds/packages/multimedia/tvheadend/files/
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
