#
# Copyright (C) 2011-2012 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: ./.done

./.done:
	patch -p0 -i ./fix-path.patch
	mkdir -p ../../../openwrt_trunk/feeds/packages/utils/hdparm/patches/
	cp -f ./010-add-LDFLAGS.patch ../../../openwrt_trunk/feeds/packages/utils/hdparm/patches/
	touch $@

clean:
	rm -f ./.done

.PHONY : clean
