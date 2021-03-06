#
# Copyright (C) 2011-2015 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

export TOP?=$(shell (cd ../.. && pwd -P))
include ../config.mk

all: .buildroot_prepared

.buildroot_prepared: $(TOP)/downloads/openwrt_trunk-$(OPENWRT_COMMIT)
	if [ ! -d "$(TOP)/openwrt_trunk" ]; \
	then \
	    mkdir $(TOP)/openwrt_trunk; \
	    cp -fr $(TOP)/downloads/openwrt_trunk-$(OPENWRT_COMMIT)/* $(TOP)/openwrt_trunk; \
	fi
	@echo "Adding new targets..."
	cp -fr ./targets/* ../../openwrt_trunk/target/linux
	@echo "Applying patches..."
	@for patch in `ls $(CURDIR)/patches/*.patch | sort`; do ( \
                patch -d $(TOP) -p3 -i $$patch; \
        ); done
	@echo "Adding custom config..."
	cp -f .config $(TOP)/openwrt_trunk/.config
	@touch $@

$(TOP)/downloads/openwrt_trunk-$(OPENWRT_COMMIT): \
	    $(TOP)/downloads
	git clone https://github.com/openwrt/openwrt $(TOP)/openwrt_trunk
	(cd $(TOP)/openwrt_trunk; git checkout $(OPENWRT_COMMIT))
	cp -f feeds.conf $(TOP)/openwrt_trunk
	(cd $(TOP)/openwrt_trunk; \
	./scripts/feeds update; \
	./scripts/feeds install -a;)
	mkdir -p $(TOP)/downloads/openwrt_trunk-$(OPENWRT_COMMIT)
	ln -sf $(TOP)/downloads $(TOP)/openwrt_trunk/dl
	cp -fr $(TOP)/openwrt_trunk/* $(TOP)/downloads/openwrt_trunk-$(OPENWRT_COMMIT)

$(TOP)/downloads:
	[ -d "$(TOP)/downloads" ] || mkdir -p "$(TOP)/downloads"

clean:
	@rm -f .buildroot_prepared

cleanall: clean
	@rm -rf $(TOP)/openwrt_trunk

.PHONY: clean cleanall all
