#
# Copyright (C) 2011-2012 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: ./.done

./.done:
	patch -p0 -i ./fix-path.patch
	rm ../../../openwrt_trunk/feeds/packages/libs/libiconv-full/patches/100-strip_charsets.patch
	touch $@

clean:
	rm -f ./.done

.PHONY : clean
