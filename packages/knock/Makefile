#
# Copyright (C) 2011-2014 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	cp -f ./500-paths.patch ../../../openwrt_trunk/feeds/oldpackages/net/knock/patches/
	mkdir -p ../../../openwrt_trunk/feeds/oldpackages/net/knock/files
	cp -f ./S05knockd ../../../openwrt_trunk/feeds/oldpackages/net/knock/files/
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
