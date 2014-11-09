#
# Copyright (C) 2011-2014 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	cp -f ./5*.patch ../../../openwrt_trunk/feeds/oldpackages/net/btpd/patches/
	cp -f ./S93btpd ../../../openwrt_trunk/feeds/oldpackages/net/btpd/files/
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
