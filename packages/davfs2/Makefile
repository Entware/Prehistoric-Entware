#
# Copyright (C) 2011-2014 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	rm -f ../../../openwrt_trunk/feeds/packages/net/davfs2/patches/010-main_code_fix.patch
	cp -f ./0*.patch ../../../openwrt_trunk/feeds/packages/net/davfs2/patches/
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
