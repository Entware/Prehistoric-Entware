#
# Copyright (C) 2011-2014 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	cp -f ./020-paths.patch ../../../openwrt_trunk/feeds/packages/multimedia/icecast/patches/
	cp -f ./030-enable-nobody-user.patch ../../../openwrt_trunk/feeds/packages/multimedia/icecast/patches/
	mkdir -p ../../../openwrt_trunk/feeds/packages/multimedia/icecast/files
	cp -f ./S78icecast ../../../openwrt_trunk/feeds/packages/multimedia/icecast/files/
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
