#
# Copyright (C) 2011-2015 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/010-Makefile.patch
	patch -d $(TOP) -p3 -i $(CURDIR)/020-Config-defaults.patch
	cp -f ./999-entware-path.patch ../../../openwrt_trunk/package/utils/busybox/patches/
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
