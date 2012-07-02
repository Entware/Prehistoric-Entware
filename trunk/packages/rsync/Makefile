#
# Copyright (C) 2011-2012 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: ./.done

./.done:
	patch -p0 -i ./fix-path.patch
	cp ./S50rsyncd ../../../trunk/feeds/packages/net/rsync/files/
	cp ./rsyncd ../../../trunk/feeds/packages/net/rsync/files/
	touch $@

clean:
	rm -f ./.done

.PHONY : clean
