#
# Copyright (C) 2011-2015 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	patch -d $(TOP) -p3 -i $(CURDIR)/add-package-cgi.patch
	patch -d $(TOP) -p3 -i $(CURDIR)/config-add-package-cgi.patch
	cp -f ./S15upsd ../../../openwrt_trunk/feeds/packages/net/nut/files/
	cp -f ./S15upsmon ../../../openwrt_trunk/feeds/packages/net/nut/files/
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
