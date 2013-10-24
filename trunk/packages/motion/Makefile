#
# Copyright (C) 2011-2013 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	mkdir -p ../../../openwrt_trunk/feeds/packages/multimedia/motion/files
	cp -f ./S99motion ../../../openwrt_trunk/feeds/packages/multimedia/motion/files/
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
