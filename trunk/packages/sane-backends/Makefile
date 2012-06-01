# Makefile for OpenWrt Buildroot 
#
# Copyright (C) 2011 Ryzhov Alexander
# 
# This is free software, licensed under the GNU General Public License v2.
#


all: ./.done

./.done:
	patch -p0 -i ./fix-path.patch
	cp ./040-xerox-sams.patch ../../../trunk/feeds/packages/utils/sane-backends/patches/
	mkdir ../../../trunk/feeds/packages/utils/sane-backends/files
	 cp ./S01sane-backends ../../../trunk/feeds/packages/utils/sane-backends/files/
	touch $@

clean:
	rm -f ./.done

.PHONY : clean