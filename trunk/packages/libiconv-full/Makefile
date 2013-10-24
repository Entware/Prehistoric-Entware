#
# Copyright (C) 2011-2013 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	rm -f ../../../openwrt_trunk/package/libs/libiconv-full/patches/100-strip_charsets.patch
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
