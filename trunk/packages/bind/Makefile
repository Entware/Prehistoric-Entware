#
# Copyright (C) 2011-2014 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path-conf.patch
	cp -f ./S09named ../../../openwrt_trunk/feeds/packages/net/bind/files/
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
