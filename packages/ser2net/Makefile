#
# Copyright (C) 2011-2015 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	rm -f ../../../openwrt_trunk/feeds/packages/net/ser2net/patches/001-fix_TIOCSRS485_undeclared_error.patch
	cp -f ./001-linux-headers.patch ../../../openwrt_trunk/feeds/packages/net/ser2net/patches/
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
