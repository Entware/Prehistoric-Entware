#
# Copyright (C) 2011-2013 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: ./.done

./.done:
	patch -p0 -i ./fix-path.patch
	cp ./555-rpath-ld-option.patch ../../../openwrt_trunk/feeds/packages/net/bitlbee/patches
	cp ./S72bitlbee ../../../openwrt_trunk/feeds/packages/net/bitlbee/files/
	touch $@

clean:
	rm -f ./.done

.PHONY : clean
