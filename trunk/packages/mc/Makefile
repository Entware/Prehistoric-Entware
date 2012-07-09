#
# Copyright (C) 2011-2012 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: ./.done

./.done:
	patch -p0 -i ./fix-path.patch
	mkdir ../../../openwrt_trunk/feeds/packages/utils/mc/patches
	cp 0*.patch ../../../openwrt_trunk/feeds/packages/utils/mc/patches/
	touch $@

clean:
	rm -f ./.done

.PHONY : clean
