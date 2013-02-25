#
# Copyright (C) 2011-2013 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: ./.done

./.done:
	patch -p0 -i ./fix-path.patch
	cp ./005-dont-flood-with-dropped-o-messages.patch ../../../openwrt_trunk/feeds/packages/admin/syslog-ng/patches/
	cp ./S01syslog-ng ../../../openwrt_trunk/feeds/packages/admin/syslog-ng/files/
	touch $@

clean:
	rm -f ./.done

.PHONY : clean
