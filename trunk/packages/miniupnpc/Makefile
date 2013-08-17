#
# Copyright (C) 2011-2013 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: ./.done

./.done:
	cp ./555-install-prefix.patch ../../../openwrt_trunk/feeds/packages/net/miniupnpc/patches/
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	touch $@

clean:
	rm -f ./.done

.PHONY : clean
