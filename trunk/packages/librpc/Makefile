#
# Copyright (C) 2011-2012 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: ./.done

./.done:
	cp ./500-change-install-path.patch ../../../openwrt_trunk/package/libs/librpc/patches/
	patch -p0 -i ./fix-path.patch
	touch $@

clean:
	rm -f ./.done

.PHONY : clean
