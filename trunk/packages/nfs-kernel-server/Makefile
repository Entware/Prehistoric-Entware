#
# Copyright (C) 2011-2012 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: ./.done

./.done:
	patch -p0 -i ./fix-path.patch
	cp -f ./500-config-path.patch ../../../openwrt_trunk/feeds/packages/net/nfs-kernel-server/patches/
	cp -f ./S57nfs-kernel-server ../../../openwrt_trunk/feeds/packages/net/nfs-kernel-server/files/
	touch $@

clean:
	rm -f ./.done

.PHONY : clean
