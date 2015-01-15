#
# Copyright (C) 2011-2015 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	mkdir -p ../../../openwrt_trunk/package/libs/toolchain/files/
	cp -f nsswitch_qnap.conf ../../../openwrt_trunk/package/libs/toolchain/files/
	cp -f nsswitch_syno.conf ../../../openwrt_trunk/package/libs/toolchain/files/
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
