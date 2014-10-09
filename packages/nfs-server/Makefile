#
# Copyright (C) 2011-2014 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	cp -f ./500-exports-path.patch ../../../openwrt_trunk/feeds/oldpackages/net/nfs-server/patches/
	cp -f ./S56mountd ../../../openwrt_trunk/feeds/oldpackages/net/nfs-server/files/
	cp -f ./S57nfsd ../../../openwrt_trunk/feeds/oldpackages/net/nfs-server/files/
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
