#
# Copyright (C) 2011-2012 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: ./.done

./.done:
	patch -p0 -i ./fix-path.patch
	cp ./005-disable-ssp-suport.patch ../../../openwrt_trunk/feeds/packages/net/proftpd/patches/
	cp ./S66proftpd ../../../openwrt_trunk/feeds/packages/net/proftpd/files/
	touch $@

clean:
	rm -f ./.done

.PHONY : clean
