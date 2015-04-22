#
# Copyright (C) 2011-2015 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	cp -f ./5*.patch ../../../openwrt_trunk/package/system/opkg/patches
	rm -f ../../../openwrt_trunk/package/system/opkg/patches/009-remove-upgrade-all.patch
	rm -f ../../../openwrt_trunk/package/system/opkg/patches/230-drop_md5_support.patch
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
