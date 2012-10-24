#
# Copyright (C) 2011-2012 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: ./.done

./.done:
	patch -p0 -i ./fix-path.patch
	cp -f ./555-remove-AM-PATH_CPPUNIT-test.patch ../../../openwrt_trunk/feeds/packages/libs/libtorrent/patches/
	cp -f ./100-fix_cross_compile.patch ../../../openwrt_trunk/feeds/packages/libs/libtorrent/patches/
	rm ../../../openwrt_trunk/feeds/packages/libs/libtorrent/patches/000-upstream-gcc46-fixes.patch
	touch $@

clean:
	rm -f ./.done

.PHONY : clean
