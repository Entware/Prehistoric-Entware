#
# Copyright (C) 2011-2013 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: ./.done

./.done:
	patch -p0 -i ./fix-path.patch
	patch -p0 -i ./add-bin.patch
	cp ./S70mysqld ../../../openwrt_trunk/feeds/packages/libs/mysql/files/
	touch $@

clean:
	rm -f ./.done

.PHONY : clean
