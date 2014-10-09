#
# Copyright (C) 2011-2014 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	cp -f ./555-rpath-ld-option.patch ../../../openwrt_trunk/feeds/oldpackages/net/bitlbee/patches
	cp -f ./S72bitlbee ../../../openwrt_trunk/feeds/oldpackages/net/bitlbee/files/
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
