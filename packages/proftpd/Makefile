#
# Copyright (C) 2011-2014 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	cp -f ./500-disable-ssp-suport.patch ../../../openwrt_trunk/feeds/oldpackages/net/proftpd/patches/
	cp -f ./S66proftpd ../../../openwrt_trunk/feeds/oldpackages/net/proftpd/files/
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
