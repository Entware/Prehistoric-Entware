# Makefile for OpenWrt Buildroot 
#
# Copyright (C) 2011 Ryzhov Alexander
# 
# This is free software, licensed under the GNU General Public License v2.
#


all: ./.done

./.done:
	patch -p0 -i ./fix-path.patch
	cp ./005-dont-flood-with-dropped-o-messages.patch ../../../trunk/feeds/packages/admin/syslog-ng/patches/
	cp ./S01syslog-ng ../../../trunk/feeds/packages/admin/syslog-ng/files/
	touch $@

clean:
	rm -f ./.done

.PHONY : clean