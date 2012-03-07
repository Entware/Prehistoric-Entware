# Makefile for OpenWrt Buildroot. It fixes buildroot and its packages for using on Asus RT-Nxx with wl500g.googlecode.com firmware
#
# Copyright (C) 2011 Ryzhov Alexander
# 
# This is free software, licensed under the GNU General Public License v2.
#
include ./config.mk

all: .toolchain_installed .buildroot_installed .packages_prepared

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
	(cd ..; \
	svn co svn://svn.openwrt.org/openwrt/trunk/ ./trunk; \
	cd ./trunk; \
	./scripts/feeds update packages; \
	./scripts/feeds install -a -p packages; \
	cp -f ../rtn/buildroot/feeds.conf ./; \
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

.PHONY : clean