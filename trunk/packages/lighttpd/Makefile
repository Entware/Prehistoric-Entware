#
# Copyright (C) 2011-2014 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	cp -f ./S80lighttpd ../../../openwrt_trunk/feeds/packages/net/lighttpd/files/
	mkdir -p ../../../openwrt_trunk/feeds/packages/net/lighttpd/patches/
	cp -f ./500-plugins-path.patch ../../../openwrt_trunk/feeds/packages/net/lighttpd/patches/
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
