#
# Copyright (C) 2011-2014 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	cp -f ./999-change-default-config-path.patch ../../../openwrt_trunk/package/system/opkg/patches
	cp -f ./999-free-space-calc.patch ../../../openwrt_trunk/package/system/opkg/patches
	rm -f ../../../openwrt_trunk/package/system/opkg/patches/009-remove-upgrade-all.patch
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
