#
# Copyright (C) 2011-2013 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: ./.done

./.done:
	patch -p0 -i ./fix-path.patch
	cp ./S31asterisk ../../../openwrt_trunk/feeds/telephony/net/asterisk-1.8.x/files/
	touch $@

clean:
	rm -f ./.done

.PHONY : clean
