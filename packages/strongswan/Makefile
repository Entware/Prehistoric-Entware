#
# Copyright (C) 2011-2015 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	rm -f ../../../openwrt_trunk/feeds/packages/net/strongswan/patches/101-musl-fixes.patch
	cp -f ./500-disable-insmod-flags.patch ../../../openwrt_trunk/feeds/packages/net/strongswan/patches/
	cp -f ./S90strongswan ../../../openwrt_trunk/feeds/packages/net/strongswan/files/
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
