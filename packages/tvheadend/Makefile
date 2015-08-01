#
# Copyright (C) 2011-2015 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	cp -f ./S71tvheadend ../../../openwrt_trunk/feeds/packages/multimedia/tvheadend/files/
	cp -f ./tv_grab_* ../../../openwrt_trunk/feeds/packages/multimedia/tvheadend/files/
	mkdir -p ../../../openwrt_trunk/feeds/packages/multimedia/tvheadend/patches
	cp -f ./5*.patch ../../../openwrt_trunk/feeds/packages/multimedia/tvheadend/patches/
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
