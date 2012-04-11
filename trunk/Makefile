# Makefile for a Entware repository building.
# It creates an OpenWRT packages for using /opt folder on various firmwares.
#
# Copyright (C) 2011, 2012 Ryzhov Alexander
#
# This is free software, licensed under the GNU General Public License v2.
#
include ./config.mk

all: .toolchain_installed .buildroot_installed .packages_prepared .packages_compiled

packages_compile: .packages_compiled
.packages_compiled:
	make -C "../trunk" tools/compile
	make -C "../trunk" tools/install
	make -C "../trunk" package/compile
	make -C "../trunk" package/index
	touch $@

packages: .packages_prepared
.packages_prepared:
	@echo Processing OpenWRT packages...
	@for dir in `ls ./packages`; do ( \
	    make -C "./packages/$$dir"; \
	); done
	@echo Done!
	touch $@

buildroot: .buildroot_installed
.buildroot_installed:
	@echo Deploying OpenWRT Buildroot...
	svn co --revision=$(OPENWRT_REVISION) svn://svn.openwrt.org/openwrt/trunk/ ../trunk
	cp -f ./buildroot/feeds.conf ../trunk
	sed -i 's,packages@XXXXX,packages@${OPENWRT_REVISION},g' ../trunk/feeds.conf
	(cd ../trunk; \
	./scripts/feeds update packages; \
	./scripts/feeds install -a -p packages; \
	./scripts/feeds update rtndev; \
	./scripts/feeds install -a -p rtndev)
ifeq ($(BUILDROOT_BACKUP),yes)
	mkdir -p ../trunk_clean
	cp --recursive --update --force ../trunk/* ../trunk_clean
endif
	make -C "./buildroot"
	touch $@

toolchain: .toolchain_installed
.toolchain_installed:
	make -C "./toolchain"
	touch $@

clean:
	@for dir in `ls ./packages`; do ( \
	    make -C "./packages/$$dir" clean; \
	); done
	rm -f .packages_prepared
	make -C "./buildroot" clean
	rm -f .buildroot_installed
	make -C "./toolchain" clean
	rm -f .toolchain_installed
	rm -f .toolchain_downloaded
	rm -f .packages_compiled

.PHONY : clean