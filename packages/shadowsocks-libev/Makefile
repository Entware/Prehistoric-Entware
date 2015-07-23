#
# Copyright (C) 2011-2015 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	mkdir -p ../../../openwrt_trunk/feeds/packages/net/shadowsocks-libev/patches
	cp -f ./5*.patch ../../../openwrt_trunk/feeds/packages/net/shadowsocks-libev/patches/
	cp -f ./shadowsocks.json ../../../openwrt_trunk/feeds/packages/net/shadowsocks-libev/files/
	cp -f ./S22shadowsocks ../../../openwrt_trunk/feeds/packages/net/shadowsocks-libev/files/
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
