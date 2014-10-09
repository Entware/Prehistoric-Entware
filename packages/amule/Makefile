#
# Copyright (C) 2011-2014 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	mkdir -p ../../../openwrt_trunk/feeds/oldpackages/net/amule/files/
	cp -f ./S57amuled ../../../openwrt_trunk/feeds/oldpackages/net/amule/files/
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
