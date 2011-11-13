# Makefile for OpenWrt Buildroot 
#
# Copyright (C) 2011 Ryzhov Alexander
# 
# This is free software, licensed under the GNU General Public License v2.
#


all: ./.done

./.done:
	tar -C ../../../trunk -xvf ./rtn-target.tgz
	patch -p0 -i ./package-defaults.patch
	patch -p0 -i ./rules.patch
	echo CONFIG_TARGET_rtn=y > ../../../trunk/.config
	make -C ../../../trunk defconfig
	cp -f /.config ../../../trunk/.config
	touch $@

clean:
	rm -f ./.done

.PHONY : clean