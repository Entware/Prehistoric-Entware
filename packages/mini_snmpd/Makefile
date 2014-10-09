#
# Copyright (C) 2011-2014 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	cp -f ./S50mini_snmpd ../../../openwrt_trunk/feeds/oldpackages/net/mini_snmpd/files/
	cp -f ./200-counter64.patch ../../../openwrt_trunk/feeds/oldpackages/net/mini_snmpd/patches/
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
