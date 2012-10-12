#
# Copyright (C) 2011-2012 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: ./.done

./.done:
	patch -p0 -i ./fix-path.patch
	mkdir -p ../../../openwrt_trunk/feeds/packages/net/fwknop/files/
	cp -f ./S05fwknopd ../../../openwrt_trunk/feeds/packages/net/fwknop/files/
	touch $@

clean:
	rm -f ./.done

.PHONY : clean
