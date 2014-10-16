#
# Copyright (C) 2011-2014 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	cp -f ./S10xinetd ../../../openwrt_trunk/feeds/packages/net/xinetd/files/
	cp -f ./500-opt_dir.patch ../../../openwrt_trunk/feeds/packages/net/xinetd/patches/
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
