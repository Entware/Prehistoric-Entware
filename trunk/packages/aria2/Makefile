#
# Copyright (C) 2011-2012 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: ./.done

./.done:
	patch -p0 -i ./fix-path.patch
	patch -p0 -i ./tmp_update_to_1.15.2.patch
	mkdir ../../../openwrt_trunk/feeds/packages/net/aria2/files
	cp ./aria2.conf ../../../openwrt_trunk/feeds/packages/net/aria2/files/
	cp ./S81aria2 ../../../openwrt_trunk/feeds/packages/net/aria2/files/
	touch $@

clean:
	rm -f ./.done

.PHONY : clean
