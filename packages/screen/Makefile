#
# Copyright (C) 2011-2015 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	cp -f ./500-no-stropts.patch ../../../openwrt_trunk/feeds/packages/utils/screen/patches/
	cp -f ./600-no-libelf.patch ../../../openwrt_trunk/feeds/packages/utils/screen/patches/
	rm -f ../../../openwrt_trunk/feeds/packages/utils/screen/patches/200-musl-compat.patch
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
