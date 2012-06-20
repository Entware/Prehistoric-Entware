#
# Copyright (C) 2011-2012 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: ./.done

./.done:
	patch -p0 -i ./fix-path.patch
	cp ./110-remove-accep4-support.patch ../../../trunk/feeds/packages/net/nginx/patches/
	cp ./S80nginx ../../../trunk/feeds/packages/net/nginx/files/
	touch $@

clean:
	rm -f ./.done

.PHONY : clean
