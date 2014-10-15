#
# Copyright (C) 2011-2014 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	rm -f ../../../openwrt_trunk/feeds/packages/multimedia/mjpg-streamer/patches/0*.patch
	cp -f ./S96mjpg-streamer ../../../openwrt_trunk/feeds/packages/multimedia/mjpg-streamer/files/
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
