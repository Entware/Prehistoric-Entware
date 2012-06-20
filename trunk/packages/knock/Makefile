#
# Copyright (C) 2011-2012 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: ./.done

./.done:
	patch -p0 -i ./fix-path.patch
	mkdir ../../../trunk/feeds/packages/net/knock/patches
	 cp ./010-cross-compile.patch ../../../trunk/feeds/packages/net/knock/patches/
	mkdir ../../../trunk/feeds/packages/net/knock/files
	cp ./S05knockd ../../../trunk/feeds/packages/net/knock/files/
	touch $@

clean:
	rm -f ./.done

.PHONY : clean
