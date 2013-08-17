#
# Copyright (C) 2011-2013 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# Makefile for a Entware repository building.
# It creates an OpenWRT packages for using /opt folder on various firmwares.
#

include ./config.mk
export TOP:=$(shell (cd .. && pwd -P))

all: .toolchain_installed .buildroot_installed .packages_prepared .packages_compiled

packages_compile: .packages_compiled
.packages_compiled:
	make -C "$(TOP)/openwrt_trunk" tools/compile
	make -C "$(TOP)/openwrt_trunk" tools/install
	@echo Press \"Ctrl + c\" if you don\'t need to compile whole repository...
	make -C "$(TOP)/openwrt_trunk" package/compile
	make -C "$(TOP)/openwrt_trunk" package/index
	touch $@

packages: .packages_prepared

.packages_prepared: .packages_path.mk
	@echo Processing OpenWRT packages...
	@set -e; for dir in `ls ./packages | sort`; do ( \
	    echo Processing "$$dir"; \
	    if [ -e ./packages/$$dir/Makefile ]; then \
		make -C "./packages/$$dir" ; \
	    else \
		make -C "./packages/$$dir" -f ../../Makefile.package PK_NAME="$$dir"; \
	    fi; \
	); done
	@echo Done!
	touch $@

.packages_path.mk:
	@ruby ./index_scan.rb
	@echo "Feeds index processed!"

buildroot: .buildroot_installed
.buildroot_installed:
	@echo Deploying OpenWRT Buildroot...
	[ -d $(TOP)/downloads ] || mkdir -p $(TOP)/downloads
	if [ -d $(TOP)/downloads/openwrt_trunk-r$(OPENWRT_REVISION) ]; then \
		mkdir -p $(TOP)/openwrt_trunk ; \
		cp --recursive --update --force $(TOP)/downloads/openwrt_trunk-r$(OPENWRT_REVISION)/* $(TOP)/openwrt_trunk ; \
	else \
		svn co --revision=$(OPENWRT_REVISION) svn://svn.openwrt.org/openwrt/trunk/ $(TOP)/openwrt_trunk ; \
		cp -f ./buildroot/feeds.conf $(TOP)/openwrt_trunk ; \
		(cd $(TOP)/openwrt_trunk ; \
		    for feed in packages routing telephony rtndev ; \
		    do \
			./scripts/feeds update $$feed ; \
			./scripts/feeds install -a -p $$feed ; \
		    done) ; \
		mkdir -p $(TOP)/downloads/openwrt_trunk-r$(OPENWRT_REVISION) ; \
		cp --recursive --update --force $(TOP)/openwrt_trunk/* $(TOP)/downloads/openwrt_trunk-r$(OPENWRT_REVISION) ; \
	fi
	ln -sf $(TOP)/downloads $(TOP)/openwrt_trunk/dl
	make -C "./buildroot"
	touch $@

toolchain: .toolchain_installed
.toolchain_installed:
	[ -d $(TOP)/downloads ] || mkdir -p $(TOP)/downloads
	make -C "./toolchain"
	touch $@

distclean clean:
	@for dir in `ls ./packages`; do ( \
	    make -C "./packages/$$dir" clean; \
	); done
	rm -f .packages_prepared
	make -C "./buildroot" distclean
	rm -f .buildroot_installed
	make -C "./toolchain" distclean
	rm -f .toolchain_installed
	rm -f .packages_compiled
	rm -f .packages_path.mk

.PHONY : distclean clean
