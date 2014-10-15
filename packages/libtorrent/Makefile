#
# Copyright (C) 2011-2014 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	rm -f ../../../openwrt_trunk/feeds/packages/libs/libtorrent/patches/120-fix-ipv6_socket_datagram.patch
	echo "Killing duplicate package from oldpackage feed"
	rm -fr ../../../openwrt_trunk/feeds/oldpackages/libs/libtorrent
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
