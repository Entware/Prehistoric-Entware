#
# Copyright (C) 2011-2014 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	mkdir -p ../../../openwrt_trunk/feeds/packages/net/umurmur/files
	cp -f ./S73umurmurd ../../../openwrt_trunk/feeds/packages/net/umurmur/files/
	rm -f ../../../openwrt_trunk/feeds/packages/net/umurmur/patches/100-polarssl_backport.patch
	rm -f ../../../openwrt_trunk/feeds/packages/net/umurmur/patches/110-reduced_polarssl_support.patch
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
