#
# Copyright (C) 2011-2013 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: ./.done

./.done:
	patch -p0 -i ./fix-path.patch
	cp -f ./999-entware-path.patch ../../../openwrt_trunk/package/utils/busybox/patches/
	touch $@

clean:
	rm -f ./.done

.PHONY : clean
