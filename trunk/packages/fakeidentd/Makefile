#
# Copyright (C) 2011-2013 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: ./.done

./.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	rm -r ../../../openwrt_trunk/feeds/packages/net/fakeidentd/files/fakeidentd.init
	cp ./S85fakeidentd ../../../openwrt_trunk/feeds/packages/net/fakeidentd/files/
	touch $@

clean:
	rm -f ./.done

.PHONY : clean
