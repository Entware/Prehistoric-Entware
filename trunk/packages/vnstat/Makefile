#
# Copyright (C) 2011-2012 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: ./.done

./.done:
	patch -p0 -i ./fix-path.patch
	cp -f ./010-cfg-and-db-paths.patch ../../../trunk/feeds/packages/net/vnstat/patches/
	cp ./S32vnstat ../../../trunk/feeds/packages/net/vnstat/files/
	touch $@

clean:
	rm -f ./.done

.PHONY : clean
