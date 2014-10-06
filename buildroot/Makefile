#
# Copyright (C) 2011-2014 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

export TOP?=$(shell (cd ../.. && pwd -P))
include ../config.mk

all: .buildroot_prepared

.buildroot_prepared: $(TOP)/downloads/openwrt_trunk-r$(OPENWRT_REVISION)
	if [ ! -d "$(TOP)/openwrt_trunk" ]; \
	then \
	    mkdir $(TOP)/openwrt_trunk; \
	    cp -fr $(TOP)/downloads/openwrt_trunk-r$(OPENWRT_REVISION)/* $(TOP)/openwrt_trunk; \
	fi
	@echo "Adding new targets..."
	cp -fr ./targets/* ../../openwrt_trunk/target/linux
	@echo "Applying patches..."
	@for patch in `ls $(CURDIR)/patches/*.patch | sort`; do ( \
                patch -d $(TOP) -p3 -i $$patch; \
        ); done
	sed -i 's,__LINUX_DIR_PATH__,$$(TOPDIR)/../linux-2.6.22.19,g' $(TOP)/openwrt_trunk/include/package-defaults.mk
	@echo "Adding custom config..."
	cp -f .config $(TOP)/openwrt_trunk/.config
	@touch $@

$(TOP)/downloads/openwrt_trunk-r$(OPENWRT_REVISION): \
	    $(TOP)/downloads
	svn co --revision=$(OPENWRT_REVISION) svn://svn.openwrt.org/openwrt/trunk/ $(TOP)/openwrt_trunk
	cp -f feeds.conf $(TOP)/openwrt_trunk
	(cd $(TOP)/openwrt_trunk; \
	    for feed in packages routing telephony management oldpackages rtndev; \
	    do \
		./scripts/feeds update $$feed; \
		./scripts/feeds install -a -p $$feed; \
	    done)
	mkdir -p $(TOP)/downloads/openwrt_trunk-r$(OPENWRT_REVISION)
	ln -sf $(TOP)/downloads $(TOP)/openwrt_trunk/dl
	cp -fr $(TOP)/openwrt_trunk/* $(TOP)/downloads/openwrt_trunk-r$(OPENWRT_REVISION)

$(TOP)/downloads:
	[ -d "$(TOP)/downloads" ] || mkdir -p "$(TOP)/downloads"

clean:
	@rm -f .buildroot_prepared

cleanall: clean
	@rm -rf $(TOP)/openwrt_trunk

.PHONY: clean cleanall all
