#
# Copyright (C) 2011-2012 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: ./.done

./.done:
	patch -p0 -i ./fix-path.patch
	cp -f ./050-inotify_fix.patch ../../../trunk/feeds/packages/multimedia/minidlna/patches/
	cp ./S90minidlna ../../../trunk/feeds/packages/multimedia/minidlna/files/
	touch $@

clean:
	rm -f ./.done

.PHONY : clean
