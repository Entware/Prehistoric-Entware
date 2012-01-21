# Makefile for OpenWrt Buildroot 
#
# Copyright (C) 2011 Ryzhov Alexander
# 
# This is free software, licensed under the GNU General Public License v2.
#


all: ./.done

./.done:
	@for php_patch in `ls -1 ./fix-path-*.patch`; do ( \
		patch -p0 -i $$php_patch; \
	); done
	touch $@

clean:
	rm -f ./.done

.PHONY : clean