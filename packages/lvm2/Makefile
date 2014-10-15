#
# Copyright (C) 2011-2014 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	cp -f ./100-lvm_fix.patch ../../../openwrt_trunk/feeds/oldpackages/utils/lvm2/patches/
	cp -f ./S06lvm2 ../../../openwrt_trunk/feeds/oldpackages/utils/lvm2/files/
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
