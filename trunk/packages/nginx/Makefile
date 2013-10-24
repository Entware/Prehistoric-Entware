#
# Copyright (C) 2011-2013 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	cp -f ./110-remove-accep4-support.patch ../../../openwrt_trunk/feeds/packages/net/nginx/patches/
	cp -f ./S80nginx ../../../openwrt_trunk/feeds/packages/net/nginx/files/
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
