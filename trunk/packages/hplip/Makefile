#
# Copyright (C) 2011-2012 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: ./.done

./.done:
	mkdir ../../../openwrt_trunk/feeds/packages/utils/hplip/patches
	cp ./010-state-dir.patch ../../../openwrt_trunk/feeds/packages/utils/hplip/patches/
	cp ./020-cross-compile.patch ../../../openwrt_trunk/feeds/packages/utils/hplip/patches/
	patch -p0 -i ./fix-path.patch
	touch $@

clean:
	rm -f ./.done

.PHONY : clean
