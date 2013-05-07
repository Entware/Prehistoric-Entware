#
# Copyright (C) 2011-2013 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: ./.done

./.done:
	patch -p0 -i ./fix-path.patch
	cp -f ./500-libzrtp-byte-order.patch ../../../openwrt_trunk/feeds/telephony/freeswitch/patches/
	cp -f ./501-ldns-linkage.patch ../../../openwrt_trunk/feeds/telephony/freeswitch/patches/
	touch $@

clean:
	rm -f ./.done

.PHONY : clean
