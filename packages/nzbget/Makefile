#
# Copyright (C) 2011-2014 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	mkdir -p ../../../openwrt_trunk/feeds/oldpackages/net/nzbget/files
	cp -f ./S75nzbget ../../../openwrt_trunk/feeds/oldpackages/net/nzbget/files/
	rm -f ../../../openwrt_trunk/feeds/oldpackages/net/nzbget/patches/001-openssl-1.0.0-compat.patch
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
