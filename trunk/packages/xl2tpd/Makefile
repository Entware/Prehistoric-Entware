#
# Copyright (C) 2011-2014 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	cp -f ./S20xl2tpd ../../../openwrt_trunk/feeds/packages/net/xl2tpd/files/
	cp -f ./chap-secrets ../../../openwrt_trunk/feeds/packages/net/xl2tpd/files/
	cp -f ./ip-down.sh ../../../openwrt_trunk/feeds/packages/net/xl2tpd/files/
	cp -f ./ip-up.sh ../../../openwrt_trunk/feeds/packages/net/xl2tpd/files/
	cp -f ./140-config_path.patch ../../../openwrt_trunk/feeds/packages/net/xl2tpd/patches/
	cp -f ./150-entware-path.patch ../../../openwrt_trunk/feeds/packages/net/xl2tpd/patches/
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
