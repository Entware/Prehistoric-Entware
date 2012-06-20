#
# Copyright (C) 2011-2012 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: ./.done

./.done:
	patch -p0 -i ./fix-path.patch
	rm ../../../trunk/feeds/packages/net/transmission/files/transmission.*
	cp ./settings.json ../../../trunk/feeds/packages/net/transmission/files/
	cp ./S88transmission ../../../trunk/feeds/packages/net/transmission/files/
	touch $@

clean:
	rm -f ./.done

.PHONY : clean
