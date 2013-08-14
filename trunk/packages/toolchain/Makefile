#
# Copyright (C) 2011-2013 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: ./.done

./.done:
	patch -p0 -i ./fix-path.patch
	@echo Check uClibc/GCC versions at ./openwrt_trunk/package/libs/toolchain/Makefile.
	touch $@

clean:
	rm -f ./.done

.PHONY : clean
