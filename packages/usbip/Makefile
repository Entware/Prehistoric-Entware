#
# Copyright (C) 2011-2014 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	mkdir -p ../../../openwrt_trunk/feeds/oldpackages/net/usbip/files
	cp -f ./S74usbipd ../../../openwrt_trunk/feeds/oldpackages/net/usbip/files/
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
