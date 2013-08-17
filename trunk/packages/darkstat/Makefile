#
# Copyright (C) 2011-2013 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: ./.done

./.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	cp ./S54darkstat ../../../openwrt_trunk/feeds/packages/net/darkstat/files/
	touch $@

clean:
	rm -f ./.done

.PHONY : clean
