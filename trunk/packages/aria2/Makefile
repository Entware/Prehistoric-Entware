#
# Copyright (C) 2011-2013 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	mkdir -p ../../../openwrt_trunk/feeds/packages/net/aria2/files
	cp -f ./aria2.conf ../../../openwrt_trunk/feeds/packages/net/aria2/files/
	cp -f ./S81aria2 ../../../openwrt_trunk/feeds/packages/net/aria2/files/
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
