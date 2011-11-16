# Makefile for OpenWrt Buildroot 
#
# Copyright (C) 2011 Ryzhov Alexander
# 
# This is free software, licensed under the GNU General Public License v2.
#


all: ./.done

./.done:
	tar -C ../../../trunk -xvf ./rtn-target.tgz
	patch -p0 -i ./package-ipkg.patch
	patch -p0 -i ./nls.patch
	patch -p0 -i ./cmake.patch
	patch -p0 -i ./package-defaults.patch
	patch -p0 -i ./rules.patch
	patch -p0 -i ./autotools.patch
	patch -p0 -i ./sdk-rules.patch
	patch -p0 -i ./package.patch
	patch -p0 -i ./include-package.patch
	echo CONFIG_TARGET_rtn=y > ../../../trunk/.config
	make -C ../../../trunk defconfig
	cp -f ./.config ../../../trunk/.config
	make -C ../../../trunk tools/clean
	make -C ../../../trunk tools/compile
	make -C ../../../trunk tools/install
	touch $@

clean:
	rm -f ./.done

.PHONY : clean