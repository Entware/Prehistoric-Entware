#
# Copyright (C) 2011-2015 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	mkdir -p ../../../openwrt_trunk/feeds/packages/utils/mc/patches
	cp -f ./020-global.patch ../../../openwrt_trunk/feeds/packages/utils/mc/patches/
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
