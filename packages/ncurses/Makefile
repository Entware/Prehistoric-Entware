#
# Copyright (C) 2011-2015 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	rm -f ../../../openwrt_trunk/package/libs/ncurses/patches/100-ncurses-5.6-20080112-urxvt.patch
	rm -f ../../../openwrt_trunk/package/libs/ncurses/patches/101-ncurses-5.6-20080628-kbs.patch
	rm -f ../../../openwrt_trunk/package/libs/ncurses/patches/102-ncurses-5.9-gcc-5.patch
	rm -f ../../../openwrt_trunk/package/libs/ncurses/patches/200-fix_missing_include.patch
	rm -f ../../../openwrt_trunk/package/libs/ncurses/patches/500-cross.patch
	rm -f ../../../openwrt_trunk/package/libs/ncurses/patches/900-terminfo.patch
	cp -f ./100-20130202.patch ../../../openwrt_trunk/package/libs/ncurses/patches/
	@touch $@

clean:
	@rm -f .done

.PHONY: clean
