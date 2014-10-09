#
# Copyright (C) 2011-2014 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	cp -f ./S39oidentd ../../../openwrt_trunk/feeds/oldpackages/net/oidentd/files/
	mkdir -p ../../../openwrt_trunk/feeds/oldpackages/net/oidentd/patches/
	cp -f ./010-config-path.patch ../../../openwrt_trunk/feeds/oldpackages/net/oidentd/patches/
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
