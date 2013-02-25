#
# Copyright (C) 2011-2013 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: ./.done

./.done:
	patch -p0 -i ./fix-path.patch
	patch -p0 -i ./opkg-conf.patch
	cp ./999-change-default-config-path.patch ../../../openwrt_trunk/package/opkg/patches
	cp ./999-free-space-calc.patch ../../../openwrt_trunk/package/opkg/patches
	rm ../../../openwrt_trunk/package/opkg/patches/009-remove-upgrade-all.patch
	touch $@

clean:
	rm -f ./.done

.PHONY : clean
