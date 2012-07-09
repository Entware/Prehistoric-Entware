#
# Copyright (C) 2011-2012 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include ../config.mk

all: .done

.done:
	tar -C ../../openwrt_trunk -xvf ./entware-target.tgz
	patch -p0 -i ./package-ipkg.patch
	patch -p0 -i ./nls.patch
	patch -p0 -i ./cmake.patch
	@echo Warning: See ./include/package-defaults.mk for absolute path to linux kernel
	patch -p0 -i ./package-defaults.patch
	sed -i 's,/media/BuildRepo/kernel-1.9.2.7-rtn/src/linux/linux-2.6,${CURDIR}/../../kernel-1.9.2.7-rtn/src/linux/linux-2.6,g' ../../openwrt_trunk/include/package-defaults.mk
	patch -p0 -i ./rules.patch
	patch -p0 -i ./autotools.patch
	patch -p0 -i ./sdk-rules.patch
	patch -p0 -i ./package.patch
	patch -p0 -i ./include-package.patch
	patch -p0 -i ./add-mirror.patch
	echo CONFIG_TARGET_rtn=y > ../../openwrt_trunk/.config
	make -C ../../openwrt_trunk defconfig
	cp -f .config ../../openwrt_trunk/.config
	touch $@

clean:
	rm -f ./.done

.PHONY : clean
