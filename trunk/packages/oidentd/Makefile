#
# Copyright (C) 2011-2013 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: ./.done

./.done:
	patch -p0 -i ./fix-path.patch
	cp -f ./S39oidentd ../../../openwrt_trunk/feeds/packages/net/oidentd/files/
	mkdir -p ../../../openwrt_trunk/feeds/packages/net/oidentd/patches/
	cp -f ./010-config-path.patch ../../../openwrt_trunk/feeds/packages/net/oidentd/patches/
	touch $@

clean:
	rm -f ./.done

.PHONY : clean
