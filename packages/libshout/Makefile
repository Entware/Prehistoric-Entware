#
# Copyright (C) 2011-2014 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	rm -f ../../../openwrt_trunk/feeds/oldpackages/libs/libshout/patches/100-ogg-c.patch
	rm -f ../../../openwrt_trunk/feeds/oldpackages/libs/libshout/patches/110-shout-ogg-c.patch
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
