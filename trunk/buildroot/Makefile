#
# Copyright (C) 2011-2013 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include ../config.mk

all: .done

.done:
	tar -C $(TOP)/openwrt_trunk -xvf ./entware-target.tgz
	patch -d $(TOP) -p2 -i $(CURDIR)/package-ipkg.patch
	patch -d $(TOP) -p2 -i $(CURDIR)/nls.patch
	patch -d $(TOP) -p2 -i $(CURDIR)/cmake.patch
	@echo Warning: See ./include/package-defaults.mk for absolute path to linux kernel
	patch -d $(TOP) -p2 -i $(CURDIR)/package-defaults.patch
	sed -i 's,__LINUX_DIR_PATH__,$(TOP)/linux-2.6.22.19,g' $(TOP)/openwrt_trunk/include/package-defaults.mk
	patch -d $(TOP) -p2 -i $(CURDIR)/rules.patch
	patch -d $(TOP) -p2 -i $(CURDIR)/autotools.patch
	patch -d $(TOP) -p2 -i $(CURDIR)/sdk-rules.patch
	patch -d $(TOP) -p2 -i $(CURDIR)/package.patch
	patch -d $(TOP) -p2 -i $(CURDIR)/include-package.patch
	patch -d $(TOP) -p2 -i $(CURDIR)/ipkg-make-index.patch
	patch -d $(TOP) -p2 -i $(CURDIR)/add-mirrors.patch
	echo CONFIG_TARGET_rtn=y > $(TOP)/openwrt_trunk/.config
	make -C $(TOP)/openwrt_trunk defconfig
	cp -f .config $(TOP)/openwrt_trunk/.config
	touch $@

distclean:
	rm -f ./.done

clean:
	rm -f ./.done
	rm -fr $(TOP)/openwrt_trunk

.PHONY : distclean clean
