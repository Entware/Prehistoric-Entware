#
# Copyright (C) 2011-2015 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	mkdir -p ../../../openwrt_trunk/feeds/packages/multimedia/motion/patches
	cp -f ./002-honor_cppflags.patch ../../../openwrt_trunk/feeds/packages/multimedia/motion/patches/
	mkdir -p ../../../openwrt_trunk/feeds/packages/multimedia/motion/files
	cp -f ./S99motion ../../../openwrt_trunk/feeds/packages/multimedia/motion/files/
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
