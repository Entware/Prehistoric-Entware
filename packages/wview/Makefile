#
# Copyright (C) 2011-2014 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	rm -f ../../../openwrt_trunk/feeds/oldpackages/utils/wview/patches/020-use-standard-awk.patch
	rm -f ../../../openwrt_trunk/feeds/oldpackages/utils/wview/patches/050-WMRUSB-fix-segfault-buffer-overflow.patch
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
