#
# Copyright (C) 2011-2013 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

export TOP?=$(shell (cd ../../.. && pwd -P))
include ../../config.mk

all: .buildroot_prepared

.buildroot_prepared: $(TOP)/downloads/$(TARGET)/openwrt_trunk-r$(OPENWRT_REVISION)
	if [ ! -d "$(TOP)/openwrt_trunk" ]; \
	then \
	    mkdir $(TOP)/openwrt_trunk; \
	    cp -fr $(TOP)/downloads/$(TARGET)/openwrt_trunk-r$(OPENWRT_REVISION)/* $(TOP)/openwrt_trunk; \
	fi
	tar -C $(TOP)/openwrt_trunk -xvf entware-target.tgz
	patch -d $(TOP) -p3 -i $(CURDIR)/package-ipkg.patch
	patch -d $(TOP) -p3 -i $(CURDIR)/nls.patch
	patch -d $(TOP) -p3 -i $(CURDIR)/cmake.patch
	@echo Warning: See include/package-defaults.mk for absolute path to linux kernel
	patch -d $(TOP) -p3 -i $(CURDIR)/package-defaults.patch
	sed -i 's,__LINUX_DIR_PATH__,$(TOP)/linux-2.6.22.19,g' $(TOP)/openwrt_trunk/include/package-defaults.mk
	patch -d $(TOP) -p3 -i $(CURDIR)/rules.patch
	patch -d $(TOP) -p3 -i $(CURDIR)/autotools.patch
	patch -d $(TOP) -p3 -i $(CURDIR)/sdk-rules.patch
	patch -d $(TOP) -p3 -i $(CURDIR)/package.patch
	patch -d $(TOP) -p3 -i $(CURDIR)/include-package.patch
	patch -d $(TOP) -p3 -i $(CURDIR)/ipkg-make-index.patch
	patch -d $(TOP) -p3 -i $(CURDIR)/add-mirrors.patch
	echo CONFIG_TARGET_rtn=y > $(TOP)/openwrt_trunk/.config
	$(MAKE) -C $(TOP)/openwrt_trunk defconfig
	cp -f .config $(TOP)/openwrt_trunk/.config
	@touch $@

$(TOP)/downloads/$(TARGET)/openwrt_trunk-r$(OPENWRT_REVISION): \
	    $(TOP)/downloads/$(TARGET)
	svn co --revision=$(OPENWRT_REVISION) svn://svn.openwrt.org/openwrt/trunk/ $(TOP)/openwrt_trunk
	cp -f feeds.conf $(TOP)/openwrt_trunk
	(cd $(TOP)/openwrt_trunk; \
	    for feed in packages routing telephony rtndev; \
	    do \
		./scripts/feeds update $$feed; \
		./scripts/feeds install -a -p $$feed; \
	    done)
	mkdir -p $(TOP)/downloads/$(TARGET)/openwrt_trunk-r$(OPENWRT_REVISION)
	cp --recursive --update --force $(TOP)/openwrt_trunk/* $(TOP)/downloads/$(TARGET)/openwrt_trunk-r$(OPENWRT_REVISION)
	ln -sf $(TOP)/downloads $(TOP)/openwrt_trunk/dl

$(TOP)/downloads/$(TARGET):
	[ -d "$(TOP)/downloads/$(TARGET)" ] || mkdir -p "$(TOP)/downloads/$(TARGET)"

clean:
	@rm -f .buildroot_prepared

cleanall: clean
	@rm -rf $(TOP)/downloads/$(TARGET)/openwrt_trunk-r$(OPENWRT_REVISION)

.PHONY: clean cleanall all
